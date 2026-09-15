-- src/inventory/main.lua
-- Example for every CC:Tweaked inventory peripheral method.
-- Runs unchanged in-game and under PC tests (shim bootstrap below).
-- Chest / barrel / any `inventory` block exposes the same API:
--   size(), list(), getItemDetail(), getItemLimit(), pushItems(), pullItems()
-- See: https://tweaked.cc/reference/feature/inventories.html
--      api-docs/cctweaked/doc/reference/item_details.md

-- luacheck: ignore (global print/peripheral/textutils/shell/fs are CC-provided in-game)
local ok, shim = pcall(require, "mock_api.shim")
if ok and shim then shim.useMocks() end -- PC: fakes on; game: silent no-op

if type(shell) == "table" and shell.getRunningProgram and type(fs) == "table" then
    local dir = fs.getDir(shell.getRunningProgram())
    package.path = package.path .. ";" .. dir .. "/?.lua;" .. dir .. "/?/init.lua"
end

---@class InventoryItemBasic
---@field name string namespaced id, e.g. "minecraft:cobblestone"
---@field count integer items in stack
---@field nbt string|nil hash for NBT comparison

---@class InventoryItemDetail : InventoryItemBasic
---@field displayName string|nil server-side translated name
---@field maxCount integer|nil max stack size
---@field tags table<string, boolean>|nil item tags
---@field durability number|nil 0..1 fraction remaining
---@field damage integer|nil
---@field maxDamage integer|nil

---@class InventoryPeripheral
---@field size fun(): integer
---@field list fun(): table<integer, InventoryItemBasic>
---@field getItemDetail fun(slot: integer, detailed?: boolean): InventoryItemDetail|nil
---@field getItemLimit fun(slot: integer): integer
---@field pushItems fun(toName: string, fromSlot: integer, limit?: integer, toSlot?: integer): integer
---@field pullItems fun(fromName: string, fromSlot: integer, limit?: integer, toSlot?: integer): integer

---Pretty-print a value with textutils when available.
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

---Find all attached inventory names.
---@return string[]
local function findInventories()
    local names = peripheral.getNames()
    local out = {}
    for i = 1, #names do
        local n = names[i]
        local t = peripheral.getType(n)
        -- CC reports "inventory" generically; some setups use "minecraft:chest".
        -- Also accept any peripheral that has a `list` method (duck-typing).
        if t == "inventory" or t == "minecraft:chest" or t == "minecraft:barrel" then
            out[#out + 1] = n
        else
            local methods = peripheral.getMethods(n)
            if methods then
                for j = 1, #methods do
                    if methods[j] == "list" then
                        -- heuristic: has inventory shape, treat as inventory
                        -- avoid double-adding mod peripherals already handled
                        local isInv = false
                        for k = 1, #methods do
                            if methods[k] == "size" then isInv = true; break end
                        end
                        if isInv then out[#out + 1] = n end
                        break
                    end
                end
            end
        end
    end
    return out
end

---Print a single inventory using every method.
---@param name string attachment side/name, e.g. "left" or "minecraft:chest_0"
---@param chest InventoryPeripheral
local function demoOne(name, chest)
    print("--- Inventory: " .. name .. " (" .. tostring(peripheral.getType(name)) .. ") ---")

    -- 1) size() — total slots (27 single chest, 54 double chest, etc.)
    local size = chest.size()
    print("size() -> " .. tostring(size))

    -- 2) list() — sparse table slot -> {name, count, nbt?}
    local list = chest.list()
    print("list() -> " .. serialise(list))
    local count = 0
    for _ in pairs(list) do count = count + 1 end
    print("  non-empty slots: " .. count .. " / " .. size)
    if count == 0 then
        print("  (empty — put items in the chest to see more)")
    end

    -- 3) getItemDetail(slot [, detailed]) and 4) getItemLimit(slot)
    for slot = 1, size do
        local basic = chest.getItemDetail(slot) -- no detailed flag -> basic fields only
        local limit = chest.getItemLimit(slot)
        if basic ~= nil then
            print(string.format("  slot %d: %s x%d (limit %d) basic=%s", slot, basic.name, basic.count, limit, serialise(basic)))
            -- detailed view adds displayName, maxCount, tags, durability, enchantments, etc.
            -- see api-docs/cctweaked/doc/reference/item_details.md
            local detailed = chest.getItemDetail(slot, true)
            if detailed ~= nil then
                print("    detailed -> " .. serialise(detailed))
            end
        else
            -- show empty slot limit as well (always callable, never errors)
            if slot <= 4 or slot == size then
                print(string.format("  slot %d: <empty> (limit %d)", slot, limit))
            elseif slot == 5 then
                print("  ... (remaining empty slots omitted)")
            end
        end
    end

    -- 5) pushItems / 6) pullItems — moving items between two inventories.
    -- These return the number actually moved (0 if target full / no path).
    -- We demo the call shape but guard so we never error when only one chest exists.
    print("pushItems/pullItems demo (needs 2 inventories):")
    local all = findInventories()
    if #all < 2 then
        print("  need 2 inventories to demo transfer. Example call shape:")
        print('  chest.pushItems("right", 1, 64, 1) -> moves up to 64 from slot 1 to slot 1 on "right"')
        print('  chest.pullItems("right", 1, 1) -> pulls 1 from slot 1 on "right" into this chest')
        -- still show that the method is callable (stub returns 0)
        local moved = chest.pushItems(name, 1, 1, 1)
        print("  self-push test (chest.pushItems(name,1,1,1)) -> " .. tostring(moved) .. " (0 on empty/full)")
    else
        -- pick a different target
        local target = all[1] == name and all[2] or all[1]
        print("  target for transfer: " .. target)
        -- find a non-empty source slot
        local srcSlot = nil
        for s in pairs(list) do srcSlot = s; break end
        if srcSlot == nil then
            print("  source chest empty — push will move 0 (expected)")
            local moved = chest.pushItems(target, 1, 1)
            print("  pushItems(" .. target .. ", 1, 1) -> " .. tostring(moved))
        else
            local before = chest.getItemDetail(srcSlot)
            print(string.format("  pushing from %s slot %d (%s x%d) to %s", name, srcSlot, before and before.name or "?", before and before.count or 0, target))
            local moved = chest.pushItems(target, srcSlot, 64)
            print("  pushItems(" .. target .. ", " .. srcSlot .. ", 64) -> " .. tostring(moved))
            -- pull one back to demonstrate the opposite direction
            local targetChest = peripheral.wrap(target) --[[@as InventoryPeripheral]]
            if targetChest then
                local tList = targetChest.list()
                local tSlot = nil
                for s in pairs(tList) do tSlot = s; break end
                if tSlot ~= nil then
                    local pulled = chest.pullItems(target, tSlot, 1)
                    print("  pullItems(" .. target .. ", " .. tSlot .. ", 1) -> " .. tostring(pulled))
                end
            end
        end
    end
    print("")
end

---Minimal "print all stuff in chest next to computer" snippet (the common ask).
---@param side string side the chest is on, e.g. "top"
local function printChestSimple(side)
    print("== Simple example: peripheral.wrap(\"" .. side .. "\") ==")
    if not peripheral.isPresent(side) then
        print("  not present on " .. side .. " — wrap returns nil")
        print("  attached: " .. serialise(peripheral.getNames()))
        return
    end
    local chest = peripheral.wrap(side) --[[@as InventoryPeripheral]]
    if not chest or type(chest.list) ~= "function" then
        print("  present but not an inventory (type=" .. tostring(peripheral.getType(side)) .. ")")
        return
    end
    for slot, item in pairs(chest.list()) do
        print(string.format("  %d: %s x%d", slot, item.name, item.count))
    end
    -- the 3-line version users copy-paste:
    print("  -- copy-paste minimal --")
    print('  for s,i in pairs(peripheral.wrap("' .. side .. '").list()) do print(s,i.name,i.count) end')
end

-- ===== main =====
print("Inventories attached: " .. serialise(peripheral.getNames()))
for _, n in ipairs(peripheral.getNames()) do
    print("  " .. n .. " -> " .. tostring(peripheral.getType(n)))
end

-- 1) simplest answer to "how to print all stuff in a chest"
-- try each side; in-game the chest is on one side
for _, side in ipairs({ "left", "right", "top", "bottom", "front", "back" }) do
    if peripheral.isPresent(side) then
        printChestSimple(side)
        break
    end
end
-- also show generic find usage
local found, foundName = peripheral.find("inventory")
if found then
    print("peripheral.find(\"inventory\") -> " .. tostring(foundName))
else
    -- fallback: find any chest-like inventory via duck-typing
    local all = findInventories()
    if #all > 0 then
        print("findInventories() -> " .. serialise(all) .. " (no \"inventory\" type, using duck-typing)")
    else
        print("no inventories found — place a chest next to the computer, or in tests: peripheral.attach(\"left\", \"inventory\")")
    end
end
print("")

-- 2) full API demo for every attached inventory
local invNames = findInventories()
if #invNames == 0 then
    print("No inventories to demo fully. Attach one and re-run.")
else
    for i = 1, #invNames do
        local name = invNames[i]
        local chest = peripheral.wrap(name) --[[@as InventoryPeripheral]]
        if chest then demoOne(name, chest) end
    end
end
