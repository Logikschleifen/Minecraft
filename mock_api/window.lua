-- mock_api/window.lua
-- Stub of CC:Tweaked's window API (spec: api-docs/.../window.lua + knowledge).
-- window.create() returns a term-like object (fixed 51x19, cursor 1,1).
-- Stateless. M._state / M.reset() are the seam for a stateful version later.

---@class Window
---@field redraw fun()
---@field restoreCursor fun()
---@field setVisible fun(visible: boolean)
---@field isVisible fun(): boolean
local Window = {}
Window.__index = Window

-- Term-compatible surface shared by every mock window.
local TERMLIKE = {
    "write", "scroll", "getCursorPos", "setCursorPos",
    "getCursorBlink", "setCursorBlink", "getSize", "clear", "clearLine",
    "getTextColor", "getTextColour", "setTextColor", "setTextColour",
    "getBackgroundColor", "getBackgroundColour",
    "setBackgroundColor", "setBackgroundColour",
    "isColor", "isColour",
    "setPaletteColor", "setPaletteColour",
    "getPaletteColor", "getPaletteColour",
}

---@param parent table
---@param x integer
---@param y integer
---@param width integer
---@param height integer
---@param visible boolean|nil
---@return Window
local function createWindow(parent, x, y, width, height, visible)
    ---@type Window
    local w = {
        _parent = parent,
        _x = x, _y = y,
        _width = width, _height = height,
        _visible = visible ~= false,
    }
    function w.write(text) end
    function w.scroll(n) end
    function w.getCursorPos() return 1, 1 end
    function w.setCursorPos(cx, cy) end
    function w.getCursorBlink() return false end
    function w.setCursorBlink(b) end
    function w.getSize() return width, height end
    function w.clear() end
    function w.clearLine() end
    function w.getTextColor() return 1 end
    function w.getTextColour() return 1 end
    function w.setTextColor(c) end
    function w.setTextColour(c) end
    function w.getBackgroundColor() return 32768 end
    function w.getBackgroundColour() return 32768 end
    function w.setBackgroundColor(c) end
    function w.setBackgroundColour(c) end
    function w.isColor() return true end
    function w.isColour() return true end
    function w.setPaletteColor(i, c) end
    function w.setPaletteColour(i, c) end
    function w.getPaletteColor(i) return 0xFFFFFF end
    function w.getPaletteColour(i) return 0xFFFFFF end
    function w.redraw() end
    function w.restoreCursor() end
    function w.setVisible(v) w._visible = v end
    function w.isVisible() return w._visible end
    return setmetatable(w, Window)
end

local M = {}

---@type table<string, any> reserved for future stateful behaviour.
M._state = {}

---Clear any recorded state (no-op while stateless).
function M.reset()
    M._state = {}
end

---@param parent table terminal to draw on.
---@param x integer
---@param y integer
---@param width integer
---@param height integer
---@param visible boolean|nil
---@return Window
function M.create(parent, x, y, width, height, visible)
    return createWindow(parent, x, y, width, height, visible)
end

return M
