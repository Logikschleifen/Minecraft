-- mock_api/disk.lua
-- Stub of CC:Tweaked's disk API (spec: api-docs/cctweaked/rom/apis/disk.lua).
-- Stateless stub: no drives present. M._state / M.reset() are the seam for
-- a stateful version later (mounted drives in _state.drives).

local M = {}

---@type table<string, any> reserved for future stateful behaviour.
M._state = {}

---Clear any recorded state (no-op while stateless).
function M.reset()
    M._state = {}
end

---@param name string drive name.
---@return boolean (stub: false).
function M.isPresent(name)
    return false
end

---@param name string
---@return string|nil (stub: nil).
function M.getLabel(name)
    return nil
end

---@param name string
---@param label string|nil
function M.setLabel(name, label)
end

---@param name string
---@return boolean (stub: false).
function M.hasData(name)
    return false
end

---@param name string
---@return string|nil (stub: nil).
function M.getMountPath(name)
    return nil
end

---@param name string
---@return boolean (stub: false).
function M.hasAudio(name)
    return false
end

---@param name string
---@return string|nil, string|nil title and artist (stub: nil, nil).
function M.getAudioTitle(name)
    return nil, nil
end

---@param name string
function M.playAudio(name)
end

---@param name string
function M.stopAudio(name)
end

---@param name string
function M.eject(name)
end

---@param name string
---@return integer|nil (stub: nil).
function M.getID(name)
    return nil
end

return M
