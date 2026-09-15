-- mock_api/commands.lua
-- Stub of CC:Tweaked's commands API for command computers
-- (spec: api-docs/cctweaked/rom/apis/command/commands.lua).
-- Native surface is exec/execAsync/list; every other command exists as a
-- callable helper that forwards to exec. Stateless.

local M = {}

---@type table<string, any> reserved for future stateful behaviour.
M._state = {}

---Clear any recorded state (no-op while stateless).
function M.reset()
    M._state = {}
end

---@type table the native API (exec/execAsync/list), exposed like the real one.
M.native = {}

---Execute a command. Stub returns empty results.
---@param command string
---@return boolean success, string[]|string output, integer|nil affected
function M.native.exec(command)
    return true, {}, 0
end

---Queue an async command. Stub returns a fake task id.
---@param command string
---@return integer task id.
function M.native.execAsync(command)
    return 0
end

---List sub-commands. Stub: none.
---@param ... string path segments.
---@return string[]
function M.native.list(...)
    return {}
end

---@param command string
---@return boolean, string[]|string, integer|nil
function M.exec(command)
    return M.native.exec(command)
end

---@param command string
---@return integer task id.
function M.execAsync(command)
    return M.native.execAsync(command)
end

---@param ... string
---@return string[]
function M.list(...)
    return M.native.list(...)
end

---@type table<string, table> async command helpers (stub: empty).
M.async = {}

return M
