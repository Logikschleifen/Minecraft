-- tests/mock_api/test_textutils.lua
-- Tests for mock_api/textutils.lua.

package.path = package.path .. ";./?.lua"

local assert = require("tests.helpers.assert")
local textutils = require("mock_api.textutils")

local suite = assert.suite("textutils")

suite:test("exposes the textutils surface", function()
    assert.assertHasFunctions(textutils, {
        "slowWrite", "slowPrint", "formatTime", "tabulate",
        "pagedTabulate", "pagedPrint", "serialise", "serialize",
        "unserialise", "unserialize", "serialiseJSON", "serializeJSON",
        "unserialiseJSON", "unserializeJSON", "urlEncode", "complete",
    })
end)

suite:test("formatTime formats both clocks", function()
    assert.assertEquals(textutils.formatTime(6.5, true), "06:30")
    assert.assertEquals(textutils.formatTime(13.5, false), "1:30 PM")
    assert.assertEquals(textutils.formatTime(0, false), "12:00 AM")
end)

suite:test("serialise round-trips tables", function()
    local s = textutils.serialise({ a = 1, b = "x" })
    assert.assertType(s, "string")
    local back = textutils.unserialise(s)
    assert.assertEquals(back.a, 1)
    assert.assertEquals(back.b, "x")
    assert.assertEquals(textutils.serialize(5), textutils.serialise(5))
    assert.assertEquals(textutils.unserialize("{n=2}").n, 2)
    assert.assertEquals(textutils.unserialise("!!!not lua!!!"), nil)
end)

suite:test("JSON helpers handle scalars", function()
    assert.assertEquals(textutils.serialiseJSON({ 1, 2 }), "[1,2]")
    assert.assertEquals(textutils.unserialiseJSON("true"), true)
    assert.assertEquals(textutils.unserialiseJSON("null"), nil)
    assert.assertEquals(textutils.unserialiseJSON("42"), 42)
    assert.assertEquals(textutils.unserialiseJSON('"hi"'), "hi")
    assert.assertEquals(textutils.serializeJSON(1), textutils.serialiseJSON(1))
    assert.assertEquals(textutils.unserializeJSON("false"), false)
end)

suite:test("urlEncode escapes, paging stubs return counts", function()
    assert.assertEquals(textutils.urlEncode("a b/c"), "a%20b%2Fc")
    assert.assertType(textutils.tabulate({ "a" }), "number")
    assert.assertType(textutils.pagedTabulate({ "a" }), "number")
    assert.assertType(textutils.pagedPrint("hi"), "number")
    assert.assertEquals(#textutils.complete("pr"), 0)
    assert.assertCalls(textutils.slowWrite, "hi")
    assert.assertCalls(textutils.slowPrint, "hi")
end)

local passed, failed = suite:summary()
return passed, failed
