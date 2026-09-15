-- tests/mock_api/test_redstone.lua
-- Tests for mock_api/redstone.lua.

package.path = package.path .. ";./?.lua"

local assert = require("tests.helpers.assert")
local redstone = require("mock_api.redstone")

local suite = assert.suite("redstone")

suite:test("exposes the redstone surface incl. aliases", function()
    assert.assertHasFunctions(redstone, {
        "getSides", "getInput", "getOutput", "setOutput",
        "getAnalogueInput", "getAnalogInput",
        "getAnalogueOutput", "getAnalogOutput",
        "setAnalogueOutput", "setAnalogOutput",
        "getBundledInput", "getBundledOutput",
        "setBundledOutput", "testBundledInput",
    })
end)

suite:test("inputs read off/zero", function()
    assert.assertEquals(#redstone.getSides(), 0)
    assert.assertEquals(redstone.getInput("top"), false)
    assert.assertEquals(redstone.getOutput("top"), false)
    assert.assertEquals(redstone.getAnalogueInput("top"), 0)
    assert.assertEquals(redstone.getAnalogInput("top"), 0)
    assert.assertEquals(redstone.getAnalogueOutput("top"), 0)
    assert.assertEquals(redstone.getAnalogOutput("top"), 0)
    assert.assertEquals(redstone.getBundledInput("top"), 0)
    assert.assertEquals(redstone.getBundledOutput("top"), 0)
    assert.assertEquals(redstone.testBundledInput("top", 1), false)
end)

suite:test("outputs accept writes", function()
    assert.assertCalls(redstone.setOutput, "top", true)
    assert.assertCalls(redstone.setAnalogueOutput, "top", 15)
    assert.assertCalls(redstone.setAnalogOutput, "top", 15)
    assert.assertCalls(redstone.setBundledOutput, "top", 1)
end)

local passed, failed = suite:summary()
return passed, failed
