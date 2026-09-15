-- tests/mock_api/test_paintutils.lua
-- Tests for mock_api/paintutils.lua.

package.path = package.path .. ";./?.lua"

local assert = require("tests.helpers.assert")
local paintutils = require("mock_api.paintutils")

local suite = assert.suite("paintutils")

suite:test("exposes the paintutils surface", function()
    assert.assertHasFunctions(paintutils, {
        "parseImage", "loadImage", "drawPixel", "drawLine",
        "drawBox", "drawFilledBox", "drawImage",
    })
end)

suite:test("parseImage copies tables, rejects junk", function()
    local img = { "aaaa", "bbbb" }
    local parsed = paintutils.parseImage(img)
    assert.assertType(parsed, "table")
    assert.assertEquals(#parsed, 2)
    assert.assertEquals(paintutils.parseImage("nope"), nil)
    assert.assertEquals(paintutils.loadImage("missing.nfp"), nil)
end)

suite:test("drawing calls do not error", function()
    assert.assertCalls(paintutils.drawPixel, 1, 1, 1)
    assert.assertCalls(paintutils.drawLine, 1, 1, 5, 5, 1)
    assert.assertCalls(paintutils.drawBox, 1, 1, 5, 5, 1)
    assert.assertCalls(paintutils.drawFilledBox, 1, 1, 5, 5, 1)
    assert.assertCalls(paintutils.drawImage, { "aa" }, 1, 1)
end)

local passed, failed = suite:summary()
return passed, failed
