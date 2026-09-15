-- tests/mock_api/test_settings.lua
-- Tests for mock_api/settings.lua (values round-trip in-memory).

package.path = package.path .. ";./?.lua"

local assert = require("tests.helpers.assert")
local settings = require("mock_api.settings")

local suite = assert.suite("settings")

suite:test("exposes the settings surface", function()
    assert.assertHasFunctions(settings, {
        "define", "undefine", "set", "get", "getDetails",
        "unset", "clear", "getNames", "load", "save",
    })
end)

suite:test("set/get round-trip, defaults apply", function()
    settings.reset()
    settings.set("shell.prompt", "> ")
    assert.assertEquals(settings.get("shell.prompt"), "> ")
    assert.assertEquals(settings.get("missing", "dflt"), "dflt")
    assert.assertEquals(settings.get("missing"), nil)
end)

suite:test("define stores defaults and details", function()
    settings.reset()
    settings.define("x.y", { default = 5, type = "number" })
    assert.assertEquals(settings.get("x.y"), 5)
    local details = settings.getDetails("x.y")
    assert.assertEquals(details.default, 5)
    assert.assertEquals(details.value, 5)
    settings.set("x.y", 6)
    assert.assertEquals(settings.get("x.y"), 6)
    settings.unset("x.y")
    assert.assertEquals(settings.get("x.y"), nil)
    settings.undefine("x.y")
end)

suite:test("clear wipes values, getNames lists them", function()
    settings.reset()
    settings.set("a", 1)
    settings.set("b", 2)
    assert.assertEquals(#settings.getNames(), 2)
    settings.clear()
    assert.assertEquals(#settings.getNames(), 0)
    assert.assertEquals(settings.load(), true)
    assert.assertEquals(settings.save(), true)
    settings.reset()
end)

local passed, failed = suite:summary()
return passed, failed
