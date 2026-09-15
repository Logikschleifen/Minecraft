-- mock_api/pocket.lua
-- Stub of CC:Tweaked's pocket API (pocket computers only; Java-side API).
-- Stateless stub.

local M = {}

---@type table<string, any> reserved for future stateful behaviour.
M._state = {}

---Clear any recorded state (no-op while stateless).
function M.reset()
    M._state = {}
end

---Equip an item to the back. Stub returns success.
---@param slot integer|nil
---@return boolean, string|nil ok + reason.
function M.equipBack(slot)
    return true, nil
end

---Unequip the back item. Stub returns success.
---@return boolean, string|nil ok + reason.
function M.unequipBack()
    return true, nil
end

return M
