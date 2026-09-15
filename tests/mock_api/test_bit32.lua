-- tests/mock_api/test_bit32.lua
-- Tests for mock_api/bit32.lua (real implementation).

package.path = package.path .. ";./?.lua"

local assert = require("tests.helpers.assert")
local bit32 = require("mock_api.bit32")

local suite = assert.suite("bit32")

suite:test("exposes the bit32 surface", function()
    assert.assertHasFunctions(bit32, {
        "band", "bor", "bxor", "btest", "bnot",
        "lshift", "rshift", "arshift", "lrotate", "rrotate",
        "extract", "replace",
    })
end)

suite:test("logic ops", function()
    assert.assertEquals(bit32.band(12, 10), 8)
    assert.assertEquals(bit32.bor(12, 10), 14)
    assert.assertEquals(bit32.bxor(12, 10), 6)
    assert.assertEquals(bit32.btest(12, 8), true)
    assert.assertEquals(bit32.btest(12, 1), false)
    assert.assertEquals(bit32.bnot(0), 4294967295)
end)

suite:test("shifts and rotates", function()
    assert.assertEquals(bit32.lshift(1, 4), 16)
    assert.assertEquals(bit32.rshift(16, 4), 1)
    assert.assertEquals(bit32.arshift(16, 4), 1)
    assert.assertEquals(bit32.lrotate(1, 1), 2)
    assert.assertEquals(bit32.rrotate(2, 1), 1)
end)

suite:test("extract and replace", function()
    assert.assertEquals(bit32.extract(13, 0, 2), 1)
    assert.assertEquals(bit32.extract(13, 2, 2), 3)
    assert.assertEquals(bit32.replace(0, 3, 4, 2), 48)
end)

local passed, failed = suite:summary()
return passed, failed
