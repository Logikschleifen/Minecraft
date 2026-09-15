-- mock_api/cc/strings.lua
-- Stub of CC:Tweaked's cc.strings module (require "cc.strings").
-- Pure text helpers: real implementations.

local M = {}

---@type table<string, any> reserved for future stateful behaviour.
M._state = {}

---Clear any recorded state (no-op while stateless).
function M.reset()
    M._state = {}
end

---Wrap text to a width. Real implementation.
---@param text string
---@param width integer|nil default 76ish; stub default 50.
---@return string[]
function M.wrap(text, width)
    width = width or 50
    local lines = {}
    local line = ""
    for word in tostring(text):gmatch("%S+") do
        if #line == 0 then
            line = word
        elseif #line + 1 + #word <= width then
            line = line .. " " .. word
        else
            lines[#lines + 1] = line
            line = word
        end
    end
    lines[#lines + 1] = line
    return lines
end

---Ensure a line is exactly `width` wide (pad or trim). Real implementation.
---@param line string
---@param width integer
---@return string
function M.ensure_width(line, width)
    line = tostring(line)
    if #line < width then
        return line .. string.rep(" ", width - #line)
    end
    return line:sub(1, width)
end

---Split a string. Real implementation.
---@param str string
---@param delimiter string|nil default whitespace runs.
---@param plain boolean|nil pattern vs plain (stub treats as plain when true).
---@param limit integer|nil max pieces.
---@return string[]
function M.split(str, delimiter, plain, limit)
    str = tostring(str)
    local out = {}
    if delimiter == nil or delimiter == "" then
        for word in str:gmatch("%S+") do
            out[#out + 1] = word
            if limit ~= nil and #out >= limit then break end
        end
        return out
    end
    local from = 1
    while true do
        local a, b = str:find(delimiter, from, plain ~= false)
        if a == nil or (limit ~= nil and #out + 1 >= limit) then
            out[#out + 1] = str:sub(from)
            break
        end
        out[#out + 1] = str:sub(from, a - 1)
        from = b + 1
    end
    return out
end

return M
