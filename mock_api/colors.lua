-- mock_api/colors.lua
-- Stub of CC:Tweaked's colors API (spec: api-docs/cctweaked/rom/apis/colors.lua).
-- Colours are data, so constants and pure helpers are real implementations;
-- nothing to stub, but the file keeps the standard shape (M._state/reset).

local M = {}

---@type table<string, any> reserved for future stateful behaviour.
M._state = {}

---Clear any recorded state (no-op while stateless).
function M.reset()
    M._state = {}
end

-- Colour constants (real values, powers of two).
M.white = 1
M.orange = 2
M.magenta = 4
M.lightBlue = 8
M.yellow = 16
M.lime = 32
M.pink = 64
M.grey = 128
M.gray = 128
M.lightGrey = 256
M.lightGray = 256
M.cyan = 512
M.purple = 1024
M.blue = 2048
M.brown = 4096
M.green = 8192
M.red = 16384
M.black = 32768

---Combine colours into a bitmask. Real implementation.
---@param ... integer
---@return integer
function M.combine(...)
    local result = 0
    for i = 1, select("#", ...) do
        local c = select(i, ...)
        result = result + c
    end
    return result
end

---Subtract colours from a bitmask. Real implementation.
---@param colors integer bitmask.
---@param ... integer colours to remove.
---@return integer
function M.subtract(colors, ...)
    local result = colors
    for i = 1, select("#", ...) do
        local c = select(i, ...)
        if result % (c * 2) >= c then
            result = result - c
        end
    end
    return result
end

---Test whether a bitmask contains a colour. Real implementation.
---@param colors integer bitmask.
---@param color integer
---@return boolean
function M.test(colors, color)
    return colors % (color * 2) >= color
end

---Pack RGB (0-255 each) into an integer. Real implementation.
---@param r number
---@param g number
---@param b number
---@return integer
function M.packRGB(r, g, b)
    return math.floor(r) * 65536 + math.floor(g) * 256 + math.floor(b)
end

---Unpack an integer into RGB. Real implementation.
---@param rgb integer
---@return number r, number g, number b
function M.unpackRGB(rgb)
    local r = math.floor(rgb / 65536) % 256
    local g = math.floor(rgb / 256) % 256
    local b = math.floor(rgb) % 256
    return r, g, b
end

---Pack RGB (0-1 each) into an integer. Real implementation.
---@param r number
---@param g number
---@param b number
---@return integer
function M.rgb8(r, g, b)
    return M.packRGB(r * 255, g * 255, b * 255)
end

---Convert a colour to its blit hex character. Real implementation.
---@param color integer
---@return string
function M.toBlit(color)
    local hex = "0123456789abcdef"
    for i = 0, 15 do
        if 2 ^ i == color then
            return hex:sub(i + 1, i + 1)
        end
    end
    return "f"
end

---Convert a blit hex character to a colour. Real implementation.
---@param hex string single character.
---@return integer
function M.fromBlit(hex)
    local digits = "0123456789abcdef"
    local i = digits:find(hex:sub(1, 1):lower(), 1, true)
    if i == nil then return M.white end
    return 2 ^ (i - 1)
end

return M
