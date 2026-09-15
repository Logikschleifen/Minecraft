-- tests/mock_api/test_term.lua
-- Tests for mock_api/term.lua.

package.path = package.path .. ";./?.lua"

local assert = require("tests.helpers.assert")
local term = require("mock_api.term")

local suite = assert.suite("term")

suite:test("exposes the term surface incl. colour aliases", function()
    assert.assertHasFunctions(term, {
        "current", "native", "redirect", "write", "scroll",
        "getCursorPos", "setCursorPos", "getCursorBlink", "setCursorBlink",
        "getSize", "clear", "clearLine",
        "getTextColor", "getTextColour", "setTextColor", "setTextColour",
        "getBackgroundColor", "getBackgroundColour",
        "setBackgroundColor", "setBackgroundColour",
        "isColor", "isColour",
        "setPaletteColor", "setPaletteColour",
        "getPaletteColor", "getPaletteColour",
        "nativePaletteColor", "nativePaletteColour",
        "getGraphicsMode", "setGraphicsMode",
    })
end)

suite:test("current/native/redirect return terminals", function()
    assert.assertType(term.current(), "table")
    assert.assertType(term.native(), "table")
    assert.assertType(term.redirect(term.native()), "table")
end)

suite:test("screen geometry and cursor", function()
    local w, h = term.getSize()
    assert.assertType(w, "number")
    assert.assertType(h, "number")
    local x, y = term.getCursorPos()
    assert.assertEquals(x, 1)
    assert.assertEquals(y, 1)
    assert.assertCalls(term.setCursorPos, 5, 5)
    assert.assertEquals(term.getCursorBlink(), false)
    assert.assertCalls(term.setCursorBlink, true)
    assert.assertCalls(term.write, "hi")
    assert.assertCalls(term.scroll, 1)
    assert.assertCalls(term.clear)
    assert.assertCalls(term.clearLine)
end)

suite:test("colours report sane values", function()
    assert.assertType(term.getTextColor(), "number")
    assert.assertEquals(term.getTextColour(), term.getTextColor())
    assert.assertType(term.getBackgroundColor(), "number")
    assert.assertEquals(term.getBackgroundColour(), term.getBackgroundColor())
    assert.assertEquals(term.isColor(), true)
    assert.assertEquals(term.isColour(), true)
    assert.assertCalls(term.setTextColor, 1)
    assert.assertCalls(term.setTextColour, 1)
    assert.assertCalls(term.setBackgroundColor, 32768)
    assert.assertCalls(term.setBackgroundColour, 32768)
    assert.assertType(term.getPaletteColor(1), "number")
    assert.assertType(term.getPaletteColour(1), "number")
    assert.assertType(term.nativePaletteColor(1), "number")
    assert.assertType(term.nativePaletteColour(1), "number")
    assert.assertCalls(term.setPaletteColor, 1, 0xFFFFFF)
    assert.assertCalls(term.setPaletteColour, 1, 0xFFFFFF)
end)

suite:test("graphics mode defaults to false", function()
    assert.assertEquals(term.getGraphicsMode(), false)
    assert.assertCalls(term.setGraphicsMode, false)
end)

local passed, failed = suite:summary()
return passed, failed
