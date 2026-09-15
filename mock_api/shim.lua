-- mock_api/shim.lua
-- Environment bridge between PC tests and real computers.
--
-- Game code loads this (and ONLY this) mock file, always guarded:
--   local ok, shim = pcall(require, "mock_api.shim")
--   if ok and shim then shim.useMocks() end
-- On a PC the require succeeds and the fakes install; in-game the require
-- fails (file never uploaded), pcall swallows it, and the real CC APIs —
-- already global there — are used untouched.

local M = {}

---True when running on a real CC:Tweaked computer.
---@return boolean
function M.isComputer()
    -- Primary signal: bios.lua defines _HOST, e.g. "ComputerCraft 1.13".
    if type(_HOST) == "string" and _HOST:find("ComputerCraft", 1, true) then
        return true
    end
    -- Fallback: feature-detect the core native APIs.
    return type(term) == "table"
        and type(peripheral) == "table"
        and type(fs) == "table"
        and type(os) == "table"
        and type(os.getComputerID) == "function"
end

---Ensure require() can find repo-root modules (idempotent, PC only).
function M.ensurePath()
    if type(package) ~= "table" or type(package.path) ~= "string" then return end
    if not package.path:find("./?.lua", 1, true) then
        package.path = package.path .. ";./?.lua;./?/init.lua"
    end
end

---Install mock APIs as globals unless running in-game.
---Safe to call anywhere: in-game it is a no-op returning nil.
---@return table<string, table>|nil loaded modules on PC, nil in-game.
function M.useMocks()
    if M.isComputer() then return nil end
    M.ensurePath()
    local init = require("mock_api.init")
    return init.install()
end

return M
