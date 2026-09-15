-- tests/computers/mining_turtle/test_fuel.lua
-- Tests for src/mining_turtle/fuel.lua against the mocks.

package.path = package.path .. ";./?.lua;./src/mining_turtle/?.lua"

local assert = require("tests.helpers.assert")
local shim = require("mock_api.shim")
shim.useMocks()

local fuel = require("fuel")

local suite = assert.suite("mining_turtle.fuel")

suite:test("module exposes fuel helpers", function()
    assert.assertHasFunctions(fuel, { "needed", "refuelAll", "canAfford" })
    assert.assertEquals(fuel.SLOTS, 16)
end)

suite:test("needed() is zero on the stub turtle", function()
    -- stub: limit 0 = unlimited -> needed() short-circuits to 0.
    assert.assertEquals(fuel.needed(), 0)
end)

suite:test("refuelAll() selects every slot and reports the level", function()
    assert.assertEquals(fuel.refuelAll(), turtle.getFuelLevel())
    assert.assertType(fuel.refuelAll(), "number")
end)

suite:test("canAfford() is true when fuel is unlimited", function()
    assert.assertEquals(fuel.canAfford(1000), true)
end)

local passed, failed = suite:summary()
return passed, failed
