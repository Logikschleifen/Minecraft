-- tests/mock_api/test_window.lua
-- Tests for mock_api/window.lua.

package.path = package.path .. ";./?.lua"

local assert = require("tests.helpers.assert")
local window = require("mock_api.window")
local term = require("mock_api.term")

local suite = assert.suite("window")

suite:test("create returns a term-compatible window", function()
    local w = window.create(term.current(), 1, 1, 20, 10, true)
    assert.assertType(w, "table")
    assert.assertHasFunctions(w, {
        "write", "scroll", "getCursorPos", "setCursorPos",
        "getSize", "clear", "clearLine",
        "getTextColor", "setTextColor",
        "getBackgroundColor", "setBackgroundColor",
        "isColor", "redraw", "restoreCursor",
        "setVisible", "isVisible",
    })
    local width, height = w.getSize()
    assert.assertEquals(width, 20)
    assert.assertEquals(height, 10)
end)

suite:test("visibility toggles", function()
    local w = window.create(term.current(), 1, 1, 20, 10)
    assert.assertEquals(w.isVisible(), true)
    w.setVisible(false)
    assert.assertEquals(w.isVisible(), false)
    assert.assertCalls(w.redraw)
    assert.assertCalls(w.restoreCursor)
end)

local passed, failed = suite:summary()
return passed, failed
