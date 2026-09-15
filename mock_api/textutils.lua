-- mock_api/textutils.lua
-- Stub of CC:Tweaked's textutils API
-- (spec: api-docs/cctweaked/rom/apis/textutils.lua + knowledge).
-- Pure helpers (serialise, formatTime, urlEncode, complete) are real;
-- screen-paging helpers are stubs. Stateless.

local M = {}

---@type table<string, any> reserved for future stateful behaviour.
M._state = {}

---Clear any recorded state (no-op while stateless).
function M.reset()
    M._state = {}
end

---Write text slowly. Stub: no-op.
---@param text string
---@param rate number|nil
function M.slowWrite(text, rate)
end

---Print text slowly. Stub: no-op.
---@param text string
---@param rate number|nil
function M.slowPrint(text, rate)
end

---Format an in-game time. Real implementation.
---@param time number 0-24.
---@param twentyFourHour boolean|nil
---@return string
function M.formatTime(time, twentyFourHour)
    local hour = math.floor(time) % 24
    local minute = math.floor((time % 1) * 60)
    if twentyFourHour then
        return string.format("%02d:%02d", hour, minute)
    end
    local suffix = "AM"
    local h = hour
    if h >= 12 then suffix = "PM" end
    h = h % 12
    if h == 0 then h = 12 end
    return string.format("%d:%02d %s", h, minute, suffix)
end

---Print a table in columns. Stub: returns lines it would print (0).
---@param ... any
---@return integer
function M.tabulate(...)
    return 0
end

---Paged variant of tabulate. Stub: returns 0.
---@param ... any
---@return integer
function M.pagedTabulate(...)
    return 0
end

---Print with paging. Stub: returns lines it would print (0).
---@param text string|table
---@param freeLines integer|nil
---@return integer
function M.pagedPrint(text, freeLines)
    return 0
end

---Serialise a value. Real implementation for scalars/tables (no cycles).
---@param value any
---@param opts table|nil unsupported, kept for signature compatibility.
---@return string
function M.serialise(value, opts)
    local t = type(value)
    if t == "string" then return string.format("%q", value) end
    if t == "number" or t == "boolean" or t == "nil" then return tostring(value) end
    if t ~= "table" then return "nil" end
    local parts = { "{" }
    for k, v in pairs(value) do
        local key
        if type(k) == "string" and k:match("^[A-Za-z_][A-Za-z0-9_]*$") then
            key = k
        else
            key = "[" .. M.serialise(k) .. "]"
        end
        parts[#parts + 1] = key .. "=" .. M.serialise(v) .. ","
    end
    parts[#parts + 1] = "}"
    return table.concat(parts)
end

---American-spelling alias.
---@param value any
---@param opts table|nil
---@return string
function M.serialize(value, opts)
    return M.serialise(value, opts)
end

---Unserialise a string. Uses loadstring on 5.1 / load on 5.2+.
---@param str string
---@return any|nil value or nil on failure.
function M.unserialise(str)
    local fn, err
    if loadstring then
        fn, err = loadstring("return " .. str)
    else
        fn, err = load("return " .. str)
    end
    if not fn then return nil end
    local ok, result = pcall(fn)
    if not ok then return nil end
    return result
end

---American-spelling alias.
---@param str string
---@return any|nil
function M.unserialize(str)
    return M.unserialise(str)
end

---Serialise to JSON. Real implementation for scalars/arrays/objects.
---@param value any
---@param nbtStyle boolean|nil unused in the mock.
---@return string
function M.serialiseJSON(value, nbtStyle)
    local t = type(value)
    if t == "string" then
        return string.format("%q", value):gsub("\\\n", "\\n")
    end
    if t == "number" or t == "boolean" then return tostring(value) end
    if value == nil then return "null" end
    if t ~= "table" then return "null" end
    local isArray = true
    local n = 0
    for k, _ in pairs(value) do
        n = n + 1
        if type(k) ~= "number" or k ~= n then isArray = false end
    end
    local parts = {}
    if isArray then
        for i = 1, n do parts[#parts + 1] = M.serialiseJSON(value[i]) end
        return "[" .. table.concat(parts, ",") .. "]"
    end
    for k, v in pairs(value) do
        parts[#parts + 1] = M.serialiseJSON(tostring(k)) .. ":" .. M.serialiseJSON(v)
    end
    return "{" .. table.concat(parts, ",") .. "}"
end

---American-spelling alias.
---@param value any
---@param nbtStyle boolean|nil
---@return string
function M.serializeJSON(value, nbtStyle)
    return M.serialiseJSON(value, nbtStyle)
end

---Unserialise JSON. Supports the subset the mock produces + numbers/bools.
---@param str string
---@return any|nil
function M.unserialiseJSON(str)
    if type(str) ~= "string" then return nil end
    local s = str:match("^%s*(.-)%s*$")
    if s == "null" then return nil end
    if s == "true" then return true end
    if s == "false" then return false end
    if tonumber(s) ~= nil then return tonumber(s) end
    if s:sub(1, 1) == '"' then
        local ok, res = pcall(function()
            if loadstring then return loadstring("return " .. s)()
            else return load("return " .. s)() end
        end)
        if ok then return res end
        return nil
    end
    return nil
end

---American-spelling alias.
---@param str string
---@return any|nil
function M.unserializeJSON(str)
    return M.unserialiseJSON(str)
end

---URL-encode a string. Real implementation.
---@param str string
---@return string
function M.urlEncode(str)
    return tostring(str):gsub("([^A-Za-z0-9_~%.%-])", function(c)
        return string.format("%%%02X", string.byte(c))
    end)
end

---Complete a shell-ish line. Stub: no completions.
---@param line string
---@param env table|nil
---@return string[]
function M.complete(line, env)
    return {}
end

return M
