-- tests/mock_api/test_vanilla.lua
-- Tests for mock_api/vanilla.lua (built-in CC peripherals).

package.path = package.path .. ";./?.lua"

local assert = require("tests.helpers.assert")
local vanilla = require("mock_api.vanilla")
local peripheral = require("mock_api.peripheral")

local suite = assert.suite("vanilla")

suite:test("all six vanilla types exist", function()
    for _, t in ipairs({ "modem", "monitor", "speaker", "printer", "drive", "computer" }) do
        assert.assertType(vanilla.types[t], "table")
    end
end)

suite:test("types register and wrap through peripheral", function()
    peripheral.reset()
    for typeName, methods in pairs(vanilla.types) do
        peripheral.registerType(typeName, methods)
    end
    peripheral.attach("back", "modem")
    peripheral.attach("top", "monitor")
    assert.assertEquals(peripheral.getType("back"), "modem")
    local modem = peripheral.wrap("back")
    assert.assertCalls(modem.transmit, 1, 2, "hi")
    assert.assertEquals(modem.isWireless(), false)
    local monitor = peripheral.wrap("top")
    local w, h = monitor.getSize()
    assert.assertType(w, "number")
    assert.assertType(h, "number")
    assert.assertCalls(monitor.setTextScale, 1)
    peripheral.reset()
end)

suite:test("speaker/printer/drive/computer methods are callable", function()
    local sp = vanilla.types["speaker"]
    assert.assertEquals(sp.playNote("harp", 1, 12), true)
    assert.assertEquals(sp.playSound("minecraft:block.note_block.harp", 1, 1), true)
    assert.assertCalls(sp.stop)
    local pr = vanilla.types["printer"]
    assert.assertEquals(pr.newPage("title"), true)
    assert.assertCalls(pr.write, "hi")
    assert.assertCalls(pr.endPage)
    local dr = vanilla.types["drive"]
    assert.assertEquals(dr.isDiskPresent(), false)
    assert.assertCalls(dr.ejectDisk)
    local co = vanilla.types["computer"]
    assert.assertType(co.getID(), "number")
    assert.assertCalls(co.reboot)
end)

local passed, failed = suite:summary()
return passed, failed
