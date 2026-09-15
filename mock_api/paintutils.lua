-- mock_api/paintutils.lua
-- Stub of CC:Tweaked's paintutils API
-- (spec: api-docs/cctweaked/rom/apis/paintutils.lua + knowledge).
-- Stateless: drawing calls are no-ops, parseImage returns a blank canvas.

---@alias PixelRow string[]

local M = {}

---@type table<string, any> reserved for future stateful behaviour.
M._state = {}

---Clear any recorded state (no-op while stateless).
function M.reset()
    M._state = {}
end

---Parse an image table into pixels. Real implementation (pass-through copy).
---@param image table image in paintutils format.
---@return table|nil parsed image or nil when invalid.
function M.parseImage(image)
    if type(image) ~= "table" then return nil end
    local out = {}
    for i, row in ipairs(image) do out[i] = row end
    return out
end

---Load an image file. Stub: always nil (empty filesystem).
---@param path string
---@return table|nil
function M.loadImage(path)
    return nil
end

---@param x integer
---@param y integer
---@param color integer|nil
function M.drawPixel(x, y, color)
end

---@param startX integer
---@param startY integer
---@param endX integer
---@param endY integer
---@param color integer|nil
function M.drawLine(startX, startY, endX, endY, color)
end

---@param startX integer
---@param startY integer
---@param endX integer
---@param endY integer
---@param color integer|nil
function M.drawBox(startX, startY, endX, endY, color)
end

---@param startX integer
---@param startY integer
---@param endX integer
---@param endY integer
---@param color integer|nil
function M.drawFilledBox(startX, startY, endX, endY, color)
end

---@param image table
---@param x integer
---@param y integer
function M.drawImage(image, x, y)
end

return M
