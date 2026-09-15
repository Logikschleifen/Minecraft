-- mock_api/cc/expect.lua
-- Stub of CC:Tweaked's cc.expect module (require "cc.expect").
-- The real module raises on bad arguments; the mock validates lightly:
-- expect() returns the value, field() returns the field, range() returns num.

local M = {}

---@type table<string, any> reserved for future stateful behaviour.
M._state = {}

---Clear any recorded state (no-op while stateless).
function M.reset()
    M._state = {}
end

---Check an argument's type. Returns the value; errors on mismatch.
---@param index integer argument position for messages.
---@param value any
---@param ... string allowed type names.
---@return any the value.
function M.expect(index, value, ...)
    local actual = type(value)
    for i = 1, select("#", ...) do
        if actual == select(i, ...) then return value end
    end
    error("bad argument #" .. tostring(index) .. " (expected "
        .. table.concat({ ... }, " or ") .. ", got " .. actual .. ")", 3)
end

---Check a table field's type. Returns the field value.
---@param tbl table
---@param index string field name.
---@param ... string allowed type names.
---@return any the field value.
function M.field(tbl, index, ...)
    return M.expect(1, tbl[index], ...)
end

---Check a number is within [min, max]. Returns the number.
---@param num number
---@param min number|nil
---@param max number|nil
---@return number
function M.range(num, min, max)
    if type(num) ~= "number" then error("expected number", 3) end
    if min ~= nil and num < min then error("number out of range", 3) end
    if max ~= nil and num > max then error("number out of range", 3) end
    return num
end

return M
