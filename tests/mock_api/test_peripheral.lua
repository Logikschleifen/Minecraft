-- tests/mock_api/test_peripheral.lua
-- Tests for mock_api/peripheral.lua, incl. registerType/attach/find/wrap.

package.path = package.path .. ";./?.lua"

local assert = require("tests.helpers.assert")
local peripheral = require("mock_api.peripheral")

local suite = assert.suite("peripheral")

suite:test("exposes the peripheral surface", function()
    assert.assertHasFunctions(peripheral, {
        "getNames", "isPresent", "getType", "hasType", "getMethods",
        "getName", "call", "wrap", "find", "registerType", "attach",
    })
end)

suite:test("starts empty", function()
    peripheral.reset()
    assert.assertEquals(#peripheral.getNames(), 0)
    assert.assertEquals(peripheral.isPresent("top"), false)
    assert.assertEquals(peripheral.getType("top"), nil)
    assert.assertEquals(peripheral.getMethods("top"), nil)
    assert.assertEquals(peripheral.wrap("top"), nil)
end)

suite:test("registerType + attach + wrap round-trip", function()
    peripheral.reset()
    ---@type table<string, fun>
    local methods = { getFoo = function() return "foo" end }
    peripheral.registerType("mock_thing", methods)
    peripheral.attach("top", "mock_thing")
    assert.assertEquals(peripheral.isPresent("top"), true)
    assert.assertEquals(peripheral.getType("top"), "mock_thing")
    assert.assertEquals(peripheral.hasType("top", "mock_thing"), true)
    assert.assertContains(peripheral.getMethods("top"), "getFoo")
    assert.assertEquals(peripheral.getName("top"), "top")
    assert.assertEquals(peripheral.wrap("top"), methods)
    assert.assertEquals(peripheral.call("top", "getFoo"), "foo")
    local found, name = peripheral.find("mock_thing")
    assert.assertEquals(found, methods)
    assert.assertEquals(name, "top")
    peripheral.reset()
end)

suite:test("find honors the filter", function()
    peripheral.reset()
    local methods = { getFoo = function() return 1 end }
    peripheral.registerType("mock_thing", methods)
    peripheral.attach("top", "mock_thing")
    local found = peripheral.find("mock_thing", function() return false end)
    assert.assertEquals(found, nil)
    peripheral.reset()
end)

local passed, failed = suite:summary()
return passed, failed
