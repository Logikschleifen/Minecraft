-- tests/mock_api/test_parallel.lua
-- Tests for mock_api/parallel.lua.

package.path = package.path .. ";./?.lua"

local assert = require("tests.helpers.assert")
local parallel = require("mock_api.parallel")

local suite = assert.suite("parallel")

suite:test("waitForAll runs everything in order", function()
    local order = {}
    parallel.waitForAll(
        function() order[#order + 1] = 1 end,
        function() order[#order + 1] = 2 end)
    assert.assertEquals(#order, 2)
    assert.assertEquals(order[1], 1)
    assert.assertEquals(order[2], 2)
end)

suite:test("waitForAny returns the first finished index", function()
    local ran = {}
    local idx = parallel.waitForAny(
        function() ran[#ran + 1] = 1 end,
        function() ran[#ran + 1] = 2 end)
    assert.assertEquals(idx, 1)
    assert.assertEquals(#ran, 1)
end)

suite:test("waitForAny needs at least one function", function()
    assert.assertError(parallel.waitForAny)
end)

local passed, failed = suite:summary()
return passed, failed
