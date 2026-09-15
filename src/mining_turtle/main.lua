-- src/mining_turtle/main.lua
-- Mining turtle entry point. Runs unchanged in-game and under PC tests.
--
-- Bootstrap (copy into every src/<computer>/main.lua):
--   1. pcall-guard loads mocks on PC, silently skips in-game.
--   2. In-game only: put this file's folder on package.path so sibling
--      modules (require("fuel")) resolve wherever the folder was uploaded.

-- luacheck: ignore (global print/shell/fs/turtle are CC-provided in-game)
local ok, shim = pcall(require, "mock_api.shim")
if ok and shim then shim.useMocks() end -- PC: fakes on; game: silent no-op

if type(shell) == "table" and shell.getRunningProgram and type(fs) == "table" then
    local dir = fs.getDir(shell.getRunningProgram())
    package.path = package.path .. ";" .. dir .. "/?.lua;" .. dir .. "/?/init.lua"
end

local fuel = require("fuel")

print("Fuel level: " .. turtle.getFuelLevel())
print("Fuel needed: " .. fuel.needed())
fuel.refuelAll()
print("Fuel after refuel: " .. turtle.getFuelLevel())
