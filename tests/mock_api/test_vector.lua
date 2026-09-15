-- tests/mock_api/test_vector.lua
-- Tests for mock_api/vector.lua (real implementation).

package.path = package.path .. ";./?.lua"

local assert = require("tests.helpers.assert")
local vector = require("mock_api.vector")

local suite = assert.suite("vector")

suite:test("new creates vectors", function()
    local v = vector.new(1, 2, 3)
    assert.assertEquals(v.x, 1)
    assert.assertEquals(v.y, 2)
    assert.assertEquals(v.z, 3)
end)

suite:test("arithmetic works", function()
    local a = vector.new(1, 2, 3)
    local b = vector.new(4, 5, 6)
    assert.assertEquals(a:add(b):equals(vector.new(5, 7, 9)), true)
    assert.assertEquals(b:sub(a):equals(vector.new(3, 3, 3)), true)
    assert.assertEquals(a:mul(2):equals(vector.new(2, 4, 6)), true)
    assert.assertEquals(a:div(2):equals(vector.new(0.5, 1, 1.5)), true)
    assert.assertEquals(a:unm():equals(vector.new(-1, -2, -3)), true)
end)

suite:test("dot/cross/length/normalize", function()
    local a = vector.new(1, 0, 0)
    local b = vector.new(0, 1, 0)
    assert.assertEquals(a:dot(b), 0)
    assert.assertEquals(a:cross(b):equals(vector.new(0, 0, 1)), true)
    assert.assertEquals(vector.new(3, 4, 0):length(), 5)
    assert.assertEquals(vector.new(0, 0, 5):normalize():equals(vector.new(0, 0, 1)), true)
end)

suite:test("round/equals/tostring", function()
    assert.assertEquals(vector.new(1.4, 1.6, 2):round():equals(vector.new(1, 2, 2)), true)
    assert.assertEquals(vector.new(1, 2, 3):tostring(), "1,2,3")
end)

local passed, failed = suite:summary()
return passed, failed
