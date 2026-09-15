-- tests/mock_api/test_globals.lua
-- Tests for mock_api/globals.lua (sleep/write/print/printError/read).

package.path = package.path .. ";./?.lua"

local assert = require("tests.helpers.assert")
local g = require("mock_api.globals")

local suite = assert.suite("globals")

suite:test("exposes all global functions", function()
    assert.assertHasFunctions(g, { "sleep", "write", "print", "printError", "read", "reset" })
end)

suite:test("sleep returns immediately", function()
    assert.assertCalls(g.sleep, 3)
    assert.assertCalls(g.sleep)
end)

suite:test("write/print return a line count", function()
    assert.assertType(g.write("hi"), "number")
    assert.assertType(g.print("hi", 1, true), "number")
end)

suite:test("printError is a silent no-op", function()
    assert.assertCalls(g.printError, "boom")
end)

suite:test("read returns default, else empty string", function()
    assert.assertEquals(g.read(nil, nil, nil, "typed"), "typed")
    assert.assertEquals(g.read(), "")
end)

suite:test("reset clears state", function()
    assert.assertCalls(g.reset)
end)

local passed, failed = suite:summary()
return passed, failed
