-- tests/mock_api/test_help.lua
-- Tests for mock_api/help.lua.

package.path = package.path .. ";./?.lua"

local assert = require("tests.helpers.assert")
local help = require("mock_api.help")

local suite = assert.suite("help")

suite:test("exposes the help surface", function()
    assert.assertHasFunctions(help, { "path", "setPath", "lookup", "topics", "completeTopic" })
end)

suite:test("path/topics/lookup behave", function()
    assert.assertType(help.path(), "string")
    assert.assertCalls(help.setPath, "/help")
    assert.assertType(help.lookup("lua"), "string")
    assert.assertType(help.topics(), "table")
    assert.assertEquals(#help.completeTopic("lu"), 0)
end)

local passed, failed = suite:summary()
return passed, failed
