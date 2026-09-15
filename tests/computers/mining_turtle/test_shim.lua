-- tests/computers/mining_turtle/test_shim.lua
-- Tests for mock_api/shim.lua: PC detection, path setup, mock install.

package.path = package.path .. ";./?.lua"

local assert = require("tests.helpers.assert")
local shim = require("mock_api.shim")

local suite = assert.suite("shim")

suite:test("exposes isComputer/ensurePath/useMocks", function()
    assert.assertHasFunctions(shim, { "isComputer", "ensurePath", "useMocks" })
end)

suite:test("isComputer() is false on PC", function()
    assert.assertEquals(shim.isComputer(), false)
end)

suite:test("isComputer() honors the _HOST marker", function()
    _HOST = "ComputerCraft 1.13"
    assert.assertEquals(shim.isComputer(), true)
    _HOST = nil
    assert.assertEquals(shim.isComputer(), false)
end)

suite:test("useMocks() installs globals, no-op when in-game", function()
    local mods = shim.useMocks()
    assert.assertNotNil(mods)
    assert.assertType(mods.turtle, "table")
    assert.assertType(_G.turtle, "table")
    _HOST = "ComputerCraft 1.13"
    assert.assertEquals(shim.useMocks(), nil)
    _HOST = nil
end)

suite:test("ensurePath() is idempotent", function()
    shim.ensurePath()
    local once = package.path
    shim.ensurePath()
    assert.assertEquals(package.path, once)
    assert.assertContains(package.path, "./?.lua")
end)

local passed, failed = suite:summary()
return passed, failed
