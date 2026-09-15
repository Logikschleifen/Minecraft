-- mock_api/bit32.lua
-- Lua 5.2 bit32 library (present on CC:Tweaked, absent on stock Lua 5.1).
-- Real arithmetic implementation so tests behave identically on both.
-- Stateless apart from the standard shape (M._state/reset).

local M = {}

---@type table<string, any> reserved for future stateful behaviour.
M._state = {}

---Clear any recorded state (no-op while stateless).
function M.reset()
    M._state = {}
end

local MOD = 4294967296

---@param x integer
---@return integer unsigned 32-bit value.
local function norm(x)
    return x % MOD
end

---@param x integer
---@param i integer bit position 0-31.
---@return boolean
local function hasbit(x, i)
    return math.floor(norm(x) / (2 ^ i)) % 2 == 1
end

---@param ... integer
---@return integer
function M.band(...)
    local n = select("#", ...)
    if n == 0 then return MOD - 1 end
    local out = 0
    for i = 0, 31 do
        local all = true
        for j = 1, n do
            if not hasbit(select(j, ...), i) then all = false break end
        end
        if all then out = out + 2 ^ i end
    end
    return out
end

---@param ... integer
---@return integer
function M.bor(...)
    local out = 0
    for i = 0, 31 do
        for j = 1, select("#", ...) do
            if hasbit(select(j, ...), i) then out = out + 2 ^ i break end
        end
    end
    return out
end

---@param ... integer
---@return integer
function M.bxor(...)
    local out = 0
    for i = 0, 31 do
        local count = 0
        for j = 1, select("#", ...) do
            if hasbit(select(j, ...), i) then count = count + 1 end
        end
        if count % 2 == 1 then out = out + 2 ^ i end
    end
    return out
end

---@param x integer
---@return boolean
function M.btest(...)
    return M.band(...) ~= 0
end

---@param x integer
---@return integer
function M.bnot(x)
    return (MOD - 1) - norm(x)
end

---@param x integer
---@param disp integer
---@return integer
function M.lshift(x, disp)
    return norm(norm(x) * (2 ^ disp))
end

---@param x integer
---@param disp integer
---@return integer
function M.rshift(x, disp)
    return math.floor(norm(x) / (2 ^ disp))
end

---@param x integer
---@param disp integer
---@return integer arithmetic shift (sign-preserving).
function M.arshift(x, disp)
    local v = norm(x)
    if v >= 2 ^ 31 then v = v - MOD end
    return norm(math.floor(v / (2 ^ disp)))
end

---@param x integer
---@param disp integer
---@return integer
function M.lrotate(x, disp)
    disp = disp % 32
    local v = norm(x)
    return norm(math.floor(v / (2 ^ (32 - disp))) + v * (2 ^ disp))
end

---@param x integer
---@param disp integer
---@return integer
function M.rrotate(x, disp)
    return M.lrotate(x, -disp)
end

---@param x integer
---@param field integer start bit.
---@param width integer|nil bit count (default 1).
---@return integer
function M.extract(x, field, width)
    width = width or 1
    return math.floor(norm(x) / (2 ^ field)) % (2 ^ width)
end

---@param x integer
---@param v integer replacement value.
---@param field integer start bit.
---@param width integer|nil bit count (default 1).
---@return integer
function M.replace(x, v, field, width)
    width = width or 1
    local mask = (2 ^ width - 1) * (2 ^ field)
    local cleared = norm(x) - M.band(norm(x), mask)
    local ins = M.band(v * (2 ^ field), mask)
    return norm(cleared + ins)
end

return M
