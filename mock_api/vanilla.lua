-- mock_api/vanilla.lua
-- Method tables for CC:Tweaked's built-in (vanilla) peripherals:
-- modem (wired + wireless), monitor, speaker, printer, drive, computer.
-- Spec from knowledge of the stable peripheral surface (no api-docs source).
-- Stateless stubs. Registered through peripheral.registerType() by init.lua.
--
-- Shape (shared by create.lua / createavionics.lua / advancedperipherals.lua):
--   M.types[typeName] = { methodName = function... }

local M = {}

---@type table<string, any> reserved for future stateful behaviour.
M._state = {}

---Clear any recorded state (no-op while stateless).
function M.reset()
    M._state = {}
end

---@type table<string, table<string, fun>>
M.types = {}

-- Wired + wireless modem.
M.types["modem"] = {
    ---@param channel integer
    open = function(channel) end,
    ---@param channel integer
    close = function(channel) end,
    ---@param channel integer
    ---@return boolean (stub: false).
    closeAll = function() end,
    isOpen = function(channel) return false end,
    isWireless = function() return false end,
    ---@param channel integer
    ---@param replyChannel integer
    ---@param message any
    transmit = function(channel, replyChannel, message) end,
}

-- Monitor (advanced handling ignored; term-compatible + text scale).
M.types["monitor"] = {
    write = function(text) end,
    blit = function(text, fg, bg)
        if type(text) ~= "string" then error("bad argument #1 (expected string, got " .. type(text) .. ")", 2) end
        if type(fg) ~= "string" then error("bad argument #2 (expected string, got " .. type(fg) .. ")", 2) end
        if type(bg) ~= "string" then error("bad argument #3 (expected string, got " .. type(bg) .. ")", 2) end
        if #fg ~= #text or #bg ~= #text then error("Arguments must be the same length", 2) end
    end,
    scroll = function(n) end,
    getCursorPos = function() return 1, 1 end,
    setCursorPos = function(x, y) end,
    getCursorBlink = function() return false end,
    setCursorBlink = function(b) end,
    getSize = function() return 51, 19 end,
    clear = function() end,
    clearLine = function() end,
    getTextColor = function() return 1 end,
    getTextColour = function() return 1 end,
    setTextColor = function(c) end,
    setTextColour = function(c) end,
    getBackgroundColor = function() return 32768 end,
    getBackgroundColour = function() return 32768 end,
    setBackgroundColor = function(c) end,
    setBackgroundColour = function(c) end,
    isColor = function() return true end,
    isColour = function() return true end,
    setPaletteColor = function(i, c) end,
    setPaletteColour = function(i, c) end,
    getPaletteColor = function(i) return 0xFFFFFF end,
    getPaletteColour = function(i) return 0xFFFFFF end,
    ---@return number (stub: 1).
    getTextScale = function() return 1 end,
    ---@param scale number
    setTextScale = function(scale) end,
}

-- Speaker.
M.types["speaker"] = {
    ---@param instrument string|nil
    ---@param volume number|nil
    ---@param pitch number|nil
    ---@return boolean (stub: true).
    playNote = function(instrument, volume, pitch) return true end,
    ---@param name string
    ---@param volume number|nil
    ---@param pitch number|nil
    ---@return boolean (stub: true).
    playSound = function(name, volume, pitch) return true end,
    ---@param audio integer[]|nil
    ---@param volume number|nil
    ---@return boolean (stub: true).
    playAudio = function(audio, volume) return true end,
    stop = function() end,
}

-- Printer.
M.types["printer"] = {
    ---@param title string|nil
    ---@return boolean (stub: true).
    newPage = function(title) return true end,
    endPage = function() return true end,
    ---@param text string
    write = function(text) end,
    ---@param text string
    setPageTitle = function(text) end,
    ---@return integer (stub: 0).
    getCursorPos = function() return 1, 1 end,
    setCursorPos = function(x, y) end,
    ---@return integer, integer (stub: 25, 21).
    getPageSize = function() return 25, 21 end,
    ---@return integer (stub: 0).
    getInkLevel = function() return 0 end,
    ---@return integer (stub: 0).
    getPaperLevel = function() return 0 end,
}

-- Disk drive.
M.types["drive"] = {
    ---@return boolean (stub: false).
    isDiskPresent = function() return false end,
    ---@return string|nil (stub: nil).
    getDiskLabel = function() return nil end,
    ---@param label string|nil
    setDiskLabel = function(label) end,
    ---@return boolean (stub: false).
    hasData = function() return false end,
    ---@return string|nil (stub: nil).
    getMountPath = function() return nil end,
    ---@return boolean (stub: false).
    hasAudio = function() return false end,
    ---@return string|nil, string|nil (stub: nil, nil).
    getAudioTitle = function() return nil, nil end,
    playAudio = function() end,
    stopAudio = function() end,
    ejectDisk = function() end,
    ---@return integer|nil (stub: nil).
    getDiskID = function() return nil end,
}

-- Adjacent computer (wired network).
M.types["computer"] = {
    ---@return integer (stub: 0).
    getID = function() return 0 end,
    turnOn = function() end,
    shutdown = function() end,
    reboot = function() end,
    ---@return string|nil (stub: nil).
    getLabel = function() return nil end,
}

-- Generic inventory (chest, barrel, etc.). CC:Tweaked exposes size/list/
-- getItemDetail/getItemLimit/pushItems/pullItems on any inventory block.
-- Spec: https://tweaked.cc/reference/feature/inventories.html and
-- api-docs/cctweaked/doc/reference/item_details.md
M.types["inventory"] = {
    ---@return integer slots in this inventory (stub: 27 single chest).
    size = function() return 27 end,
    ---@return table<integer, table> sparse slot -> {name, count, nbt?} (stub: {}).
    list = function() return {} end,
    ---@param slot integer
    ---@param detailed boolean|nil when true add displayName/maxCount/tags etc.
    ---@return table|nil (stub: nil, empty slot).
    getItemDetail = function(slot, detailed) return nil end,
    ---@param slot integer
    ---@return integer max stack size for slot (stub: 64).
    getItemLimit = function(slot) return 64 end,
    ---@param toName string peripheral name to push to
    ---@param fromSlot integer
    ---@param limit integer|nil max to move
    ---@param toSlot integer|nil target slot
    ---@return integer moved (stub: 0).
    pushItems = function(toName, fromSlot, limit, toSlot) return 0 end,
    ---@param fromName string peripheral name to pull from
    ---@param fromSlot integer
    ---@param limit integer|nil
    ---@param toSlot integer|nil
    ---@return integer moved (stub: 0).
    pullItems = function(fromName, fromSlot, limit, toSlot) return 0 end,
}
-- Alias used by CC for type checks on chest blocks.
M.types["minecraft:chest"] = M.types["inventory"]

return M
