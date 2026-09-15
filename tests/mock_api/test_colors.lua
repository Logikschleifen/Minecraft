-- tests/mock_api/test_colors.lua
-- Tests for mock_api/colors.lua (real implementations, not stubs).

package.path = package.path .. ";./?.lua"

local assert = require("tests.helpers.assert")
local colors = require("mock_api.colors")
local colours = require("mock_api.colours")

local suite = assert.suite("colors")

suite:test("constants are real bitmask values", function()
    assert.assertEquals(colors.white, 1)
    assert.assertEquals(colors.black, 32768)
    assert.assertEquals(colors.red, 16384)
end)

suite:test("colours is the same module", function()
    assert.assertEquals(colours, colors)
end)

suite:test("combine/subtract/test round-trip", function()
    local both = colors.combine(colors.red, colors.blue)
    assert.assertEquals(colors.test(both, colors.red), true)
    assert.assertEquals(colors.test(both, colors.green), false)
    local rest = colors.subtract(both, colors.red)
    assert.assertEquals(colors.test(rest, colors.red), false)
    assert.assertEquals(colors.test(rest, colors.blue), true)
end)

suite:test("RGB packing round-trips", function()
    local packed = colors.packRGB(255, 0, 128)
    local r, g, b = colors.unpackRGB(packed)
    assert.assertEquals(r, 255)
    assert.assertEquals(g, 0)
    assert.assertEquals(b, 128)
    assert.assertEquals(colors.rgb8(1, 0, 0.5), colors.packRGB(255, 0, 127))
end)

suite:test("blit conversion round-trips", function()
    assert.assertEquals(colors.toBlit(colors.white), "0")
    assert.assertEquals(colors.fromBlit("0"), colors.white)
    assert.assertEquals(colors.fromBlit("f"), colors.black)
end)

local passed, failed = suite:summary()
return passed, failed
