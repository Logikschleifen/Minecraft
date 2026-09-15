-- tests/computers/mining_turtle/test_main.lua
-- Proves src/mining_turtle/main.lua runs end-to-end on PC: the pcall guard
-- loads the mocks, sibling require("fuel") resolves, and it exits cleanly.

package.path = package.path .. ";./?.lua;./src/mining_turtle/?.lua"

local assert = require("tests.helpers.assert")

local suite = assert.suite("mining_turtle.main")

suite:test("main.lua runs without error", function()
    assert.assertCalls(dofile, "src/mining_turtle/main.lua")
end)

suite:test("main.lua leaves working globals behind", function()
    assert.assertType(_G.turtle, "table")
    assert.assertType(_G.fs, "table")
end)

local passed, failed = suite:summary()
return passed, failed
