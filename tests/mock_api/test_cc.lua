-- tests/mock_api/test_cc.lua
-- Tests for mock_api/cc/*.lua (expect/strings/completion/pretty/base64).

package.path = package.path .. ";./?.lua"

local assert = require("tests.helpers.assert")
local expect = require("mock_api.cc.expect")
local strings = require("mock_api.cc.strings")
local completion = require("mock_api.cc.completion")
local pretty = require("mock_api.cc.pretty")
local base64 = require("mock_api.cc.base64")

local suite = assert.suite("cc")

suite:test("expect validates and returns values", function()
    assert.assertEquals(expect.expect(1, "x", "string"), "x")
    assert.assertError(expect.expect, 1, 5, "string")
    assert.assertEquals(expect.field({ n = 1 }, "n", "number"), 1)
    assert.assertError(expect.field, { n = 1 }, "n", "string")
    assert.assertEquals(expect.range(5, 1, 10), 5)
    assert.assertError(expect.range, 50, 1, 10)
end)

suite:test("strings wraps and splits", function()
    local lines = strings.wrap("aa bb cc dd", 5)
    assert.assertType(lines, "table")
    assert.assertEquals(lines[1], "aa bb")
    assert.assertEquals(strings.ensure_width("ab", 4), "ab  ")
    assert.assertEquals(strings.ensure_width("abcdef", 4), "abcd")
    local parts = strings.split("a,b,c", ",")
    assert.assertEquals(#parts, 3)
    assert.assertEquals(parts[2], "b")
end)

suite:test("completion offers choices and sides", function()
    local got = completion.choice("ch", { "chat", "box", "char" }, false)
    assert.assertContains(got, "at")
    assert.assertEquals(#completion.side("t"), 1) -- only "top" completion "op"
    assert.assertEquals(#completion.peripheral("m"), 0)
    assert.assertEquals(#completion.setting("s"), 0)
    assert.assertEquals(#completion.command("c"), 0)
end)

suite:test("pretty renders and base64 round-trips", function()
    assert.assertType(pretty.pretty({ 1 }), "string")
    assert.assertType(pretty.render(pretty.text("hi")), "string")
    assert.assertCalls(pretty.prettyPrint, { 1 })
    assert.assertCalls(pretty.write, pretty.text("hi"))
    assert.assertCalls(pretty.print, pretty.text("hi"))
    assert.assertEquals(base64.encode("Man"), "TWFu")
    assert.assertEquals(base64.decode("TWFu"), "Man")
    assert.assertEquals(base64.encode(""), "")
    assert.assertEquals(base64.decode("!!!"), nil)
end)

local passed, failed = suite:summary()
return passed, failed
