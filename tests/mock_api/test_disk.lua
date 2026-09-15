-- tests/mock_api/test_disk.lua
-- Tests for mock_api/disk.lua.

package.path = package.path .. ";./?.lua"

local assert = require("tests.helpers.assert")
local disk = require("mock_api.disk")

local suite = assert.suite("disk")

suite:test("exposes the disk surface", function()
    assert.assertHasFunctions(disk, {
        "isPresent", "getLabel", "setLabel", "hasData", "getMountPath",
        "hasAudio", "getAudioTitle", "playAudio", "stopAudio", "eject", "getID",
    })
end)

suite:test("no drives present", function()
    assert.assertEquals(disk.isPresent("top"), false)
    assert.assertEquals(disk.getLabel("top"), nil)
    assert.assertEquals(disk.hasData("top"), false)
    assert.assertEquals(disk.getMountPath("top"), nil)
    assert.assertEquals(disk.hasAudio("top"), false)
    assert.assertEquals(disk.getID("top"), nil)
    assert.assertCalls(disk.setLabel, "top", "x")
    assert.assertCalls(disk.playAudio, "top")
    assert.assertCalls(disk.stopAudio, "top")
    assert.assertCalls(disk.eject, "top")
end)

local passed, failed = suite:summary()
return passed, failed
