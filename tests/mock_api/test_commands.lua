-- tests/mock_api/test_commands.lua
-- Tests for mock_api/commands.lua.

package.path = package.path .. ";./?.lua"

local assert = require("tests.helpers.assert")
local commands = require("mock_api.commands")

local suite = assert.suite("commands")

suite:test("exposes exec/list/native/async", function()
    assert.assertHasFunctions(commands, { "exec", "execAsync", "list" })
    assert.assertType(commands.native, "table")
    assert.assertType(commands.async, "table")
    assert.assertHasFunctions(commands.native, { "exec", "execAsync", "list" })
end)

suite:test("exec succeeds, list is empty", function()
    local ok = commands.exec("say hi")
    assert.assertEquals(ok, true)
    assert.assertType(commands.execAsync("say hi"), "number")
    assert.assertEquals(#commands.list(), 0)
end)

local passed, failed = suite:summary()
return passed, failed
