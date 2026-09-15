-- mock_api/os.lua
-- Stub of CC:Tweaked's os API (spec: api-docs/cctweaked/doc/stub/os.lua + knowledge).
-- Stateless stub: sane defaults. M._state / M.reset() are the seam for a
-- stateful version later (timers, alarms, queued events, labels).

local M = {}

---@type table<string, any> reserved for future stateful behaviour.
M._state = {}

---Clear any recorded state (no-op while stateless).
function M.reset()
    M._state = {}
end

---CC:Tweaked version string.
---@return string
function M.version()
    return "MockCC 1.0"
end

---@return integer
function M.getComputerID()
    return 0
end

-- Alias of getComputerID (kept as a real function, like the real API).
---@return integer
function M.computerID()
    return M.getComputerID()
end

---@return string|nil nil = no label set.
function M.getComputerLabel()
    return nil
end

---@param label string|nil
function M.setComputerLabel(label)
end

---Seconds the computer has been on. Stub: fixed 0.
---@return number
function M.clock()
    return 0
end

---Start a one-shot timer. Stub returns a fake id without scheduling.
---@param timeout number seconds.
---@return integer timer id.
function M.startTimer(timeout)
    return 1
end

---@param token integer timer id.
function M.cancelTimer(token)
end

---Set an alarm for an in-game time. Stub returns a fake id.
---@param time number in-game time.
---@return integer alarm id.
function M.setAlarm(time)
    return 1
end

---@param token integer alarm id.
function M.cancelAlarm(token)
end

---In-game time of day. Stub: fixed 0.
---@return number
function M.time()
    return 0
end

---Day number since the world was created. Stub: fixed 0.
---@return integer
function M.day()
    return 0
end

---Milliseconds since the UNIX epoch, based on in-game time. Stub: fixed 0.
---@return integer
function M.epoch()
    return 0
end

---Formatted date string. Stub: fixed epoch date.
---@param format string|nil
---@return string
function M.date(format)
    return "01/01/1970"
end

---Queue a custom event. Stub: no-op.
---@param name string
---@param ... any
function M.queueEvent(name, ...)
end

---Pull the next event. Stub returns a fake timer event instead of blocking.
---@param filter string|nil
---@return string name
---@return any ... event arguments
function M.pullEvent(filter)
    return "timer", 1
end

---Pull the next event, ignoring terminate. Stub: same as pullEvent.
---@param filter string|nil
---@return string name
---@return any ... event arguments
function M.pullEventRaw(filter)
    return "timer", 1
end

---Cancel a pending termination. Stub: no-op.
function M.cancelTermination()
end

return M
