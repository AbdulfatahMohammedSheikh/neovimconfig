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



ls.add_snippets("typescript", {

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

    s("im", {
        t("import "),
        i(1, " item "),
        t("from '"),
        i(2, " path"),
        t(" '"),
    }),


    s("log", {
        t("console."),
        t("log("),
        i(1, "item"),
        t(")")
    }),
    s("warn", {
        t("console."),
        t("warn("),
        i(1, "item"),
        t(")")
    }),

    s("table", {
        t("console."),
        t("table("),
        i(1, "item"),
        t(")")
    }),

    s("debug", {
        t("console."),
        t("debug( "),
        i(1, "item"),
        t(")")
    }),
    s("info", {
        t("console."),
        t("info( "),
        i(1, "item"),
        t(")")
    }),
    s("time", {
        t("console."),
        t("time( "),
        i(1, "item"),
        t(")")
    }),

    s("fn", {
        t("function "),
        i(1, "name"),
        t(" ("),
        i(2, "args"),
        t(" ) "),
        t({ " {", "\t" }),
        t(" } "),
    }),

    s("fnr", {
        t("function "),
        i(1, "name"),
        t(" ("),
        i(2, "args"),
        t(" ):"),
        i(3, "type"),
        t({ " {", "\t" }),
        t(" } "),
    }),

    s("if", {
        t("if( "),
        i(1, "condition"),
        t(" ) "),
        t({ " {", "\t" }),
        i(2, ""),
        t({ "\t", " }" }),
    }),

    s("else", {

        t("if( "),
        i(1, "condition"),
        t(" ) "),
        t({ " {", "\t" }),
        i(2, ""),
        t({ "\t", " }" }),

        t({ "else{", "\t " }),
        i(1, ""),
        t({ "\t", " }" }),
    }),

    s("elif", {

        t("if( "),
        i(1, "condition"),
        t(" ) "),
        t({ " {", "\t" }),
        i(2, ""),
        t({ "\t", " }" }),


        t("else if( "),
        i(1, "condition"),
        t(" ) "),
        t({ " {", "\t" }),
        i(2, ""),
        t({ "\t", " }" }),

        t({ "else{", "\t " }),
        i(1, ""),
        t({ "\t", " }" }),
    }),

    s("for", {
        t("for( "),
        i(1, "condition"),
        t(" ) "),
        t({ " {", "\t" }),
        i(2, ""),
        t({ "\t", " }" }),
    }),


    s("while", {
        t("while( "),
        i(1, "condition"),
        t(" ) "),
        t({ " {", "\t" }),
        i(2, ""),
        t({ "\t", " }" }),
    }),

    s("ed", {
        t("export default "),
        i(1, "App"),
        t(";")
    }),
}, {
    key = "typescript",
})


require("luasnip.loaders.from_snipmate").lazy_load() -- Lazy loading
