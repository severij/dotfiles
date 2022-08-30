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
local conds = require("luasnip.extras.expand_conditions")

local function defn(trig)
  return s(trig, {
    t('(' .. trig .. ' '),
    i(1, 'name'),
    t(' ['),
    i(2, 'args'),
    t({']', '\t'}),
    i(0, 'body'),
    t(')')
  })
end

ls.add_snippets('clojure', {
  s('def', {
    t('(def '),
    i(1, 'name'),
    t(' '),
    i(0, 'body'),
    t(')')
  }),
  defn('defn'),
  defn('defn-'),
  s('if', {
    t('(if '),
    i(1, 'test'),
    t({'', '\t'}),
    i(2, 'then'),
    t({'', '\t'}),
    i(0, 'else'),
    t(')')
  }),
  s('when', {
    t('(when '),
    i(1, 'test'),
    t({'', '\t'}),
    i(2, 'body'),
    t(')')
  }),
  s('print', {
    t('(print '),
    i(1, 'expression'),
    t(')')
  }),
  s('println', {
    t('(println '),
    i(1, 'expression'),
    t(')')
  })
})

