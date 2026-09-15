-- src/mining_turtle/fuel.lua
-- Fuel helpers for the mining turtle. Pure game code: touches only the
-- `turtle` global (real in-game, mocked on PC) — no mock_api references.

---@class Fuel
local Fuel = {}

---Slots on a turtle (1-16).
---@type integer
Fuel.SLOTS = 16

---How much fuel is missing before hitting the limit.
---Negative means "unlimited" (limit 0) is treated as no cap.
---@return integer
function Fuel.needed()
    local limit = turtle.getFuelLimit()
    if limit == 0 then return 0 end
    local missing = limit - turtle.getFuelLevel()
    if missing < 0 then return 0 end
    return missing
end

---Try to refuel from every inventory slot.
---@return integer fuel level after refuelling.
function Fuel.refuelAll()
    for slot = 1, Fuel.SLOTS do
        turtle.select(slot)
        turtle.refuel()
    end
    return turtle.getFuelLevel()
end

---True when the turtle can afford `cost` fuel.
---@param cost integer
---@return boolean
function Fuel.canAfford(cost)
    if turtle.getFuelLimit() == 0 then return true end
    return turtle.getFuelLevel() >= cost
end

return Fuel
