-- src/inventory/stocker.lua
-- Prints vault stock via Create Stock Ticker and requests one wooden plank (any type).
-- Runs unchanged in-game and under PC tests (shim bootstrap below).

-- luacheck: ignore (globals print/peripheral/textutils/shell/fs are CC-provided in-game)
local ok, shim = pcall(require, "mock_api.shim")
if ok and shim then shim.useMocks() end -- PC: fakes on; game: silent no-op

if type(shell) == "table" and shell.getRunningProgram and type(fs) == "table" then
    local dir = fs.getDir(shell.getRunningProgram())
    package.path = package.path .. ";" .. dir .. "/?.lua;" .. dir .. "/?/init.lua"
end

-- ===== config =====
-- Packager / Frogport address to deliver to. Edit this to your network's address.
-- The computer does NOT need to be next to the packager — only next to (or
-- wired to) the Stock Ticker. The ticker routes via the address string.
---@type string
local TARGET_ADDRESS = "PACKAGER_ADDRESS_HERE"

-- Any vanilla plank variant to try, in order. requestFiltered matches exact
-- `name`, so we try each name until one succeeds (ensures exactly 1 plank).
---@type string[]
local PLANK_VARIANTS = {
    "minecraft:oak_planks",
    "minecraft:spruce_planks",
    "minecraft:birch_planks",
    "minecraft:jungle_planks",
    "minecraft:acacia_planks",
    "minecraft:dark_oak_planks",
    "minecraft:mangrove_planks",
    "minecraft:cherry_planks",
    "minecraft:bamboo_planks",
    "minecraft:crimson_planks",
    "minecraft:warped_planks",
}

---@class StockTicker
---@field stock fun(detailed?: boolean): table<integer, table<string, any>>
---@field getStockItemDetail fun(slot: integer): table<string, any>
---@field requestFiltered fun(address: string, ...: table): integer
---@field list fun(): table<integer, table<string, any>>
---@field getItemDetail fun(slot: integer): table<string, any>

---Pretty-print a value via textutils when available.
---@param v any
---@return string
local function serialise(v)
    if type(textutils) == "table" and type(textutils.serialise) == "function" then
        return textutils.serialise(v)
    end
    if type(v) == "table" then
        local parts = {}
        for k, val in pairs(v) do
            parts[#parts + 1] = tostring(k) .. "=" .. tostring(val)
        end
        return "{" .. table.concat(parts, ", ") .. "}"
    end
    return tostring(v)
end

---Find an attached Create_StockTicker peripheral.
---@return StockTicker|nil ticker
---@return string|nil name
local function findTicker()
    -- fast path
    local found, name = peripheral.find("Create_StockTicker")
    if found then return found --[[@as StockTicker]], name end
    -- fallback: scan names for type match (handles mock attach edge cases)
    for _, n in ipairs(peripheral.getNames()) do
        if peripheral.getType(n) == "Create_StockTicker" then
            local w = peripheral.wrap(n)
            if w then return w --[[@as StockTicker]], n end
        end
    end
    return nil, nil
end

---Print detailed stock contents.
---@param ticker StockTicker
local function printStock(ticker)
    -- detailed=true gives tags/displayName/enchantments etc. per StockTickerPeripheral.java:30
    local stock = ticker.stock(true)
    local n = 0
    for _ in pairs(stock) do n = n + 1 end
    if n == 0 then
        print("Stock empty — is the ticker linked to vaults? (stock() returned 0 entries)")
        return
    end
    print("Stock (" .. tostring(n) .. " distinct stacks, detailed):")
    for i = 1, n do
        local entry = stock[i]
        if entry then
            -- entry has at minimum {name, count} plus detailed fields
            local name = entry.name or entry["name"] or "?"
            local count = entry.count or entry["count"] or 0
            print(string.format("  %d: %s x%d %s", i, tostring(name), count, serialise(entry)))
        end
    end
    -- show that getStockItemDetail also works for slot 1
    if n >= 1 then
        local ok2, detail = pcall(ticker.getStockItemDetail, 1)
        if ok2 and detail then
            print("getStockItemDetail(1) -> " .. serialise(detail))
        end
    end
end

---Try to request exactly one plank of any variant.
---@param ticker StockTicker
---@param address string
---@return integer sent
local function requestOnePlank(ticker, address)
    for i = 1, #PLANK_VARIANTS do
        local plank = PLANK_VARIANTS[i]
        local sent = ticker.requestFiltered(address, { name = plank, _requestCount = 1 })
        -- requestFiltered returns int totalItemsSent per StockTickerPeripheral.java:51
        if sent and sent > 0 then
            print(string.format("Requested 1x %s to '%s' -> sent %d", plank, address, sent))
            return sent
        end
    end
    print("No planks in stock (tried " .. table.concat(PLANK_VARIANTS, ", ") .. ")")
    return 0
end

-- ===== main =====
local ticker, tname = findTicker()
if not ticker then
    print("No Create_StockTicker found.")
    print("  attached: " .. serialise(peripheral.getNames()))
    print("  Place/wire a Stock Ticker next to the computer, or in tests:")
    print('    peripheral.attach("back", "Create_StockTicker")')
    return
end

print("Ticker: " .. tostring(tname) .. " (" .. tostring(peripheral.getType(tname)) .. ")")
printStock(ticker)

if TARGET_ADDRESS == "PACKAGER_ADDRESS_HERE" or TARGET_ADDRESS == "" then
    print("")
    print("TARGET_ADDRESS not set — edit src/inventory/stocker.lua top to your packager address.")
    print("Skipping request. Example: local TARGET_ADDRESS = \"my_packager\"")
    print("Or run after setting packager address via packager.setAddress().")
else
    print("")
    print("Requesting 1 plank (any type) to '" .. TARGET_ADDRESS .. "' ...")
    local sent = requestOnePlank(ticker, TARGET_ADDRESS)
    print("Done. sent=" .. tostring(sent))
end
