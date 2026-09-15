-- tests/mock_api/test_fs.lua
-- Tests for mock_api/fs.lua.

package.path = package.path .. ";./?.lua"

local assert = require("tests.helpers.assert")
local fs = require("mock_api.fs")

local suite = assert.suite("fs")

suite:test("exposes the fs surface", function()
    assert.assertHasFunctions(fs, {
        "find", "combine", "list", "exists", "isDir", "isReadOnly",
        "getName", "getDir", "getSize", "getDrive", "getFreeSpace",
        "getCapacity", "attributes", "isDriveRoot", "complete",
        "open", "move", "copy", "delete", "makeDir",
    })
end)

suite:test("empty filesystem reports absent paths", function()
    assert.assertEquals(fs.exists("startup.lua"), false)
    assert.assertEquals(fs.isDir("/"), false)
    assert.assertEquals(fs.isReadOnly("x"), false)
    assert.assertEquals(#fs.list("/"), 0)
    assert.assertEquals(#fs.find("*.lua"), 0)
    assert.assertEquals(fs.getSize("x"), 0)
    assert.assertType(fs.getDrive("x"), "string")
    assert.assertType(fs.getFreeSpace("/"), "number")
    assert.assertType(fs.getCapacity("/"), "number")
    assert.assertEquals(fs.isDriveRoot("/"), false)
    assert.assertEquals(#fs.complete("st", "/"), 0)
end)

suite:test("path helpers behave", function()
    assert.assertEquals(fs.getName("/rom/startup.lua"), "startup.lua")
    assert.assertEquals(fs.getDir("/rom/startup.lua"), "/rom")
    assert.assertEquals(fs.combine("/rom", "apis"), "/rom/apis")
    local attr = fs.attributes("x")
    assert.assertType(attr, "table")
    assert.assertEquals(attr.isDir, false)
end)

suite:test("open returns working handles", function()
    local w = assert.assertCalls(fs.open, "out.txt", "w")
    assert.assertCalls(w.write, "hello")
    assert.assertCalls(w.writeLine, "world")
    assert.assertCalls(w.flush)
    assert.assertCalls(w.close)
    local r = assert.assertCalls(fs.open, "out.txt", "r")
    assert.assertType(r.readAll(), "string")
    assert.assertCalls(r.close)
end)

suite:test("mutating calls do not error", function()
    assert.assertCalls(fs.move, "a", "b")
    assert.assertCalls(fs.copy, "a", "b")
    assert.assertCalls(fs.delete, "a")
    assert.assertCalls(fs.makeDir, "dir")
end)

local passed, failed = suite:summary()
return passed, failed
