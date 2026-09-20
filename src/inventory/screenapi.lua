-- src/inventory/screenapi.lua
-- Demo for every CC:Tweaked monitor method — works on any size (1x1 to big wall).
-- Also shows keyboard input on the monitor (term.redirect + read / os.pullEvent).
-- Runs unchanged in-game and under PC tests (shim bootstrap below).
-- Monitor API: peripheral type "monitor", term-compatible + getTextScale/setTextScale.
-- See: api-docs/cctweaked/rom/programs/monitor.lua
--      vanilla monitor stub + term/window stubs (mock layer), api-docs term/window
--      api-docs/cctweaked/doc/stub/global.lua (read), api-docs/cctweaked/rom/apis/keys.lua

-- luacheck: ignore (globals print/peripheral/term/window/colors/colours/keys/os/shell/fs/textutils are CC-provided in-game)
local ok, shim = pcall(require, "mock_api.shim")
if ok and shim then shim.useMocks() end -- PC: fakes on; game: silent no-op

if type(shell) == "table" and shell.getRunningProgram and type(fs) == "table" then
    local dir = fs.getDir(shell.getRunningProgram())
    package.path = package.path .. ";" .. dir .. "/?.lua;" .. dir .. "/?/init.lua"
end

-- File-only logging: overwrite one log in the computer's own dir (matches main.lua).
---@type string log path
local logPath = "screenapi.log"
if type(shell) == "table" and shell.getRunningProgram and type(fs) == "table" and type(fs.combine) == "function" then
    local dir = fs.getDir(shell.getRunningProgram())
    if dir and dir ~= "" then logPath = fs.combine(dir, "screenapi.log") end
end
---@type table|nil file handle from fs.open
local logHandle = nil
---@type function|nil closer that restores print and closes file
local closeLog = nil
if type(fs) == "table" and type(fs.open) == "function" then
    local f, err = fs.open(logPath, "w")
    if f then
        logHandle = f
        local oldPrint = print
        _G.print = function(...)
            local n = select("#", ...)
            local parts = {}
            for i = 1, n do parts[i] = tostring(select(i, ...)) end
            local line = table.concat(parts, "\t")
            if logHandle and type(logHandle.writeLine) == "function" then
                logHandle.writeLine(line)
            elseif logHandle and type(logHandle.write) == "function" then
                logHandle.write(line .. "\n")
            end
        end
        closeLog = function()
            if logHandle and type(logHandle.close) == "function" then logHandle.close() end
            logHandle = nil
            _G.print = oldPrint
        end
    else
        if err then print("log open failed: " .. tostring(err)) end
    end
end

---@class Monitor : table
---@field write fun(text: string)
---@field blit fun(text: string, fg: string, bg: string)
---@field scroll fun(n: integer)
---@field getCursorPos fun(): integer, integer
---@field setCursorPos fun(x: integer, y: integer)
---@field getCursorBlink fun(): boolean
---@field setCursorBlink fun(b: boolean)
---@field getSize fun(): integer, integer
---@field clear fun()
---@field clearLine fun()
---@field getTextColor fun(): integer
---@field getTextColour fun(): integer
---@field setTextColor fun(c: integer)
---@field setTextColour fun(c: integer)
---@field getBackgroundColor fun(): integer
---@field getBackgroundColour fun(): integer
---@field setBackgroundColor fun(c: integer)
---@field setBackgroundColour fun(c: integer)
---@field isColor fun(): boolean
---@field isColour fun(): boolean
---@field setPaletteColor fun(idx: integer, col: integer)
---@field setPaletteColour fun(idx: integer, col: integer)
---@field getPaletteColor fun(idx: integer): integer
---@field getPaletteColour fun(idx: integer): integer
---@field getTextScale fun(): number
---@field setTextScale fun(s: number)

---Pretty-print via textutils when available.
---@param v any
---@return string
local function serialise(v)
    if type(textutils) == "table" and type(textutils.serialise) == "function" then
        return textutils.serialise(v)
    end
    if type(v) == "table" then
        local parts = {}
        for k, val in pairs(v) do parts[#parts + 1] = tostring(k) .. "=" .. tostring(val) end
        return "{" .. table.concat(parts, ", ") .. "}"
    end
    return tostring(v)
end

---Find all attached monitors (works on any size).
---@return string[]
local function findMonitors()
    local out = {}
    if type(peripheral) ~= "table" or type(peripheral.getNames) ~= "function" then return out end
    for _, name in ipairs(peripheral.getNames()) do
        local t = nil
        if type(peripheral.getType) == "function" then t = peripheral.getType(name) end
        if t == "monitor" then
            out[#out + 1] = name
        else
            -- duck-type: any peripheral with getTextScale+getSize is monitor-like
            local methods = nil
            if type(peripheral.getMethods) == "function" then methods = peripheral.getMethods(name) end
            if methods then
                local hasScale, hasSize = false, false
                for i = 1, #methods do
                    if methods[i] == "getTextScale" then hasScale = true end
                    if methods[i] == "getSize" then hasSize = true end
                end
                if hasScale and hasSize then out[#out + 1] = name end
            end
        end
    end
    return out
end

---Resolve colours table (colors vs colours alias).
---@return table|nil
local function getColors()
    if type(colors) == "table" then return colors end
    if type(colours) == "table" then return colours end
    if type(_G) == "table" and type(_G.colors) == "table" then return _G.colors end
    return nil
end

---Safely call and print result.
---@param label string
---@param fn function
---@param ... any
local function safeCall(label, fn, ...)
    local ok2, res1, res2, res3 = pcall(fn, ...)
    if ok2 then
        if res1 == nil and res2 == nil then
            print("  " .. label .. " -> ok (no return)")
        elseif res2 == nil then
            print("  " .. label .. " -> " .. serialise(res1))
        else
            print("  " .. label .. " -> " .. serialise(res1) .. ", " .. serialise(res2) .. (res3 ~= nil and (", " .. serialise(res3)) or ""))
        end
    else
        print("  " .. label .. " -> error: " .. tostring(res1))
    end
end

-- ============================================================
-- ScreenAPI — importable helpers (also used by the demo below)
-- ============================================================
local ScreenAPI = {}

---Find monitors (any size).
---@return string[]
function ScreenAPI.findMonitors() return findMonitors() end

---Wrap a monitor by side/name.
---@param name string e.g. "top" or "monitor_0"
---@return Monitor|nil
function ScreenAPI.wrap(name)
    if type(peripheral) ~= "table" or type(peripheral.wrap) ~= "function" then return nil end
    return peripheral.wrap(name) --[[@as Monitor|nil]]
end

---Run fn with term redirected to monitor, always restoring.
---@param mon Monitor
---@param fn fun()
function ScreenAPI.withMonitor(mon, fn)
    local prev = term.redirect(mon)
    local ok2, err = pcall(fn)
    term.redirect(prev)
    if not ok2 then error(err, 2) end
end

---Clear monitor and print a centered header (adapts to any w/h).
---@param mon Monitor
---@param title string
function ScreenAPI.header(mon, title)
    mon.clear()
    local w, _ = mon.getSize()
    mon.setCursorPos(math.max(1, math.floor((w - #title) / 2) + 1), 1)
    mon.write(title)
end

---Simple keyboard input on the monitor: redirect + read().
---Blocks until ENTER. Handles backspace/arrows/paste/history via CC's read().
---@param mon Monitor
---@param prompt string|nil shown before input
---@param replaceChar string|nil e.g. "*" to hide password
---@param history string[]|nil up/down history
---@param default string|nil pre-filled text
---@return string|nil typed text (nil if no read available)
function ScreenAPI.readOnMonitor(mon, prompt, replaceChar, history, default)
    local prev = term.redirect(mon)
    if prompt and prompt ~= "" then
        mon.clear()
        mon.setCursorPos(1, 1)
        if type(term) == "table" and type(term.write) == "function" then
            term.write(prompt)
        else
            mon.write(prompt)
        end
    else
        -- ensure cursor visible at prompt line
        local _, y = mon.getCursorPos()
        mon.setCursorPos(1, y)
    end
    -- term needs a readable read() global
    local result = nil
    if type(read) == "function" then
        -- read(replaceChar, history, completeFn, default)
        result = read(replaceChar, history, nil, default)
    else
        print("read() not available in this env")
    end
    term.redirect(prev)
    return result
end

---Manual line editor on the monitor (no read() dependency).
---Demonstrates raw os.pullEvent("key"/"char"/"paste"/"key_up") on a redirected monitor.
---Supports backspace, enter to submit, paste, and live echo with cursor blink.
---@param mon Monitor
---@param prompt string|nil
---@return string typed text
function ScreenAPI.inputOnMonitor(mon, prompt)
    local col = getColors()
    local prev = term.redirect(mon)
    mon.clear()
    mon.setCursorPos(1, 1)
    if prompt then mon.write(prompt) end
    local startX = col and 1 or 1
    -- track where input starts
    local px, py = mon.getCursorPos()
    startX = px
    local y = py
    local buf = ""
    local blinkOn = true
    if type(mon.getCursorBlink) == "function" then blinkOn = mon.getCursorBlink() end
    mon.setCursorBlink(true)

    local function redraw()
        mon.setCursorPos(startX, y)
        -- clear to end of line then write buf
        if mon.clearLine then mon.clearLine() end
        mon.setCursorPos(startX, y)
        mon.write(buf)
        -- cursor after buf
        mon.setCursorPos(startX + #buf, y)
    end
    redraw()

    while true do
        local ev, p1, p2 = os.pullEvent()
        if ev == "char" then
            -- p1 is the character string
            buf = buf .. tostring(p1)
            redraw()
        elseif ev == "key" then
            -- p1 = key code, p2 = isHeld (bool)
            local code = p1
            local name = nil
            if type(keys) == "table" and type(keys.getName) == "function" then
                local ok2, n = pcall(keys.getName, code)
                if ok2 then name = n end
            end
            -- enter (handle both old LWJGL2=28 and GLFW=257/numpadEnter)
            local isEnter = (code == 28 or code == 257 or code == 335)
            if name == "enter" then isEnter = true end
            -- backspace (14 old, 259 GLFW)
            local isBack = (code == 14 or code == 259)
            if name == "backspace" then isBack = true end
            if isEnter then
                break
            elseif isBack then
                if #buf > 0 then
                    buf = buf:sub(1, #buf - 1)
                    redraw()
                end
            end
        elseif ev == "paste" then
            -- p1 is pasted string
            buf = buf .. tostring(p1)
            redraw()
        elseif ev == "key_up" then
            -- available for held-key tracking; no-op here
        elseif ev == "terminate" then
            buf = ""
            break
        end
    end
    mon.setCursorBlink(blinkOn)
    term.redirect(prev)
    return buf
end

---Minimal interactive demo: draws a form and reads name + password on the monitor.
---@param mon Monitor
---@param name string monitor side for monitor_touch filtering
function ScreenAPI.demoKeyboardForm(mon, name)
    -- 1) read() variant (simplest) — one line, press ENTER
    print("demoKeyboardForm: try ScreenAPI.readOnMonitor (simple) — type a name")
    local who = ScreenAPI.readOnMonitor(mon, "Name> ", nil, nil, nil)
    print("  readOnMonitor -> " .. serialise(who))
    -- echo result back to monitor
    local prev = term.redirect(mon)
    mon.clear()
    mon.setCursorPos(1, 1)
    mon.write("Hello, " .. tostring(who or "?") .. "!")
    mon.setCursorPos(1, 3)
    mon.write("Now manual input (os.pullEvent):")
    term.redirect(prev)
    -- 2) manual event loop variant (full control)
    local typed = ScreenAPI.inputOnMonitor(mon, "Manual> ")
    print("  inputOnMonitor -> " .. serialise(typed))
    local prev2 = term.redirect(mon)
    mon.clear()
    mon.setCursorPos(1, 1)
    mon.write("You typed: " .. typed)
    mon.setCursorPos(1, 3)
    mon.write("Touch monitor or ENTER to quit")
    term.redirect(prev2)
    -- wait for either key enter or monitor_touch on this monitor
    while true do
        local ev, p1, p2, p3 = os.pullEvent()
        if ev == "key" then
            local code = p1
            local nm = nil
            if type(keys) == "table" and type(keys.getName) == "function" then
                local ok2, nn = pcall(keys.getName, code); if ok2 then nm = nn end
            end
            if code == 28 or code == 257 or nm == "enter" then break end
        elseif ev == "monitor_touch" and p1 == name then
            -- p2=x, p3=y touch coords
            print(string.format("  monitor_touch on %s at %s,%s", tostring(p1), tostring(p2), tostring(p3)))
            break
        elseif ev == "terminate" then break end
    end
    local prev3 = term.redirect(mon)
    mon.clear()
    mon.setCursorPos(1, 1)
    mon.write("Done.")
    term.redirect(prev3)
end

-- ============================================================
-- Full per-monitor demo exercising every monitor/term/window method
-- ============================================================

---Demo one monitor exhaustively (any size).
---@param name string side/name
---@param mon Monitor
local function demoOne(name, mon)
    print("--- Monitor: " .. name .. " (" .. tostring(peripheral.getType and peripheral.getType(name) or "?") .. ") ---")
    local col = getColors()

    -- 1) getSize — adapts to 1x1 or wall, never assumes.
    local w, h = mon.getSize()
    print(string.format("getSize() -> %d x %d (any size ok)", w, h))

    -- 2) isColor / isColour (alias check)
    safeCall("isColor()", mon.isColor)
    safeCall("isColour() alias", mon.isColour)

    -- 3) getTextScale / setTextScale — 0.5..5 valid (monitor.lua:27). Demo non-destructively.
    local origScale = mon.getTextScale()
    print("getTextScale() -> " .. tostring(origScale))
    local scales = { 0.5, 1, 2, 5 }
    for i = 1, #scales do
        local s = scales[i]
        -- 5 is max; 0.5 is min; skip if already at that scale to avoid no-op spam
        if s ~= origScale then
            local ok2 = pcall(mon.setTextScale, s)
            if ok2 then
                local nw, nh = mon.getSize()
                print(string.format("  setTextScale(%s) -> %d x %d", tostring(s), nw, nh))
            else
                print("  setTextScale(" .. tostring(s) .. ") -> error")
            end
        end
    end
    pcall(mon.setTextScale, origScale)
    local rw, rh = mon.getSize()
    print(string.format("  restored setTextScale(%s) -> %d x %d", tostring(origScale), rw, rh))

    -- 4) Cursor: getCursorPos / setCursorPos / getCursorBlink / setCursorBlink
    local cx, cy = mon.getCursorPos()
    print(string.format("getCursorPos() -> %d, %d", cx, cy))
    mon.setCursorPos(1, 1)
    print("setCursorPos(1,1)")
    local blink = mon.getCursorBlink()
    print("getCursorBlink() -> " .. tostring(blink))
    mon.setCursorBlink(true)
    print("setCursorBlink(true) -> " .. tostring(mon.getCursorBlink()))
    mon.setCursorBlink(false)
    print("setCursorBlink(false) -> " .. tostring(mon.getCursorBlink()))
    mon.setCursorPos(cx, cy)

    -- 5) Colors: getTextColor / setTextColor + Colour aliases, same for background
    -- Use colors.* if available, else raw numbers.
    local white = col and col.white or 1
    local yellow = col and col.yellow or 16
    local blue = col and col.blue or 2048
    local black = col and col.black or 32768
    local red = col and col.red or 16384
    safeCall("getTextColor()", mon.getTextColor)
    safeCall("getTextColour() alias", mon.getTextColour)
    mon.setTextColor(yellow)
    print("setTextColor(yellow/" .. tostring(yellow) .. ")")
    mon.setTextColour(white)
    print("setTextColour(white) alias -> " .. tostring(mon.getTextColour()))
    safeCall("getBackgroundColor()", mon.getBackgroundColor)
    safeCall("getBackgroundColour() alias", mon.getBackgroundColour)
    mon.setBackgroundColor(blue)
    print("setBackgroundColor(blue)")
    mon.setBackgroundColour(black)
    print("setBackgroundColour(black) alias")
    -- blit helpers (if colors present, show hex char)
    if col and type(col.toBlit) == "function" then
        print("  colors.toBlit(yellow) -> " .. col.toBlit(yellow) .. "  colors.fromBlit('e') -> " .. tostring(col.fromBlit("e")))
    end

    -- 6) Palette: setPaletteColor / getPaletteColor (+ Colour aliases), native palette if term
    if type(mon.getPaletteColor) == "function" then
        local pr, pg, pb = 1, 0, 0
        -- get current palette for red
        local cur = mon.getPaletteColor(red)
        print("getPaletteColor(red) -> " .. serialise(cur))
        if type(mon.setPaletteColor) == "function" then
            -- variant 1: packed integer 0xRRGGBB
            mon.setPaletteColor(red, 0xFF5555)
            print("setPaletteColor(red, 0xFF5555)")
            -- variant 2: unpacked r,g,b floats 0..1 (window/term palette supports both)
            -- pcall in case monitor palette expects packed only
            local ok2 = pcall(mon.setPaletteColour, red, 1, 0.2, 0.2)
            if ok2 then print("setPaletteColour(red, 1, 0.2, 0.2) unpacked variant") end
            -- restore loosely
            pcall(mon.setPaletteColor, red, cur)
        end
        safeCall("getPaletteColour() alias", mon.getPaletteColour, red)
        if type(term) == "table" and type(term.nativePaletteColor) == "function" then
            safeCall("term.nativePaletteColor(red)", term.nativePaletteColor, red)
        end
    end

    -- 7) Write / blit / clear / clearLine / scroll (any-size safe)
    mon.clear()
    print("clear()")
    mon.setCursorPos(1, 1)
    mon.setTextColor(white)
    mon.setBackgroundColor(black)
    mon.write("Monitor " .. name .. " " .. tostring(w) .. "x" .. tostring(h))
    print("write('Monitor ...') at 1,1")
    mon.setCursorPos(1, 2)
    mon.write("line 2 - hello")
    if type(mon.blit) == "function" then
        -- blit needs equal-length strings: text, fg hex, bg hex
        -- "Hi!" with yellow on blue, etc.
        mon.setCursorPos(1, 3)
        -- toBlit('e')=red fallback if no colors
        local fg = "eee"
        local bg = "fff"
        if col and col.toBlit then fg = col.toBlit(yellow) .. col.toBlit(white) .. col.toBlit(red) end
        -- bg stays black 'f'
        pcall(mon.blit, "Hi!", fg, bg)
        print("blit('Hi!', fg, bg) at 3,1")
    else
        print("blit() not on this monitor stub (real hardware has it via term)")
    end
    mon.setCursorPos(1, 2)
    mon.clearLine()
    print("clearLine() at row 2")
    mon.setCursorPos(1, h)
    mon.write("bottom line")
    mon.scroll(1)
    print("scroll(1) -> content moves up 1")
    mon.scroll(-1)
    print("scroll(-1) -> back")

    -- 8) term.redirect pattern — the way to get keyboard input + print on monitor
    print("term.redirect demo:")
    local prev = term.redirect(mon)
    -- from here, term.* and print/write go to the monitor
    term.clear()
    term.setCursorPos(1, 1)
    term.write("via term.redirect")
    term.setCursorPos(1, 2)
    -- colours via term as well (same palette)
    if type(term.setTextColor) == "function" and col then
        term.setTextColor(col.lime or col.green or white)
        term.write(" term.setTextColor(lime)")
        term.setTextColor(white)
    end
    print("  term.redirect(monitor); term.write/print now on monitor")
    -- blit via term (always available, even if mon.blit missing)
    if type(term.blit) == "function" then
        term.setCursorPos(1, 3)
        term.blit("term.blit!", "eeeeeeeee", "fffffffff")
        print("  term.blit('term.blit!',...)")
    end
    print("  term.current() == monitor? " .. tostring(term.current() == mon))
    if type(term.native) == "function" then
        print("  term.native() -> " .. tostring(term.native()))
    end
    term.redirect(prev)
    print("term.redirect(prev) -> restored to computer terminal")

    -- 9) window.create on the monitor (sub-rectangle, any-size safe)
    if type(window) == "table" and type(window.create) == "function" then
        local ww = math.max(1, math.min(20, w - 2))
        local wh = math.max(1, math.min(5, h - 2))
        if ww >= 3 and wh >= 2 then
            local win = window.create(mon, 2, 2, ww, wh, true)
            print(string.format("window.create(monitor,2,2,%d,%d) -> %d x %d", ww, wh, win.getSize()))
            win.clear()
            win.setCursorPos(1, 1)
            win.write("window!")
            win.setCursorPos(1, 2)
            if col then win.setTextColor(col.cyan or col.lightBlue or white) end
            win.write("on monitor")
            safeCall("win.isVisible()", win.isVisible)
            win.setVisible(false)
            print("win.setVisible(false)")
            win.setVisible(true)
            print("win.setVisible(true)")
            win.redraw()
            print("win.redraw()")
            win.restoreCursor()
            print("win.restoreCursor()")
            safeCall("win.getPosition()", win.getPosition)
            safeCall("win.getSize()", win.getSize)
            -- reposition demo (move to 1,1)
            win.reposition(1, 1, ww, wh, mon)
            print("win.reposition(1,1,...)")
            if type(win.getLine) == "function" then safeCall("win.getLine(1)", win.getLine, 1) end
            -- leave monitor clear after window demo
            mon.clear()
        else
            print("window.create skipped: monitor too small for window demo (" .. w .. "x" .. h .. ")")
        end
    else
        print("window API not available")
    end

    -- 10) Keyboard input — show call shapes without blocking in non-interactive mode
    print("keyboard input on monitor — call shapes:")
    print('  local prev = term.redirect(monitor); local s = read(); term.redirect(prev)')
    print('  -- read() handles backspace/arrows/paste/history, blocks until ENTER')
    print('  local s = ScreenAPI.readOnMonitor(monitor, "Name> ")')
    print('  local s = ScreenAPI.inputOnMonitor(monitor, "Manual> ") -- raw os.pullEvent("key"/"char"/"paste")')
    print("  -- events you handle manually:")
    print("  --   \"key\"       -> keyCode, isHeld  (keys.getName(code) -> \"enter\"/\"backspace\"/...)")
    print("  --   \"char\"      -> char")
    print("  --   \"key_up\"    -> keyCode")
    print("  --   \"paste\"     -> text")
    print("  --   \"monitor_touch\" -> side, x, y  (for this monitor name)")
    print("  --   \"monitor_resize\"-> side        (text scale changed, re-query getSize())")
    print("  --   \"terminate\" -> Ctrl+T")
    print("  paste event example: local _, text = os.pullEvent(\"paste\")")

    -- quick non-blocking proof that monitors receive monitor_* but keys are global:
    -- (just document; don't consume events here so demo stays non-blocking)
    print("  tip: after term.redirect(monitor), os.pullEvent(\"key\") still fires from the computer keyboard,")
    print("       but term/read output goes to the monitor. That's how 'keyboard on monitor' works.")

    -- leave a friendly screen on the monitor itself
    local prev2 = term.redirect(mon)
    mon.clear()
    mon.setCursorPos(1, 1)
    if col then term.setTextColor(col.yellow or white) end
    mon.write("screenapi demo ok")
    mon.setCursorPos(1, 2)
    if col then term.setTextColor(white) end
    mon.write(w .. "x" .. h .. " scale " .. tostring(mon.getTextScale()))
    mon.setCursorPos(1, 3)
    mon.write("try: screenapi keyboard")
    term.redirect(prev2)

    print("")
end

---Show the 3-line minimal snippets users actually copy-paste.
---@param side string
local function printMinimalExamples(side)
    print("== Minimal copy-paste snippets ==")
    print('-- wrap any size monitor on "' .. side .. '": local m = peripheral.wrap("' .. side .. '")')
    print('  m.clear(); m.setCursorPos(1,1); m.write("Hello")')
    print('  print(m.getSize(), m.getTextScale())')
    print('-- print via term.redirect (so read() goes to monitor):')
    print('  local prev = term.redirect(m); print("hi"); term.redirect(prev)')
    print('-- keyboard: simplest (blocks until ENTER):')
    print('  local prev = term.redirect(m); m.clear(); m.setCursorPos(1,1); write("Name> "); local s = read(); term.redirect(prev); print(s)')
    print('-- via ScreenAPI helper:')
    print('  local screenapi = require("screenapi"); local s = screenapi.readOnMonitor(m, "Name> ")')
    print('-- manual keys (no read):')
    print('  local buf=""; while true do local e,k = os.pullEvent("key"); if k==keys.enter then break end end')
    print('-- paste:')
    print('  local e, text = os.pullEvent("paste"); print(text)')
    print('-- monitor touch + resize (any size):')
    print('  local e, side, x, y = os.pullEvent("monitor_touch")  -- side=="' .. side .. '"')
    print('  local e, side = os.pullEvent("monitor_resize"); local w,h = m.getSize()')
    print('-- setTextScale (changes getSize):')
    print('  m.setTextScale(0.5) -- smallest text, biggest w/h; 5 is largest text')
    print('-- window on monitor:')
    print('  local win = window.create(m, 2, 2, 10, 5); win.write("hi")')
end

-- ===== main =====
print("Monitors attached: " .. serialise(findMonitors()))
for _, n in ipairs(findMonitors()) do
    print("  " .. n .. " -> " .. tostring(peripheral.getType and peripheral.getType(n) or "?"))
end

-- Try the standard 6 sides like main.lua but also any peripheral.find result.
local sides = { "left", "right", "top", "bottom", "front", "back" }
local didMinimal = false
for i = 1, #sides do
    if type(peripheral.isPresent) == "function" and peripheral.isPresent(sides[i]) then
        local mt = nil
        if type(peripheral.getType) == "function" then mt = peripheral.getType(sides[i]) end
        if mt == "monitor" then
            local m = peripheral.wrap(sides[i]) --[[@as Monitor]]
            if m and type(m.getSize) == "function" then
                if not didMinimal then printMinimalExamples(sides[i]); didMinimal = true end
                break
            end
        end
    end
end
-- also cover named monitors like monitor_0 (wired network)
local found, foundName = nil, nil
if type(peripheral.find) == "function" then found, foundName = peripheral.find("monitor") end
if found and not didMinimal then
    printMinimalExamples(tostring(foundName))
    didMinimal = true
end
if not didMinimal then
    printMinimalExamples("top")
    print('(no monitor found — place any size monitor next to the computer, or in tests: peripheral.attach("top","monitor"))')
end
print("")

-- Full demo for every attached monitor (any size)
local names = findMonitors()
if #names == 0 then
    print("No monitors to demo fully. Attach one and re-run.")
    print('In-game: place a monitor (any size) adjacent or via wired modem, then run: screenapi')
    print('In tests: peripheral.attach("top","monitor"); dofile("src/inventory/screenapi.lua")')
else
    for i = 1, #names do
        local m = peripheral.wrap(names[i]) --[[@as Monitor]]
        if m then demoOne(names[i], m) end
    end

    -- Optional interactive keyboard demo: only if user passed "keyboard" arg.
    -- Keeps the normal demo non-blocking for tests.
    local wantKeyboard = false
    if type(arg) == "table" then
        for i = 1, #arg do if arg[i] == "keyboard" then wantKeyboard = true end end
    end
    -- shell.getRunningProgram args are also in ... (varargs of file)
    -- Check via ... as fallback when run via shell
    if not wantKeyboard then
        -- When run as `screenapi keyboard` via shell, ... contains "keyboard"
        local vargs = { ... }
        for i = 1, #vargs do if vargs[i] == "keyboard" then wantKeyboard = true end end
    end
    if wantKeyboard and #names > 0 then
        print('Interactive keyboard demo on "' .. names[1] .. '" — type on the computer keyboard, see it on the monitor.')
        local m = peripheral.wrap(names[1]) --[[@as Monitor]]
        if m then ScreenAPI.demoKeyboardForm(m, names[1]) end
    else
        if #names > 0 then
            print('Tip: run `screenapi keyboard` for an interactive keyboard-on-monitor demo (read + manual os.pullEvent).')
        end
    end
end

-- close file-only log and restore terminal
if closeLog then
    closeLog()
    print("Log written to " .. logPath .. " (overwrite, file-only) — view with `cat " .. logPath .. "` or `edit " .. logPath .. "`")
end

return ScreenAPI
