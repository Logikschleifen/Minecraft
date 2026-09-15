-- tests/mock_api/test_pocket.lua
-- Tests for mock_api/pocket.lua.

package.path = package.path .. ";./?.lua"

local assert = require("tests.helpers.assert")
local pocket = require("mock_api.pocket")

local suite = assert.suite("pocket")

suite:test("back slot equips and unequips", function()
    assert.assertEquals(pocket.equipBack(), true)
    assert.assertEquals(pocket.unequipBack(), true)
end)

local passed, failed = suite:summary()
return passed, failed
