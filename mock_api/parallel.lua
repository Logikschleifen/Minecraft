-- mock_api/parallel.lua
-- Stub of CC:Tweaked's parallel API
-- (spec: api-docs/cctweaked/rom/apis/parallel.lua).
-- Real-ish implementation: runs functions sequentially in-argument order
-- (no true multitasking outside CC). waitForAny returns the index of the
-- first function that did not error.

local M = {}

---@type table<string, any> reserved for future stateful behaviour.
M._state = {}

---Clear any recorded state (no-op while stateless).
function M.reset()
    M._state = {}
end

---Run functions until all finish. Real sequential implementation.
---@param ... fun() functions to run.
function M.waitForAll(...)
    for i = 1, select("#", ...) do
        local fn = select(i, ...)
        fn()
    end
end

---Run functions until any finishes. Runs each once, returns first index.
---@param ... fun() functions to run.
---@return integer index of the first completed function.
function M.waitForAny(...)
    local n = select("#", ...)
    if n == 0 then error("Expected at least one function", 2) end
    for i = 1, n do
        local fn = select(i, ...)
        fn()
        return i
    end
    return 1
end

return M
