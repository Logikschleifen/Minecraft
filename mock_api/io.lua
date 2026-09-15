-- mock_api/io.lua
-- Stub of CC:Tweaked's io API (spec: api-docs/cctweaked/rom/apis/io.lua).
-- Stateless stub: reads return ""/nil (EOF-ish), writes are discarded.
-- M._state / M.reset() are the seam for a stateful version later.

---@class IoHandle
---@field close fun(self: IoHandle)
---@field flush fun(self: IoHandle)
---@field lines fun(self: IoHandle, ...: string): fun(): string|nil
---@field read fun(self: IoHandle, ...: string): any
---@field seek fun(self: IoHandle, whence: string|nil, offset: integer|nil): integer|nil
---@field write fun(self: IoHandle, ...: any): IoHandle

---@return IoHandle an in-memory handle (contents discarded / empty).
local function newHandle()
    ---@type IoHandle
    local h = {}
    function h:close() end
    function h:flush() end
    function h:lines(...)
        return function() return nil end
    end
    function h:read(...)
        local first = ...
        if first == "a" or first == "*a" then return "" end
        return nil
    end
    function h:seek(whence, offset) return 0 end
    function h:write(...)
        return self
    end
    return h
end

local M = {}

---@type table<string, any> reserved for future stateful behaviour.
M._state = {}

---Clear any recorded state (no-op while stateless).
function M.reset()
    M._state = {}
end

---Close the default output (stub) or a handle.
---@param file IoHandle|nil
---@return boolean always true in the mock.
function M.close(file)
    return true
end

---Flush the default output. Stub: no-op.
function M.flush()
end

---Get or set the default input.
---@param file IoHandle|string|nil
---@return IoHandle current input.
function M.input(file)
    return newHandle()
end

---Iterate lines of a file. Stub: immediately done.
---@param filename string|nil
---@param ... string formats.
---@return fun(): string|nil iterator.
function M.lines(filename, ...)
    return function() return nil end
end

---Open a file. Stub returns an in-memory handle (never fails).
---@param filename string
---@param mode string|nil
---@return IoHandle|nil, string|nil error.
function M.open(filename, mode)
    return newHandle(), nil
end

---Get or set the default output.
---@param file IoHandle|string|nil
---@return IoHandle current output.
function M.output(file)
    return newHandle()
end

---Read from default input. Stub: "" for "*a", else nil.
---@param ... string formats.
---@return any
function M.read(...)
    local first = ...
    if first == "*a" or first == "a" then return "" end
    return nil
end

---Classify a value. Stub: "closed file" for tables with close, else nil.
---@param obj any
---@return string|nil "file", "closed file", or nil.
function M.type(obj)
    if type(obj) == "table" and type(obj.close) == "function" then
        return "closed file"
    end
    return nil
end

---Write to default output. Stub returns a handle.
---@param ... any
---@return IoHandle
function M.write(...)
    return newHandle()
end

return M
