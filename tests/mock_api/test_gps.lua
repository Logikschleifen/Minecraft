-- tests/mock_api/test_gps.lua
-- Tests for mock_api/gps.lua.

package.path = package.path .. ";./?.lua"

local assert = require("tests.helpers.assert")
local gps = require("mock_api.gps")

local suite = assert.suite("gps")

suite:test("exposes locate", function()
    assert.assertHasFunctions(gps, { "locate", "reset" })
end)

suite:test("locate reports no hosts", function()
    local x, y, z = gps.locate(2, false)
    assert.assertEquals(x, nil)
    assert.assertEquals(y, nil)
    assert.assertEquals(z, nil)
end)

local passed, failed = suite:summary()
return passed, failed
