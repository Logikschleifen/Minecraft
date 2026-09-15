-- tests/helpers/assert.lua
-- General, zero-dependency assertion library for this repo's Lua tests.
-- Works on stock Lua 5.1 (no table.pack, no goto) and on CC:Tweaked.
-- Every function is annotated with EmmyLua/LuaCATS types.
--
-- Usage:
--   local assert = require("tests.helpers.assert")
--   assert.assertEquals(1 + 1, 2)
--   local suite = assert.suite("my api")
--   suite:test("adds", function() assert.assertEquals(1 + 1, 2) end)
--   local passed, failed = suite:summary()

---@class AssertSuite
---@field name string
---@field passed integer
---@field failed integer
local Suite = {}
Suite.__index = Suite

---@param name string
---@param fn fun()
function Suite:test(name, fn)
    local ok, err = pcall(fn)
    if ok then
        self.passed = self.passed + 1
        print("  [PASS] " .. name)
    else
        self.failed = self.failed + 1
        print("  [FAIL] " .. name .. " -> " .. tostring(err))
    end
end

---@return integer passed, integer failed
function Suite:summary()
    print(string.format("[%s] %d passed, %d failed", self.name, self.passed, self.failed))
    return self.passed, self.failed
end

local M = {}

---@param name string Suite name shown in output.
---@return AssertSuite
function M.suite(name)
    return setmetatable({ name = name, passed = 0, failed = 0 }, Suite)
end

---@param cond boolean
---@param msg string|nil
function M.assert(cond, msg)
    if not cond then
        error(msg or "assertion failed", 2)
    end
end

---@param actual any
---@param expected any
---@param msg string|nil
function M.assertEquals(actual, expected, msg)
    if actual ~= expected then
        error((msg or "assertEquals failed")
            .. ": expected " .. tostring(expected)
            .. ", got " .. tostring(actual), 2)
    end
end

---@param actual any
---@param unexpected any
---@param msg string|nil
function M.assertNotEquals(actual, unexpected, msg)
    if actual == unexpected then
        error((msg or "assertNotEquals failed")
            .. ": both are " .. tostring(actual), 2)
    end
end

---@param v any
---@param msg string|nil
function M.assertTrue(v, msg)
    if v ~= true then
        error((msg or "assertTrue failed") .. ": got " .. tostring(v), 2)
    end
end

---@param v any
---@param msg string|nil
function M.assertFalse(v, msg)
    if v ~= false then
        error((msg or "assertFalse failed") .. ": got " .. tostring(v), 2)
    end
end

---@param v any
---@param msg string|nil
function M.assertNil(v, msg)
    if v ~= nil then
        error((msg or "assertNil failed") .. ": got " .. tostring(v), 2)
    end
end

---@param v any
---@param msg string|nil
function M.assertNotNil(v, msg)
    if v == nil then
        error(msg or "assertNotNil failed: got nil", 2)
    end
end

---Check Lua type. Accepts one type name or a list of allowed names.
---@param v any
---@param expected string|string[]
---@param msg string|nil
function M.assertType(v, expected, msg)
    local actual = type(v)
    if type(expected) == "string" then
        if actual ~= expected then
            error((msg or "assertType failed")
                .. ": expected " .. tostring(expected)
                .. ", got " .. actual, 2)
        end
        return
    end
    for _, t in ipairs(expected) do
        if actual == t then return end
    end
    error((msg or "assertType failed")
        .. ": expected one of {" .. table.concat(expected, ", ")
        .. "}, got " .. actual, 2)
end

---@param tbl table
---@param key string
---@param msg string|nil
function M.assertHasFunction(tbl, key, msg)
    if type(tbl) ~= "table" then
        error((msg or "assertHasFunction failed") .. ": target is not a table", 2)
    end
    if type(tbl[key]) ~= "function" then
        error((msg or "assertHasFunction failed")
            .. ": missing function '" .. tostring(key) .. "'", 2)
    end
end

---Assert every name in `keys` is a function on `tbl`.
---@param tbl table
---@param keys string[]
---@param msg string|nil
function M.assertHasFunctions(tbl, keys, msg)
    for _, key in ipairs(keys) do
        M.assertHasFunction(tbl, key, msg)
    end
end

---Call fn(...) and fail the test if it raises. Returns the call results.
---@param fn fun(...: any): ...: any
---@return ...: any results of the call
function M.assertCalls(fn, ...)
    local results = { pcall(fn, ...) }
    if not results[1] then
        error("assertCalls failed, function raised: " .. tostring(results[2]), 2)
    end
    return unpack(results, 2)
end

---Assert fn(...) raises an error. Returns the error message.
---@param fn fun(...: any): ...: any
---@return string error message
function M.assertError(fn, ...)
    local ok, err = pcall(fn, ...)
    if ok then
        error("assertError failed: expected an error but call succeeded", 2)
    end
    return tostring(err)
end

---Assert a list-like table or string contains `item`.
---@param haystack table|string
---@param item any
---@param msg string|nil
function M.assertContains(haystack, item, msg)
    if type(haystack) == "string" then
        if not string.find(haystack, tostring(item), 1, true) then
            error((msg or "assertContains failed")
                .. ": " .. tostring(haystack)
                .. " does not contain " .. tostring(item), 2)
        end
        return
    end
    if type(haystack) ~= "table" then
        error((msg or "assertContains failed") .. ": target is not a table/string", 2)
    end
    for _, v in pairs(haystack) do
        if v == item then return end
    end
    error((msg or "assertContains failed")
        .. ": table does not contain " .. tostring(item), 2)
end

return M
