-- mock_api/init.lua
-- Entry point for the mock API collection.
--
-- Usage from a test (run from the repo root):
--   package.path = package.path .. ";./?.lua"
--   local mock = require("mock_api.init")
--   local mods = mock.install() -- sets API tables as globals (fs, turtle, ...)
--   mock.reset()                -- clears stateful bits (settings, attachments)
--
-- peripheral wiring: vanilla + create + createavionics + advancedperipherals
-- type tables are registered with peripheral.registerType(); attach a named
-- peripheral in tests via peripheral.attach("top", "player_detector").
-- Collision rule: createavionics wins (see COLLISIONS.md).

local M = {}

---@type table<string, table>|nil modules from the last install(), for reset().
M._mods = nil

---@type string[] require paths with a reset() function, in dependency order.
local RESETTABLE = {
    "mock_api.globals", "mock_api.os", "mock_api.term", "mock_api.fs",
    "mock_api.io", "mock_api.http", "mock_api.rednet", "mock_api.gps",
    "mock_api.peripheral", "mock_api.turtle", "mock_api.disk",
    "mock_api.keys", "mock_api.colors", "mock_api.textutils",
    "mock_api.vector", "mock_api.window", "mock_api.paintutils",
    "mock_api.parallel", "mock_api.settings", "mock_api.help",
    "mock_api.commands", "mock_api.redstone", "mock_api.bit32",
    "mock_api.pocket", "mock_api.vanilla", "mock_api.create",
    "mock_api.createavionics", "mock_api.advancedperipherals",
    "mock_api.cc.expect", "mock_api.cc.strings", "mock_api.cc.completion",
    "mock_api.cc.pretty", "mock_api.cc.base64",
}

---Require every mock module and return them keyed by global name.
---@return table<string, table>
function M.load()
    ---@type table<string, table>
    local mods = {
        globals = require("mock_api.globals"),
        os = require("mock_api.os"),
        term = require("mock_api.term"),
        fs = require("mock_api.fs"),
        io = require("mock_api.io"),
        http = require("mock_api.http"),
        rednet = require("mock_api.rednet"),
        gps = require("mock_api.gps"),
        peripheral = require("mock_api.peripheral"),
        turtle = require("mock_api.turtle"),
        disk = require("mock_api.disk"),
        keys = require("mock_api.keys"),
        colors = require("mock_api.colors"),
        colours = require("mock_api.colours"),
        textutils = require("mock_api.textutils"),
        vector = require("mock_api.vector"),
        window = require("mock_api.window"),
        paintutils = require("mock_api.paintutils"),
        parallel = require("mock_api.parallel"),
        settings = require("mock_api.settings"),
        help = require("mock_api.help"),
        commands = require("mock_api.commands"),
        redstone = require("mock_api.redstone"),
        bit32 = require("mock_api.bit32"),
        pocket = require("mock_api.pocket"),
        vanilla = require("mock_api.vanilla"),
        create = require("mock_api.create"),
        createavionics = require("mock_api.createavionics"),
        advancedperipherals = require("mock_api.advancedperipherals"),
        ["cc.expect"] = require("mock_api.cc.expect"),
        ["cc.strings"] = require("mock_api.cc.strings"),
        ["cc.completion"] = require("mock_api.cc.completion"),
        ["cc.pretty"] = require("mock_api.cc.pretty"),
        ["cc.base64"] = require("mock_api.cc.base64"),
    }
    M._mods = mods
    return mods
end

---Register all peripheral type tables with the peripheral mock.
---@param mods table<string, table> result of M.load().
function M.registerPeripherals(mods)
    local peripheral = mods.peripheral
    for _, group in ipairs({ "vanilla", "create", "createavionics", "advancedperipherals" }) do
        local mod = mods[group]
        if mod ~= nil and type(mod.types) == "table" then
            for typeName, methods in pairs(mod.types) do
                peripheral.registerType(typeName, methods)
            end
        end
    end
end

---Install mocks as globals (like CC:Tweaked does) and register peripherals.
---@return table<string, table> loaded modules.
function M.install()
    local mods = M.load()
    for name, mod in pairs(mods) do
        if name ~= "globals" and name:sub(1, 3) ~= "cc." then
            _G[name] = mod
        end
    end
    -- cc.* modules go into a `cc` namespace table.
    _G.cc = {
        expect = mods["cc.expect"],
        strings = mods["cc.strings"],
        completion = mods["cc.completion"],
        pretty = mods["cc.pretty"],
        base64 = mods["cc.base64"],
    }
    M.registerPeripherals(mods)
    return mods
end

---Reset every mock module (settings values, attachments, definitions).
function M.reset()
    for _, path in ipairs(RESETTABLE) do
        local ok, mod = pcall(require, path)
        if ok and type(mod) == "table" and type(mod.reset) == "function" then
            mod.reset()
        end
    end
    -- colours aliases colors; keep them identical after reset.
    local ok, colors = pcall(require, "mock_api.colors")
    if ok then _G.colours = colors end
    -- Re-register peripheral types (reset() above wiped them).
    if M._mods ~= nil and M._mods.peripheral ~= nil then
        M.registerPeripherals(M._mods)
    end
end

return M
