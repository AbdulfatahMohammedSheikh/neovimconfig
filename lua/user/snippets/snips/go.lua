local ls = require("luasnip")
local myconfig = require("user.snippets.init")

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

ls.add_snippets("go", {

    s("todo", {
        t("// TODO: "),
        i(1, "enter todo")
    }),

    s("fixme", {
        t("// FIXME: "),
        i(1, "enter todo")
    }),

    s("bug", {
        t("// BUG: "),
        i(1, "enter todo")
    }),


    s("warning", {
        t("// WARNING: "),
        i(1, "enter todo")
    }),



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
require("luasnip.loaders.from_snipmate").lazy_load() -- Lazy loading
