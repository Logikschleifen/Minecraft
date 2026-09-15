-- mock_api/gps.lua
-- Stub of CC:Tweaked's gps API (spec: api-docs/cctweaked/rom/apis/gps.lua).
-- Stateless stub: locate always fails (nil), like a world without GPS hosts.
-- M._state / M.reset() are the seam for a stateful version later
-- (_state.position = {x, y, z} returned by locate).

local M = {}

---@type table<string, any> reserved for future stateful behaviour.
M._state = {}

---Clear any recorded state (no-op while stateless).
function M.reset()
    M._state = {}
end

---Locate this computer via GPS hosts. Stub: no hosts (nil).
---@param timeout number|nil
---@param debug boolean|nil
---@return integer|nil x, integer|nil y, integer|nil z
function M.locate(timeout, debug)
    return nil, nil, nil
end

return M
