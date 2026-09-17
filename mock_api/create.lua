-- mock_api/create.lua
-- Method tables for the Create mod's ComputerCraft peripherals.
-- Source: api-docs/create/peripherals/*.java (@LuaFunction + getType()).
-- GENERATED from api-docs by gen_peripherals.py � do not hand-edit.
-- Stateless stubs: every method exists, is callable, returns a sane
-- default. M._state / M.reset() are the seam for a stateful version.

local M = {}

---@type table<string, any> reserved for future stateful behaviour.
M._state = {}

---Clear any recorded state (no-op while stateless).
function M.reset()
    M._state = {}
end

---@type table<string, table<string, fun>> peripheral type -> methods.
M.types = {}

---@class create.CreateDisplayLink
M.types["Create_DisplayLink"] = {}
do
    local function impl_Create_DisplayLink_setCursorPos(x, y) end
    ---@param x integer
    ---@param y integer
    M.types["Create_DisplayLink"].setCursorPos = impl_Create_DisplayLink_setCursorPos
    local function impl_Create_DisplayLink_getCursorPos() return nil end
    ---@return any
    M.types["Create_DisplayLink"].getCursorPos = impl_Create_DisplayLink_getCursorPos
    local function impl_Create_DisplayLink_getSize() return nil end
    ---@return any
    M.types["Create_DisplayLink"].getSize = impl_Create_DisplayLink_getSize
    local function impl_Create_DisplayLink_isColor() return false end
    ---@return boolean
    M.types["Create_DisplayLink"].isColor = impl_Create_DisplayLink_isColor
    local function impl_Create_DisplayLink_isColour() return false end
    ---@return boolean
    M.types["Create_DisplayLink"].isColour = impl_Create_DisplayLink_isColour
    local function impl_Create_DisplayLink_write(text) end
    ---@param text string
    M.types["Create_DisplayLink"].write = impl_Create_DisplayLink_write
    local function impl_Create_DisplayLink_writeBytes(args) end
    ---@param args table
    M.types["Create_DisplayLink"].writeBytes = impl_Create_DisplayLink_writeBytes
    local function impl_Create_DisplayLink_clearLine() end
    M.types["Create_DisplayLink"].clearLine = impl_Create_DisplayLink_clearLine
    local function impl_Create_DisplayLink_clear() end
    M.types["Create_DisplayLink"].clear = impl_Create_DisplayLink_clear
    local function impl_Create_DisplayLink_update() end
    M.types["Create_DisplayLink"].update = impl_Create_DisplayLink_update
end

---@class create.CreateFrogport
M.types["Create_Frogport"] = {}
do
    local function impl_Create_Frogport_setAddress(address) end
    ---@param address string
    M.types["Create_Frogport"].setAddress = impl_Create_Frogport_setAddress
    local function impl_Create_Frogport_getAddress() return "" end
    ---@return string
    M.types["Create_Frogport"].getAddress = impl_Create_Frogport_getAddress
    local function impl_Create_Frogport_getConfiguration() return "" end
    ---@return string
    M.types["Create_Frogport"].getConfiguration = impl_Create_Frogport_getConfiguration
    local function impl_Create_Frogport_setConfiguration(config) return false end
    ---@param config string
    ---@return boolean
    M.types["Create_Frogport"].setConfiguration = impl_Create_Frogport_setConfiguration
end

---@class create.CreateNixieTube
M.types["Create_NixieTube"] = {}
do
    local function impl_Create_NixieTube_setText(arguments) end
    ---@param arguments table
    M.types["Create_NixieTube"].setText = impl_Create_NixieTube_setText
    local function impl_Create_NixieTube_setTextColour(colour) end
    ---@param colour string
    M.types["Create_NixieTube"].setTextColour = impl_Create_NixieTube_setTextColour
    local function impl_Create_NixieTube_setTextColor(color) end
    ---@param color string
    M.types["Create_NixieTube"].setTextColor = impl_Create_NixieTube_setTextColor
    local function impl_Create_NixieTube_setSignal(arguments) end
    ---@param arguments table
    M.types["Create_NixieTube"].setSignal = impl_Create_NixieTube_setSignal
end

---@class create.CreatePackager
M.types["Create_Packager"] = {}
do
    local function impl_Create_Packager_makePackage() return false end
    ---@return boolean
    M.types["Create_Packager"].makePackage = impl_Create_Packager_makePackage
    local function impl_Create_Packager_getAddress() return "" end
    ---@return string
    M.types["Create_Packager"].getAddress = impl_Create_Packager_getAddress
    local function impl_Create_Packager_setAddress(argument) end
    ---@param argument string|nil
    M.types["Create_Packager"].setAddress = impl_Create_Packager_setAddress
    local function impl_Create_Packager_getPackage() return {} end
    ---@return table
    M.types["Create_Packager"].getPackage = impl_Create_Packager_getPackage
end

---@class create.CreatePostbox
M.types["Create_Postbox"] = {}
do
    local function impl_Create_Postbox_setAddress(address) end
    ---@param address string
    M.types["Create_Postbox"].setAddress = impl_Create_Postbox_setAddress
    local function impl_Create_Postbox_getAddress() return "" end
    ---@return string
    M.types["Create_Postbox"].getAddress = impl_Create_Postbox_getAddress
    local function impl_Create_Postbox_getConfiguration() return "" end
    ---@return string
    M.types["Create_Postbox"].getConfiguration = impl_Create_Postbox_getConfiguration
    local function impl_Create_Postbox_setConfiguration(config) return false end
    ---@param config string
    ---@return boolean
    M.types["Create_Postbox"].setConfiguration = impl_Create_Postbox_setConfiguration
end

---@class create.CreateRedstoneRequester
M.types["Create_RedstoneRequester"] = {}
do
    local function impl_Create_RedstoneRequester_request() end
    M.types["Create_RedstoneRequester"].request = impl_Create_RedstoneRequester_request
    local function impl_Create_RedstoneRequester_setRequest(arguments) end
    ---@param arguments table
    M.types["Create_RedstoneRequester"].setRequest = impl_Create_RedstoneRequester_setRequest
    local function impl_Create_RedstoneRequester_setCraftingRequest(arguments) end
    ---@param arguments table
    M.types["Create_RedstoneRequester"].setCraftingRequest = impl_Create_RedstoneRequester_setCraftingRequest
    local function impl_Create_RedstoneRequester_getConfiguration() return "" end
    ---@return string
    M.types["Create_RedstoneRequester"].getConfiguration = impl_Create_RedstoneRequester_getConfiguration
    local function impl_Create_RedstoneRequester_setConfiguration(config) end
    ---@param config string
    M.types["Create_RedstoneRequester"].setConfiguration = impl_Create_RedstoneRequester_setConfiguration
    local function impl_Create_RedstoneRequester_setAddress(address) end
    ---@param address string
    M.types["Create_RedstoneRequester"].setAddress = impl_Create_RedstoneRequester_setAddress
    local function impl_Create_RedstoneRequester_getAddress() return "" end
    ---@return string
    M.types["Create_RedstoneRequester"].getAddress = impl_Create_RedstoneRequester_getAddress
end

---@class create.CreateRepackager
M.types["Create_Repackager"] = {}
do
    local function impl_Create_Repackager_makePackage() return false end
    ---@return boolean
    M.types["Create_Repackager"].makePackage = impl_Create_Repackager_makePackage
    local function impl_Create_Repackager_getAddress() return "" end
    ---@return string
    M.types["Create_Repackager"].getAddress = impl_Create_Repackager_getAddress
    local function impl_Create_Repackager_setAddress(argument) end
    ---@param argument string|nil
    M.types["Create_Repackager"].setAddress = impl_Create_Repackager_setAddress
    local function impl_Create_Repackager_getPackage() return {} end
    ---@return table
    M.types["Create_Repackager"].getPackage = impl_Create_Repackager_getPackage
end

---@class create.CreateSignal
M.types["Create_Signal"] = {}
do
    local function impl_Create_Signal_getState() return "" end
    ---@return string
    M.types["Create_Signal"].getState = impl_Create_Signal_getState
    local function impl_Create_Signal_isForcedRed() return false end
    ---@return boolean
    M.types["Create_Signal"].isForcedRed = impl_Create_Signal_isForcedRed
    local function impl_Create_Signal_setForcedRed(powered) end
    ---@param powered boolean
    M.types["Create_Signal"].setForcedRed = impl_Create_Signal_setForcedRed
    local function impl_Create_Signal_listBlockingTrainNames() return {} end
    ---@return table
    M.types["Create_Signal"].listBlockingTrainNames = impl_Create_Signal_listBlockingTrainNames
    local function impl_Create_Signal_getSignalType() return "" end
    ---@return string
    M.types["Create_Signal"].getSignalType = impl_Create_Signal_getSignalType
    local function impl_Create_Signal_cycleSignalType() end
    M.types["Create_Signal"].cycleSignalType = impl_Create_Signal_cycleSignalType
end

---@class create.CreateStation
M.types["Create_Station"] = {}
do
    local function impl_Create_Station_assemble() end
    M.types["Create_Station"].assemble = impl_Create_Station_assemble
    local function impl_Create_Station_disassemble() end
    M.types["Create_Station"].disassemble = impl_Create_Station_disassemble
    local function impl_Create_Station_setAssemblyMode(assemblyMode) end
    ---@param assemblyMode boolean
    M.types["Create_Station"].setAssemblyMode = impl_Create_Station_setAssemblyMode
    local function impl_Create_Station_isInAssemblyMode() return false end
    ---@return boolean
    M.types["Create_Station"].isInAssemblyMode = impl_Create_Station_isInAssemblyMode
    local function impl_Create_Station_getStationName() return "" end
    ---@return string
    M.types["Create_Station"].getStationName = impl_Create_Station_getStationName
    local function impl_Create_Station_setStationName(name) end
    ---@param name string
    M.types["Create_Station"].setStationName = impl_Create_Station_setStationName
    local function impl_Create_Station_isTrainPresent() return false end
    ---@return boolean
    M.types["Create_Station"].isTrainPresent = impl_Create_Station_isTrainPresent
    local function impl_Create_Station_isTrainImminent() return false end
    ---@return boolean
    M.types["Create_Station"].isTrainImminent = impl_Create_Station_isTrainImminent
    local function impl_Create_Station_isTrainEnroute() return false end
    ---@return boolean
    M.types["Create_Station"].isTrainEnroute = impl_Create_Station_isTrainEnroute
    local function impl_Create_Station_getTrainName() return "" end
    ---@return string
    M.types["Create_Station"].getTrainName = impl_Create_Station_getTrainName
    local function impl_Create_Station_setTrainName(name) end
    ---@param name string
    M.types["Create_Station"].setTrainName = impl_Create_Station_setTrainName
    local function impl_Create_Station_hasSchedule() return false end
    ---@return boolean
    M.types["Create_Station"].hasSchedule = impl_Create_Station_hasSchedule
    local function impl_Create_Station_getSchedule() return {} end
    ---@return table
    M.types["Create_Station"].getSchedule = impl_Create_Station_getSchedule
    local function impl_Create_Station_setSchedule(arguments) end
    ---@param arguments table
    M.types["Create_Station"].setSchedule = impl_Create_Station_setSchedule
    local function impl_Create_Station_canTrainReach(destinationFilter) return {} end
    ---@param destinationFilter string
    ---@return table
    M.types["Create_Station"].canTrainReach = impl_Create_Station_canTrainReach
    local function impl_Create_Station_distanceTo(destinationFilter) return {} end
    ---@param destinationFilter string
    ---@return table
    M.types["Create_Station"].distanceTo = impl_Create_Station_distanceTo
end

---@class create.CreateSticker
M.types["Create_Sticker"] = {}
do
    local function impl_Create_Sticker_isExtended() return false end
    ---@return boolean
    M.types["Create_Sticker"].isExtended = impl_Create_Sticker_isExtended
    local function impl_Create_Sticker_isAttachedToBlock() return false end
    ---@return boolean
    M.types["Create_Sticker"].isAttachedToBlock = impl_Create_Sticker_isAttachedToBlock
    local function impl_Create_Sticker_extend() return false end
    ---@return boolean
    M.types["Create_Sticker"].extend = impl_Create_Sticker_extend
    local function impl_Create_Sticker_retract() return false end
    ---@return boolean
    M.types["Create_Sticker"].retract = impl_Create_Sticker_retract
    local function impl_Create_Sticker_toggle() return false end
    ---@return boolean
    M.types["Create_Sticker"].toggle = impl_Create_Sticker_toggle
end

---@class create.CreateStockTicker
M.types["Create_StockTicker"] = {}
do
    local function impl_Create_StockTicker_stock(detailed) return {} end
    ---@param detailed boolean|nil
    ---@return table
    M.types["Create_StockTicker"].stock = impl_Create_StockTicker_stock
    local function impl_Create_StockTicker_getStockItemDetail(slot) return {} end
    ---@param slot integer
    ---@return table
    M.types["Create_StockTicker"].getStockItemDetail = impl_Create_StockTicker_getStockItemDetail
    local function impl_Create_StockTicker_requestFiltered(address, filters) return 0 end
    ---@param address string
    ---@param filters table
    ---@return integer
    M.types["Create_StockTicker"].requestFiltered = impl_Create_StockTicker_requestFiltered
    local function impl_Create_StockTicker_list() return {} end
    ---@return table
    M.types["Create_StockTicker"].list = impl_Create_StockTicker_list
    local function impl_Create_StockTicker_getItemDetail(slot) return {} end
    ---@param slot integer
    ---@return table
    M.types["Create_StockTicker"].getItemDetail = impl_Create_StockTicker_getItemDetail
end

---@class create.CreateTableClothShop
M.types["Create_TableClothShop"] = {}
do
    local function impl_Create_TableClothShop_isShop() return false end
    ---@return boolean
    M.types["Create_TableClothShop"].isShop = impl_Create_TableClothShop_isShop
    local function impl_Create_TableClothShop_getAddress() return "" end
    ---@return string
    M.types["Create_TableClothShop"].getAddress = impl_Create_TableClothShop_getAddress
    local function impl_Create_TableClothShop_setAddress(address) end
    ---@param address string
    M.types["Create_TableClothShop"].setAddress = impl_Create_TableClothShop_setAddress
    local function impl_Create_TableClothShop_setPriceTagItem(itemName) end
    ---@param itemName string|nil
    M.types["Create_TableClothShop"].setPriceTagItem = impl_Create_TableClothShop_setPriceTagItem
    local function impl_Create_TableClothShop_getPriceTagCount() return 0 end
    ---@return integer
    M.types["Create_TableClothShop"].getPriceTagCount = impl_Create_TableClothShop_getPriceTagCount
    local function impl_Create_TableClothShop_setPriceTagCount(argument) end
    ---@param argument number|nil
    M.types["Create_TableClothShop"].setPriceTagCount = impl_Create_TableClothShop_setPriceTagCount
    local function impl_Create_TableClothShop_setWares(arguments) end
    ---@param arguments table
    M.types["Create_TableClothShop"].setWares = impl_Create_TableClothShop_setWares
end

---@class create.CreateTrainObserver
M.types["Create_TrainObserver"] = {}
do
    local function impl_Create_TrainObserver_isTrainPassing() return false end
    ---@return boolean
    M.types["Create_TrainObserver"].isTrainPassing = impl_Create_TrainObserver_isTrainPassing
end

return M
