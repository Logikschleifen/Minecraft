-- mock_api/redstone.lua
-- Stub of CC:Tweaked's redstone API (Java-side API, no rom source in
-- api-docs; spec from knowledge of the stable redstone surface).
-- Stateless: all inputs read 0/off. M._state / M.reset() are the seam for
-- a stateful version later (output levels per side in _state.out).

local M = {}

---@type table<string, any> reserved for future stateful behaviour.
M._state = {}

---Clear any recorded state (no-op while stateless).
function M.reset()
    M._state = {}
end

---@return string[] sides with attached peripherals (stub: {}).
function M.getSides()
    return {}
end

---@param side string
---@return boolean (stub: false).
function M.getInput(side)
    return false
end

---@param side string
---@return boolean (stub: false).
function M.getOutput(side)
    return false
end

---@param side string
---@param on boolean
function M.setOutput(side, on)
end

---@param side string
---@return integer 0-15 (stub: 0).
function M.getAnalogueInput(side)
    return 0
end

---@param side string
---@return integer 0-15 (stub: 0).
function M.getAnalogInput(side)
    return M.getAnalogueInput(side)
end

---@param side string
---@return integer 0-15 (stub: 0).
function M.getAnalogueOutput(side)
    return 0
end

---@param side string
---@return integer 0-15 (stub: 0).
function M.getAnalogOutput(side)
    return M.getAnalogueOutput(side)
end

---@param side string
---@param level integer 0-15.
function M.setAnalogueOutput(side, level)
end

---@param side string
---@param level integer 0-15.
function M.setAnalogOutput(side, level)
    M.setAnalogueOutput(side, level)
end

---@param side string
---@return integer|nil bundled input bitmask (stub: 0).
function M.getBundledInput(side)
    return 0
end

---@param side string
---@return integer|nil bundled output bitmask (stub: 0).
function M.getBundledOutput(side)
    return 0
end

---@param side string
---@param colors integer bitmask.
function M.setBundledOutput(side, colors)
end

---@param side string
---@param color integer single colour.
---@return boolean (stub: false).
function M.testBundledInput(side, color)
    return false
end

return M
