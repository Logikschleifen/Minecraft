-- mock_api/turtle.lua
-- Stub of CC:Tweaked's turtle API
-- (spec: api-docs/cctweaked/doc/stub/turtle.lua is just craft();
-- the rest is knowledge of the standard turtle API).
-- Stateless stub: every action reports success (true), inspections return
-- empty tables. M._state / M.reset() are the seam for a stateful version
-- later (position, facing, fuel, 16 inventory slots).

---@class TurtleItemDetail
---@field name string item id, e.g. "minecraft:stone".
---@field count integer
---@field nbt string|nil

local M = {}

---@type table<string, any> reserved for future stateful behaviour.
M._state = {}

---Clear any recorded state (no-op while stateless).
function M.reset()
    M._state = {}
end

-- Movement. Stub: always succeeds.
---@return boolean
function M.forward() return true end
---@return boolean
function M.back() return true end
---@return boolean
function M.up() return true end
---@return boolean
function M.down() return true end
---@return boolean
function M.turnLeft() return true end
---@return boolean
function M.turnRight() return true end

-- Selection / inventory info.
---@param slot integer 1-16.
---@return boolean always true in the mock.
function M.select(slot) return true end
---@return integer selected slot (stub: 1).
function M.getSelectedSlot() return 1 end
---@param slot integer|nil
---@return integer (stub: 0).
function M.getItemCount(slot) return 0 end
---@param slot integer|nil
---@return integer (stub: 64).
function M.getItemSpace(slot) return 64 end
---@param slot integer|nil
---@param detailed boolean|nil
---@return TurtleItemDetail|nil (stub: nil, empty turtle).
function M.getItemDetail(slot, detailed) return nil end
---@param side string|nil "left" or "right".
function M.equipLeft(side) end
---@param side string|nil "left" or "right".
function M.equipRight(side) end

-- Block interaction. Stub: action succeeds, nothing found.
---@param side string|nil
---@return boolean
function M.attack(side) return true end
---@param side string|nil
---@return boolean
function M.dig(side) return true end
---@param text string|nil sign text.
---@return boolean
function M.place(text) return true end
---@param side string|nil
---@return boolean (stub: false, air ahead).
function M.detect(side) return false end
---@param side string|nil
---@return boolean, table empty inspect result.
function M.inspect(side) return false, {} end
---@param side string|nil
---@return boolean (stub: false).
function M.compare(side) return false end
---@param side string|nil
---@return boolean (stub: false, nothing to compare to).
function M.compareTo(slot) return false end
---@param count integer|nil
---@param side string|nil
---@return boolean
function M.drop(count, side) return true end
---@param count integer|nil
---@param side string|nil
---@return boolean (stub: false, nothing to suck).
function M.suck(count, side) return false end

-- Up / down variants.
---@param side string|nil
---@return boolean
function M.attackUp(side) return true end
---@param side string|nil
---@return boolean
function M.digUp(side) return true end
---@param text string|nil
---@return boolean
function M.placeUp(text) return true end
---@param side string|nil
---@return boolean
function M.detectUp(side) return false end
---@param side string|nil
---@return boolean, table
function M.inspectUp(side) return false, {} end
---@param side string|nil
---@return boolean
function M.compareUp(side) return false end
---@param count integer|nil
---@param side string|nil
---@return boolean
function M.dropUp(count, side) return true end
---@param count integer|nil
---@param side string|nil
---@return boolean
function M.suckUp(count, side) return false end

---@param side string|nil
---@return boolean
function M.attackDown(side) return true end
---@param side string|nil
---@return boolean
function M.digDown(side) return true end
---@param text string|nil
---@return boolean
function M.placeDown(text) return true end
---@param side string|nil
---@return boolean
function M.detectDown(side) return false end
---@param side string|nil
---@return boolean, table
function M.inspectDown(side) return false, {} end
---@param side string|nil
---@return boolean
function M.compareDown(side) return false end
---@param count integer|nil
---@param side string|nil
---@return boolean
function M.dropDown(count, side) return true end
---@param count integer|nil
---@param side string|nil
---@return boolean
function M.suckDown(count, side) return false end

-- Fuel.
---@param count integer|nil
---@return boolean (stub: true).
function M.refuel(count) return true end
---@return integer (stub: 0).
function M.getFuelLevel() return 0 end
---@return integer (stub: 0, no fuel limit known).
function M.getFuelLimit() return 0 end

-- Inventory transfer.
---@param toSlot integer
---@param count integer|nil
---@return boolean (stub: true).
function M.transferTo(toSlot, count) return true end

-- Crafting (spec: api-docs/cctweaked/doc/stub/turtle.lua).
---@param limit integer|nil max steps (default 64).
---@return boolean success (stub: true).
function M.craft(limit) return true end

return M
