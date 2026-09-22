-- mock_api/term.lua
-- Stub of CC:Tweaked's term API (spec: api-docs/cctweaked/rom/apis/term.lua + knowledge).
-- Stateless stub: fixed 51x19 screen, cursor (1,1). M._state / M.reset() are
-- the seam for a stateful version later (framebuffer, cursor, palette).

---@class TermRedirectTarget opaque redirect target.
local M = {}

---@type table<string, any> reserved for future stateful behaviour.
M._state = {}

---Clear any recorded state (no-op while stateless).
function M.reset()
    M._state = {}
end

---@return table the current terminal object (here: this mock itself).
function M.current()
    return M
end

---@return table the native terminal object (here: this mock itself).
function M.native()
    return M
end

---Redirect terminal output. Returns the previous terminal (this mock).
---@param target table
---@return table
function M.redirect(target)
    return M
end

---Write text at the cursor.
---@param text string|number
function M.write(text)
end

---Scroll the screen.
---@param lines integer
function M.scroll(lines)
end

---@return integer x, integer y cursor position (stub: 1, 1).
function M.getCursorPos()
    return 1, 1
end

---@param x integer
---@param y integer
function M.setCursorPos(x, y)
end

---@return boolean (stub: false).
function M.getCursorBlink()
    return false
end

---@param blink boolean
function M.setCursorBlink(blink)
end

---@return integer width, integer height (stub: 51, 19).
function M.getSize()
    return 51, 19
end

---Clear the screen.
function M.clear()
end

---Clear the current line.
function M.clearLine()
end

---@return integer text colour (stub: white = 1).
function M.getTextColor()
    return 1
end

---@return integer text colour alias.
function M.getTextColour()
    return M.getTextColor()
end

---@param color integer
function M.setTextColor(color)
end

---@param color integer colour alias.
function M.setTextColour(color)
    M.setTextColor(color)
end

---@return integer background colour (stub: black = 32768).
function M.getBackgroundColor()
    return 32768
end

---@return integer background colour alias.
function M.getBackgroundColour()
    return M.getBackgroundColor()
end

---@param color integer
function M.setBackgroundColor(color)
end

---@param color integer colour alias.
function M.setBackgroundColour(color)
    M.setBackgroundColor(color)
end

---@return boolean always true in the mock (colour terminal).
function M.isColor()
    return true
end

---@return boolean colour alias.
function M.isColour()
    return M.isColor()
end

---Set a palette entry. Stub: no-op.
---@param index integer colour index.
---@param color integer packed RGB.
function M.setPaletteColor(index, color)
end

---Colour alias.
---@param index integer
---@param color integer
function M.setPaletteColour(index, color)
    M.setPaletteColor(index, color)
end

---Get a palette entry. Stub returns white for every index.
---@param index integer
---@return integer packed RGB.
function M.getPaletteColor(index)
    return 0xFFFFFF
end

---Colour alias.
---@param index integer
---@return integer
function M.getPaletteColour(index)
    return M.getPaletteColor(index)
end

---Native palette entry (unaffected by setPaletteColor). Stub: white.
---@param index integer
---@return integer packed RGB.
function M.nativePaletteColor(index)
    return 0xFFFFFF
end

---Colour alias.
---@param index integer
---@return integer
function M.nativePaletteColour(index)
    return M.nativePaletteColor(index)
end

---Graphics mode. Stub: no graphics mode (false).
---@return boolean|integer
function M.getGraphicsMode()
    return false
end

---Set graphics mode. Stub: no-op.
---@param mode boolean|integer
function M.setGraphicsMode(mode)
end

---Write text with per-character colours. Validates equal lengths like real term.
---@param text string
---@param fg string hex colours for text
---@param bg string hex colours for background
function M.blit(text, fg, bg)
    if type(text) ~= "string" then error("bad argument #1 (expected string, got " .. type(text) .. ")", 2) end
    if type(fg) ~= "string" then error("bad argument #2 (expected string, got " .. type(fg) .. ")", 2) end
    if type(bg) ~= "string" then error("bad argument #3 (expected string, got " .. type(bg) .. ")", 2) end
    if #fg ~= #text or #bg ~= #text then error("Arguments must be the same length", 2) end
end

return M
