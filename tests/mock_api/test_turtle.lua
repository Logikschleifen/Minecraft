-- tests/mock_api/test_turtle.lua
-- Tests for mock_api/turtle.lua.

package.path = package.path .. ";./?.lua"

local assert = require("tests.helpers.assert")
local turtle = require("mock_api.turtle")

local suite = assert.suite("turtle")

suite:test("movement always succeeds", function()
    assert.assertEquals(turtle.forward(), true)
    assert.assertEquals(turtle.back(), true)
    assert.assertEquals(turtle.up(), true)
    assert.assertEquals(turtle.down(), true)
    assert.assertEquals(turtle.turnLeft(), true)
    assert.assertEquals(turtle.turnRight(), true)
end)

suite:test("inventory reports an empty turtle", function()
    assert.assertEquals(turtle.select(1), true)
    assert.assertEquals(turtle.getSelectedSlot(), 1)
    assert.assertEquals(turtle.getItemCount(), 0)
    assert.assertEquals(turtle.getItemSpace(), 64)
    assert.assertEquals(turtle.getItemDetail(), nil)
    assert.assertCalls(turtle.equipLeft)
    assert.assertCalls(turtle.equipRight)
end)

suite:test("interactions succeed, detection finds air", function()
    assert.assertEquals(turtle.attack(), true)
    assert.assertEquals(turtle.dig(), true)
    assert.assertEquals(turtle.place(), true)
    assert.assertEquals(turtle.detect(), false)
    local ok = turtle.inspect()
    assert.assertEquals(ok, false)
    assert.assertEquals(turtle.compare(), false)
    assert.assertEquals(turtle.compareTo(1), false)
    assert.assertEquals(turtle.drop(), true)
    assert.assertEquals(turtle.suck(), false)
end)

suite:test("up/down variants behave the same", function()
    assert.assertEquals(turtle.attackUp(), true)
    assert.assertEquals(turtle.digUp(), true)
    assert.assertEquals(turtle.placeUp(), true)
    assert.assertEquals(turtle.detectUp(), false)
    assert.assertEquals(turtle.dropUp(), true)
    assert.assertEquals(turtle.suckUp(), false)
    assert.assertEquals(turtle.attackDown(), true)
    assert.assertEquals(turtle.digDown(), true)
    assert.assertEquals(turtle.placeDown(), true)
    assert.assertEquals(turtle.detectDown(), false)
    assert.assertEquals(turtle.dropDown(), true)
    assert.assertEquals(turtle.suckDown(), false)
end)

suite:test("fuel and crafting", function()
    assert.assertEquals(turtle.refuel(), true)
    assert.assertEquals(turtle.getFuelLevel(), 0)
    assert.assertEquals(turtle.getFuelLimit(), 0)
    assert.assertEquals(turtle.transferTo(2), true)
    assert.assertEquals(turtle.craft(0), true)
end)

local passed, failed = suite:summary()
return passed, failed
