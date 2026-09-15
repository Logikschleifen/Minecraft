-- tests/mock_api/test_keys.lua
-- Tests for mock_api/keys.lua.

package.path = package.path .. ";./?.lua"

local assert = require("tests.helpers.assert")
local keys = require("mock_api.keys")

local suite = assert.suite("keys")

suite:test("key codes are real values", function()
    assert.assertEquals(keys.enter, 28)
    assert.assertEquals(keys.space, 57)
    assert.assertEquals(keys.a, 30)
    assert.assertType(keys.up, "number")
end)

suite:test("getName resolves known codes", function()
    assert.assertEquals(keys.getName(28), "enter")
    assert.assertEquals(keys.getName(99999), "unknown")
end)

local passed, failed = suite:summary()
return passed, failed
