-- tests/mock_api/test_io.lua
-- Tests for mock_api/io.lua.

package.path = package.path .. ";./?.lua"

local assert = require("tests.helpers.assert")
local io_mock = require("mock_api.io")

local suite = assert.suite("io")

suite:test("exposes the io surface", function()
    assert.assertHasFunctions(io_mock, {
        "close", "flush", "input", "lines", "open",
        "output", "read", "type", "write",
    })
end)

suite:test("open returns a usable handle", function()
    local h = assert.assertCalls(io_mock.open, "f.txt", "r")
    assert.assertType(h, "table")
    assert.assertHasFunctions(h, { "close", "flush", "lines", "read", "seek", "write" })
    local back = h:write("x")
    assert.assertEquals(back, h)
    assert.assertCalls(h.flush)
    assert.assertCalls(h.close)
    assert.assertType(h:seek(), "number")
end)

suite:test("default input/output/reads behave", function()
    assert.assertType(io_mock.input(), "table")
    assert.assertType(io_mock.output(), "table")
    assert.assertEquals(io_mock.read("*a"), "")
    assert.assertType(io_mock.write("x"), "table")
    assert.assertCalls(io_mock.flush)
    assert.assertEquals(io_mock.close(), true)
    local count = 0
    for _ in io_mock.lines("f.txt") do count = count + 1 end
    assert.assertEquals(count, 0)
end)

suite:test("type classifies handles", function()
    local h = io_mock.open("f.txt", "r")
    assert.assertEquals(io_mock.type(h), "closed file")
    assert.assertEquals(io_mock.type(42), nil)
end)

local passed, failed = suite:summary()
return passed, failed
