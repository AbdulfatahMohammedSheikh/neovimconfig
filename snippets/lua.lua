local ls = require("luasnip")
-- some shorthands...
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local l = require("luasnip.extras").lambda
local rep = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local types = require("luasnip.util.types")
local conds = require("luasnip.extras.conditions")
local conds_expand = require("luasnip.extras.conditions.expand")

-- If you're reading this file for the first time, best skip to around line 190
-- where the actual snippet-definitions start.

-- Every unspecified option will be set to the default.
ls.setup({
    history = true,
    -- Update more often, :h events for more info.
    update_events = "TextChanged,TextChangedI",
    -- Snippets aren't automatically removed if their text is deleted.
    -- `delete_check_events` determines on which events (:h events) a check for
    -- deleted snippets is performed.
    -- This can be especially useful when `history` is enabled.
    delete_check_events = "TextChanged",
    ext_opts = {
        [types.choiceNode] = {
            active = {
                virt_text = { { "choiceNode", "Comment" } },
            },
        },
    },
    -- treesitter-hl has 100, use something higher (default is 200).
    ext_base_prio = 300,
    -- minimal increase in priority.
    ext_prio_increase = 1,
    enable_autosnippets = true,
    -- mapping for cutting selected text so it's usable as SELECT_DEDENT,
    -- SELECT_RAW or TM_SELECTED_TEXT (mapped via xmap).
    store_selection_keys = "<Tab>",
    -- luasnip uses this function to get the currently active filetype. This
    -- is the (rather uninteresting) default, but it's possible to use
    -- eg. treesitter for getting the current filetype by setting ft_func to
    -- require("luasnip.extras.filetype_functions").from_cursor (requires
    -- `nvim-treesitter/nvim-treesitter`). This allows correctly resolving
    -- the current filetype in eg. a markdown-code block or `vim.cmd()`.
    ft_func = function()
        return vim.split(vim.bo.filetype, ".", true)
    end,
})

-- args is a table, where 1 is the text in Placeholder 1, 2 the text in
-- placeholder 2,...
local function copy(args)
    return args[1]
end

-- 'recursive' dynamic snippet. Expands to some text followed by itself.
local rec_ls
rec_ls = function()
    return sn(
        nil,
        c(1, {
            -- Order is important, sn(...) first would cause infinite loop of expansion.
            t(""),
            sn(nil, { t({ "", "\t\\item " }), i(1), d(2, rec_ls, {}) }),
        })
    )
end

-- complicated function for dynamicNode.
local function jdocsnip(args, _, old_state)
    -- !!! old_state is used to preserve user-input here. DON'T DO IT THAT WAY!
    -- Using a restoreNode instead is much easier.
    -- View this only as an example on how old_state functions.
    local nodes = {
        t({ "/**", " * " }),
        i(1, "A short Description"),
        t({ "", "" }),
    }

    -- These will be merged with the snippet; that way, should the snippet be updated,
    -- some user input eg. text can be referred to in the new snippet.
    local param_nodes = {}

    if old_state then
        nodes[2] = i(1, old_state.descr:get_text())
    end
    param_nodes.descr = nodes[2]

    -- At least one param.
    if string.find(args[2][1], ", ") then
        vim.list_extend(nodes, { t({ " * ", "" }) })
    end

    local insert = 2
    for indx, arg in ipairs(vim.split(args[2][1], ", ", true)) do
        -- Get actual name parameter.
        arg = vim.split(arg, " ", true)[2]
        if arg then
            local inode
            -- if there was some text in this parameter, use it as static_text for this new snippet.
            if old_state and old_state[arg] then
                inode = i(insert, old_state["arg" .. arg]:get_text())
            else
                inode = i(insert)
            end
            vim.list_extend(
                nodes,
                { t({ " * @param " .. arg .. " " }), inode, t({ "", "" }) }
            )
            param_nodes["arg" .. arg] = inode

            insert = insert + 1
        end
    end

    if args[1][1] ~= "void" then
        local inode
        if old_state and old_state.ret then
            inode = i(insert, old_state.ret:get_text())
        else
            inode = i(insert)
        end

        vim.list_extend(
            nodes,
            { t({ " * ", " * @return " }), inode, t({ "", "" }) }
        )
        param_nodes.ret = inode
        insert = insert + 1
    end

    if vim.tbl_count(args[3]) ~= 1 then
        local exc = string.gsub(args[3][2], " throws ", "")
        local ins
        if old_state and old_state.ex then
            ins = i(insert, old_state.ex:get_text())
        else
            ins = i(insert)
        end
        vim.list_extend(
            nodes,
            { t({ " * ", " * @throws " .. exc .. " " }), ins, t({ "", "" }) }
        )
        param_nodes.ex = ins
        insert = insert + 1
    end

    vim.list_extend(nodes, { t({ " */" }) })

    local snip = sn(nil, nodes)
    -- Error on attempting overwrite.
    snip.old_state = param_nodes
    return snip
end

-- Make sure to not pass an invalid command, as io.popen() may write over nvim-text.
local function bash(_, _, command)
    local file = io.popen(command, "r")
    local res = {}
    for line in file:lines() do
        table.insert(res, line)
    end
    return res
end

-- Returns a snippet_node wrapped around an insertNode whose initial
-- text value is set to the current date in the desired format.
local date_input = function(args, snip, old_state, fmt)
    local fmt = fmt or "%Y-%m-%d"
    return sn(nil, i(1, os.date(fmt)))
end

-- snippets are added via ls.add_snippets(filetype, snippets[, opts]), where
-- opts may specify the `type` of the snippets ("snippets" or "autosnippets",
-- for snippets that should expand directly after the trigger is typed).
--
-- opts can also specify a key. By passing an unique key to each add_snippets, it's possible to reload snippets by
-- re-`:luafile`ing the file in which they are defined (eg. this one).
ls.add_snippets("lua", {
    -- trigger is `fn`, second argument to snippet-constructor are the nodes to insert into the buffer on expansion.
    --
    s("todo", {
        t("-- TODO: "),
        i(1, "enter todo")
    }),

    s("fixme", {
        t("-- FIXME: "),
        i(1, "enter todo")
    }),

    s("bug", {
        t("-- BUG: "),
        i(1, "enter todo")
    }),


    s("warning", {
        t("-- WARNING: "),
        i(1, "enter todo")
    }),

    -- Parsing snippets: First parameter: Snippet-Trigger, Second: Snippet body.
    -- Placeholders are parsed into choices with 1. the placeholder text(as a snippet) and 2. an empty string.
    -- This means they are not SELECTed like in other editors/Snippet engines.
    ls.parser.parse_snippet(
        "lspsyn",
        "Wow! This ${1:Stuff} really ${2:works. ${3:Well, a bit.}}"
    ),

    -- When wordTrig is set to false, snippets may also expand inside other words.
    ls.parser.parse_snippet(
        { trig = "te", wordTrig = false },
        "${1:cond} ? ${2:true} : ${3:false}"
    ),
    -- When regTrig is set, trig is treated like a pattern, this snippet will expand after any number.
    ls.parser.parse_snippet({ trig = "%d", regTrig = true }, "A Number!!"),
    -- Using the condition, it's possible to allow expansion only in specific cases.
    -- Shorthand for repeating the text in a given node.
}, {
    key = "lua",
})


-- FIXME: create a file for each langage and make sure that the code before creatring the snoppets is reusable among the different files

ls.add_snippets("go", {

    s("fn", {
        t("func "),
        i(1, "name"),

        t(" ("),
        i(2, "args"),
        t(" ) "),
        t({ " {", "\t" }),
        t(" } "),
    }),

    s("struct", {
        t("type "),
        i(1, "name"),
        t({ " struct {", "\t}" })
    }),

    s("for", {
        t("for "),
        i(1, "condition"),
        t({ "{", "\t }" })
    }),

    s("range", {
        t("for "),
        i(1, "condition"),
        t(":= range "),
        i(2, "iter"),
        t({ "{", "\t }" })
    }),

    s("if", {
        t("if "),
        i(1, "condition"),
        t({ "{ ", "\t }" })
    }),

    s("ifsels", {
        t("if "),
        i(1, "condition"),
        t({ "{ ", "\t }esle {", " \t", "}" }),
    }),

}
, {
    key = "go",
})


ls.add_snippets("rust", {

    s("async", {
        t("async fn "),
        i(1, "name"),
        t(" ("),
        i(2, "args"),
        t(" ) "),
        t({ " {", "\t" }),
        t(" } "),
    }),
    -- async funtion with return type
    s("assync", {
        t("async fn "),
        i(1, "name"),
        t(" ("),
        i(2, "args"),
        t(" ) ->"),
        i(3, "value"),
        t({ " {", "\t" }),
        t(" } "),

    }),
}, {
    key = "rust",
})

ls.add_snippets("typescript", {
    s("log", {
        t("console.log("),
        i(1, "log"),
        t(");")
    }),
    s("table", {

        t("console.table("),
        i(1, "log"),
        t(");")
    }),
    s("trace", {

        t("console.trace("),
        i(1, "log"),
        t(");")
    }),
    s("fn", {
        t("function "),
        i(1, "name"),
        t(" ( "),
        i(2, "args"),
        t({ ") {", "\t" }),
        t(" } "),
    }),

    s("type", {
        t("type "),
        i(1, "Type"),
        t({ "= {", "\t" }),
        i(2, "Value"),

        t({ "\t", "};" }),
    }),
    -- creating react component
    s("comp", {}),
}, {
    key = "typescript",
})

-- set type to "autosnippets" for adding autotriggered snippets.
ls.add_snippets("rust", {
    s("autotrigger", {
        t("autosnippet"),
    }),
}, {
    type = "autosnippets",
    key = "all_auto",
})

ls.add_snippets("go", {
    s("autotrigger", {
        t("autosnippet"),
    }),
}, {
    type = "autosnippets",
    key = "lua_auto",
})

ls.add_snippets("lua", {
    s("autotrigger", {
        t("autosnippet"),
    }),
}, {
    type = "autosnippets",
    key = "lua_auto",
})


ls.add_snippets("ts", {
    s("autotrigger", {
        t("autosnippet"),
    }),
}, {
    type = "autosnippets",
    key = "lua_auto",
})


ls.filetype_extend("lua", { "c" })
-- in a cpp file: search c-snippets, then all-snippets only (no cpp-snippets!!).
ls.filetype_set("cpp", { "c" })
require("luasnip.loaders.from_snipmate").load({ include = { "lua" } })
require("luasnip.loaders.from_snipmate").lazy_load() -- Lazy loading
