-- mock_api/globals.lua
-- Stub of CC:Tweaked's global functions (spec: api-docs/cctweaked/doc/stub/global.lua).
-- Stateless stub: sane defaults. M._state / M.reset() are the seam for a
-- stateful version later (e.g. capturing printed output).

local M = {}

---@type table<string, any> reserved for future stateful behaviour.
M._state = {}

---Clear any recorded state (no-op while stateless).
function M.reset()
    M._state = {}
end

---Pause execution. Stub returns immediately instead of yielding.
---@param time number|nil seconds to sleep.
function M.sleep(time)
end

---Write text without a trailing newline. Returns lines written (stub: 1).
---@param text string
---@return integer
function M.write(text)
    return 1
end

---Print values separated by spaces. Returns lines written (stub: 1).
---@param ... any
---@return integer
function M.print(...)
    return 1
end

---Print values in red (error output). Stub: no-op.
---@param ... any
function M.printError(...)
end

---Read a line of user input. Stub returns the default, or "".
---@param replaceChar string|nil
---@param history table|nil
---@param completeFn fun(partial: string): string[]|nil|nil
---@param default string|nil
---@return string
function M.read(replaceChar, history, completeFn, default)
    if default ~= nil then return default end
    return ""
end

return M
