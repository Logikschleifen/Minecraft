-- mock_api/advancedperipherals.lua
-- Method tables for Advanced Peripherals.
-- Source: api-docs/advancedperipherals/java/**. Automata cores expose their plugins' methods.
-- GENERATED from api-docs by gen_peripherals.py — do not hand-edit.
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

---@class ap.BlockReader
M.types["block_reader"] = {}
do
    local function impl_block_reader_getName() return "" end
    ---@return string
    M.types["block_reader"].getName = impl_block_reader_getName
    local function impl_block_reader_getBlockName() return "" end
    ---@return string
    M.types["block_reader"].getBlockName = impl_block_reader_getBlockName
    local function impl_block_reader_getBlockData() return nil end
    ---@return any
    M.types["block_reader"].getBlockData = impl_block_reader_getBlockData
    local function impl_block_reader_getBlockStates() return nil end
    ---@return any
    M.types["block_reader"].getBlockStates = impl_block_reader_getBlockStates
    local function impl_block_reader_isTileEntity() return false end
    ---@return boolean
    M.types["block_reader"].isTileEntity = impl_block_reader_isTileEntity
end

---@class ap.ChatBox
M.types["chat_box"] = {}
do
    local function impl_chat_box_getName() return "" end
    ---@return string
    M.types["chat_box"].getName = impl_chat_box_getName
    local function impl_chat_box_sendFormattedMessage(arguments) return {} end
    ---@param arguments table
    ---@return table
    M.types["chat_box"].sendFormattedMessage = impl_chat_box_sendFormattedMessage
    local function impl_chat_box_sendMessage(arguments) return {} end
    ---@param arguments table
    ---@return table
    M.types["chat_box"].sendMessage = impl_chat_box_sendMessage
    local function impl_chat_box_sendFormattedMessageToPlayer(arguments) return {} end
    ---@param arguments table
    ---@return table
    M.types["chat_box"].sendFormattedMessageToPlayer = impl_chat_box_sendFormattedMessageToPlayer
    local function impl_chat_box_sendFormattedToastToPlayer(arguments) return {} end
    ---@param arguments table
    ---@return table
    M.types["chat_box"].sendFormattedToastToPlayer = impl_chat_box_sendFormattedToastToPlayer
    local function impl_chat_box_sendMessageToPlayer(arguments) return {} end
    ---@param arguments table
    ---@return table
    M.types["chat_box"].sendMessageToPlayer = impl_chat_box_sendMessageToPlayer
    local function impl_chat_box_sendToastToPlayer(arguments) return {} end
    ---@param arguments table
    ---@return table
    M.types["chat_box"].sendToastToPlayer = impl_chat_box_sendToastToPlayer
end

---@class ap.Chunky
M.types["chunky"] = {}
do
    local function impl_chunky_getName() return "" end
    ---@return string
    M.types["chunky"].getName = impl_chunky_getName
end

---@class ap.ColonyIntegrator
M.types["colony_integrator"] = {}
do
    local function impl_colony_integrator_getName() return "" end
    ---@return string
    M.types["colony_integrator"].getName = impl_colony_integrator_getName
    local function impl_colony_integrator_isInColony() return false end
    ---@return boolean
    M.types["colony_integrator"].isInColony = impl_colony_integrator_isInColony
    local function impl_colony_integrator_isWithin(Map__, posTable) return false end
    ---@param Map__ table
    ---@param posTable table
    ---@return boolean
    M.types["colony_integrator"].isWithin = impl_colony_integrator_isWithin
    local function impl_colony_integrator_getCitizens() return nil end
    ---@return any
    M.types["colony_integrator"].getCitizens = impl_colony_integrator_getCitizens
    local function impl_colony_integrator_amountOfConstructionSites() return 0 end
    ---@return integer
    M.types["colony_integrator"].amountOfConstructionSites = impl_colony_integrator_amountOfConstructionSites
    local function impl_colony_integrator_getColonyID() return 0 end
    ---@return integer
    M.types["colony_integrator"].getColonyID = impl_colony_integrator_getColonyID
    local function impl_colony_integrator_getColonyName() return "" end
    ---@return string
    M.types["colony_integrator"].getColonyName = impl_colony_integrator_getColonyName
    local function impl_colony_integrator_getColonyStyle() return "" end
    ---@return string
    M.types["colony_integrator"].getColonyStyle = impl_colony_integrator_getColonyStyle
    local function impl_colony_integrator_isActive() return false end
    ---@return boolean
    M.types["colony_integrator"].isActive = impl_colony_integrator_isActive
    local function impl_colony_integrator_getHappiness() return 0 end
    ---@return number
    M.types["colony_integrator"].getHappiness = impl_colony_integrator_getHappiness
    local function impl_colony_integrator_getLocation() return nil end
    ---@return any
    M.types["colony_integrator"].getLocation = impl_colony_integrator_getLocation
    local function impl_colony_integrator_isUnderAttack() return false end
    ---@return boolean
    M.types["colony_integrator"].isUnderAttack = impl_colony_integrator_isUnderAttack
    local function impl_colony_integrator_isUnderRaid() return false end
    ---@return boolean
    M.types["colony_integrator"].isUnderRaid = impl_colony_integrator_isUnderRaid
    local function impl_colony_integrator_amountOfCitizens() return 0 end
    ---@return integer
    M.types["colony_integrator"].amountOfCitizens = impl_colony_integrator_amountOfCitizens
    local function impl_colony_integrator_maxOfCitizens() return 0 end
    ---@return integer
    M.types["colony_integrator"].maxOfCitizens = impl_colony_integrator_maxOfCitizens
    local function impl_colony_integrator_amountOfGraves() return 0 end
    ---@return integer
    M.types["colony_integrator"].amountOfGraves = impl_colony_integrator_amountOfGraves
    local function impl_colony_integrator_getVisitors() return nil end
    ---@return any
    M.types["colony_integrator"].getVisitors = impl_colony_integrator_getVisitors
    local function impl_colony_integrator_getBuildings() return nil end
    ---@return any
    M.types["colony_integrator"].getBuildings = impl_colony_integrator_getBuildings
    local function impl_colony_integrator_getWorkOrders() return nil end
    ---@return any
    M.types["colony_integrator"].getWorkOrders = impl_colony_integrator_getWorkOrders
    local function impl_colony_integrator_getResearch() return nil end
    ---@return any
    M.types["colony_integrator"].getResearch = impl_colony_integrator_getResearch
    local function impl_colony_integrator_getWorkOrderResources(id) return nil end
    ---@param id integer
    ---@return any
    M.types["colony_integrator"].getWorkOrderResources = impl_colony_integrator_getWorkOrderResources
    local function impl_colony_integrator_getBuilderResources(Map__, posTable) return nil end
    ---@param Map__ table
    ---@param posTable table
    ---@return any
    M.types["colony_integrator"].getBuilderResources = impl_colony_integrator_getBuilderResources
    local function impl_colony_integrator_getRequests() return nil end
    ---@return any
    M.types["colony_integrator"].getRequests = impl_colony_integrator_getRequests
end

---@class ap.Compass
M.types["compass"] = {}
do
    local function impl_compass_getName() return "" end
    ---@return string
    M.types["compass"].getName = impl_compass_getName
    local function impl_compass_getFacing() return "" end
    ---@return string
    M.types["compass"].getFacing = impl_compass_getFacing
end

-- end_automata: methods contributed by plugins AutomataWarpingPlugin.
---@class ap.EndAutomata
M.types["end_automata"] = {}
do
    local function impl_end_automata_savePoint(name) return {} end
    ---@param name string
    ---@return table
    M.types["end_automata"].savePoint = impl_end_automata_savePoint
    local function impl_end_automata_deletePoint(name) return {} end
    ---@param name string
    ---@return table
    M.types["end_automata"].deletePoint = impl_end_automata_deletePoint
    local function impl_end_automata_points() return {} end
    ---@return table
    M.types["end_automata"].points = impl_end_automata_points
    local function impl_end_automata_warpToPoint(name) return {} end
    ---@param name string
    ---@return table
    M.types["end_automata"].warpToPoint = impl_end_automata_warpToPoint
    local function impl_end_automata_estimateWarpCost(name) return {} end
    ---@param name string
    ---@return table
    M.types["end_automata"].estimateWarpCost = impl_end_automata_estimateWarpCost
    local function impl_end_automata_distanceToPoint(name) return {} end
    ---@param name string
    ---@return table
    M.types["end_automata"].distanceToPoint = impl_end_automata_distanceToPoint
end

-- end_automata: methods contributed by plugins AutomataWarpingPlugin.
---@class ap.EndAutomata
M.types["end_automata"] = {}
do
    local function impl_end_automata_savePoint(name) return {} end
    ---@param name string
    ---@return table
    M.types["end_automata"].savePoint = impl_end_automata_savePoint
    local function impl_end_automata_deletePoint(name) return {} end
    ---@param name string
    ---@return table
    M.types["end_automata"].deletePoint = impl_end_automata_deletePoint
    local function impl_end_automata_points() return {} end
    ---@return table
    M.types["end_automata"].points = impl_end_automata_points
    local function impl_end_automata_warpToPoint(name) return {} end
    ---@param name string
    ---@return table
    M.types["end_automata"].warpToPoint = impl_end_automata_warpToPoint
    local function impl_end_automata_estimateWarpCost(name) return {} end
    ---@param name string
    ---@return table
    M.types["end_automata"].estimateWarpCost = impl_end_automata_estimateWarpCost
    local function impl_end_automata_distanceToPoint(name) return {} end
    ---@param name string
    ---@return table
    M.types["end_automata"].distanceToPoint = impl_end_automata_distanceToPoint
end

---@class ap.EnergyDetector
M.types["energy_detector"] = {}
do
    local function impl_energy_detector_getName() return "" end
    ---@return string
    M.types["energy_detector"].getName = impl_energy_detector_getName
    local function impl_energy_detector_getTransferRateLimit() return 0 end
    ---@return integer
    M.types["energy_detector"].getTransferRateLimit = impl_energy_detector_getTransferRateLimit
    local function impl_energy_detector_setTransferRateLimit(transferRate) end
    ---@param transferRate integer
    M.types["energy_detector"].setTransferRateLimit = impl_energy_detector_setTransferRateLimit
    local function impl_energy_detector_getTransferRate() return 0 end
    ---@return integer
    M.types["energy_detector"].getTransferRate = impl_energy_detector_getTransferRate
end

---@class ap.EnvironmentDetector
M.types["environment_detector"] = {}
do
    local function impl_environment_detector_getName() return "" end
    ---@return string
    M.types["environment_detector"].getName = impl_environment_detector_getName
    local function impl_environment_detector_getBiome() return "" end
    ---@return string
    M.types["environment_detector"].getBiome = impl_environment_detector_getBiome
    local function impl_environment_detector_getSkyLightLevel() return 0 end
    ---@return integer
    M.types["environment_detector"].getSkyLightLevel = impl_environment_detector_getSkyLightLevel
    local function impl_environment_detector_getBlockLightLevel() return 0 end
    ---@return integer
    M.types["environment_detector"].getBlockLightLevel = impl_environment_detector_getBlockLightLevel
    local function impl_environment_detector_getDayLightLevel() return 0 end
    ---@return integer
    M.types["environment_detector"].getDayLightLevel = impl_environment_detector_getDayLightLevel
    local function impl_environment_detector_getTime() return 0 end
    ---@return integer
    M.types["environment_detector"].getTime = impl_environment_detector_getTime
    local function impl_environment_detector_isSlimeChunk() return false end
    ---@return boolean
    M.types["environment_detector"].isSlimeChunk = impl_environment_detector_isSlimeChunk
    local function impl_environment_detector_getDimension() return "" end
    ---@return string
    M.types["environment_detector"].getDimension = impl_environment_detector_getDimension
    local function impl_environment_detector_isDimension(dimension) return false end
    ---@param dimension string
    ---@return boolean
    M.types["environment_detector"].isDimension = impl_environment_detector_isDimension
    local function impl_environment_detector_listDimensions() return {} end
    ---@return table
    M.types["environment_detector"].listDimensions = impl_environment_detector_listDimensions
    local function impl_environment_detector_getMoonId() return 0 end
    ---@return integer
    M.types["environment_detector"].getMoonId = impl_environment_detector_getMoonId
    local function impl_environment_detector_isMoon(phase) return false end
    ---@param phase integer
    ---@return boolean
    M.types["environment_detector"].isMoon = impl_environment_detector_isMoon
    local function impl_environment_detector_getMoonName() return "" end
    ---@return string
    M.types["environment_detector"].getMoonName = impl_environment_detector_getMoonName
    local function impl_environment_detector_isRaining() return false end
    ---@return boolean
    M.types["environment_detector"].isRaining = impl_environment_detector_isRaining
    local function impl_environment_detector_isThunder() return false end
    ---@return boolean
    M.types["environment_detector"].isThunder = impl_environment_detector_isThunder
    local function impl_environment_detector_isSunny() return false end
    ---@return boolean
    M.types["environment_detector"].isSunny = impl_environment_detector_isSunny
    local function impl_environment_detector_scanEntities(access, arguments) return {} end
    ---@param access table
    ---@param arguments table
    ---@return table
    M.types["environment_detector"].scanEntities = impl_environment_detector_scanEntities
    local function impl_environment_detector_scanCost(radius) return {} end
    ---@param radius integer
    ---@return table
    M.types["environment_detector"].scanCost = impl_environment_detector_scanCost
    local function impl_environment_detector_canSleepHere() return {} end
    ---@return table
    M.types["environment_detector"].canSleepHere = impl_environment_detector_canSleepHere
    local function impl_environment_detector_canSleepPlayer(playername) return {} end
    ---@param playername string
    ---@return table
    M.types["environment_detector"].canSleepPlayer = impl_environment_detector_canSleepPlayer
end

---@class ap.GeoScanner
M.types["geo_scanner"] = {}
do
    local function impl_geo_scanner_getName() return "" end
    ---@return string
    M.types["geo_scanner"].getName = impl_geo_scanner_getName
    local function impl_geo_scanner_cost(radius) return {} end
    ---@param radius integer
    ---@return table
    M.types["geo_scanner"].cost = impl_geo_scanner_cost
    local function impl_geo_scanner_chunkAnalyze() return {} end
    ---@return table
    M.types["geo_scanner"].chunkAnalyze = impl_geo_scanner_chunkAnalyze
    local function impl_geo_scanner_scan(arguments) return {} end
    ---@param arguments table
    ---@return table
    M.types["geo_scanner"].scan = impl_geo_scanner_scan
end

-- husbandry_automata: methods contributed by plugins AutomataEntityTransferPlugin, AutomataEntityHandPlugin.
---@class ap.HusbandryAutomata
M.types["husbandry_automata"] = {}
do
    local function impl_husbandry_automata_captureAnimal(arguments) return {} end
    ---@param arguments table
    ---@return table
    M.types["husbandry_automata"].captureAnimal = impl_husbandry_automata_captureAnimal
    local function impl_husbandry_automata_releaseAnimal() return {} end
    ---@return table
    M.types["husbandry_automata"].releaseAnimal = impl_husbandry_automata_releaseAnimal
    local function impl_husbandry_automata_getCapturedAnimal() return {} end
    ---@return table
    M.types["husbandry_automata"].getCapturedAnimal = impl_husbandry_automata_getCapturedAnimal
    local function impl_husbandry_automata_useOnAnimal(arguments) return {} end
    ---@param arguments table
    ---@return table
    M.types["husbandry_automata"].useOnAnimal = impl_husbandry_automata_useOnAnimal
    local function impl_husbandry_automata_inspectAnimal(arguments) return {} end
    ---@param arguments table
    ---@return table
    M.types["husbandry_automata"].inspectAnimal = impl_husbandry_automata_inspectAnimal
    local function impl_husbandry_automata_searchAnimals() return {} end
    ---@return table
    M.types["husbandry_automata"].searchAnimals = impl_husbandry_automata_searchAnimals
end

-- husbandry_automata: methods contributed by plugins AutomataEntityTransferPlugin, AutomataEntityHandPlugin.
---@class ap.HusbandryAutomata
M.types["husbandry_automata"] = {}
do
    local function impl_husbandry_automata_captureAnimal(arguments) return {} end
    ---@param arguments table
    ---@return table
    M.types["husbandry_automata"].captureAnimal = impl_husbandry_automata_captureAnimal
    local function impl_husbandry_automata_releaseAnimal() return {} end
    ---@return table
    M.types["husbandry_automata"].releaseAnimal = impl_husbandry_automata_releaseAnimal
    local function impl_husbandry_automata_getCapturedAnimal() return {} end
    ---@return table
    M.types["husbandry_automata"].getCapturedAnimal = impl_husbandry_automata_getCapturedAnimal
    local function impl_husbandry_automata_useOnAnimal(arguments) return {} end
    ---@param arguments table
    ---@return table
    M.types["husbandry_automata"].useOnAnimal = impl_husbandry_automata_useOnAnimal
    local function impl_husbandry_automata_inspectAnimal(arguments) return {} end
    ---@param arguments table
    ---@return table
    M.types["husbandry_automata"].inspectAnimal = impl_husbandry_automata_inspectAnimal
    local function impl_husbandry_automata_searchAnimals() return {} end
    ---@return table
    M.types["husbandry_automata"].searchAnimals = impl_husbandry_automata_searchAnimals
end

---@class ap.InventoryManager
M.types["inventory_manager"] = {}
do
    local function impl_inventory_manager_getName() return "" end
    ---@return string
    M.types["inventory_manager"].getName = impl_inventory_manager_getName
    local function impl_inventory_manager_getOwner() return "" end
    ---@return string
    M.types["inventory_manager"].getOwner = impl_inventory_manager_getOwner
    local function impl_inventory_manager_addItemToPlayer(invDirection, Map__, item) return {} end
    ---@param invDirection string
    ---@param Map__ table
    ---@param item table
    ---@return table
    M.types["inventory_manager"].addItemToPlayer = impl_inventory_manager_addItemToPlayer
    local function impl_inventory_manager_removeItemFromPlayer(invDirection, Map__, item) return {} end
    ---@param invDirection string
    ---@param Map__ table
    ---@param item table
    ---@return table
    M.types["inventory_manager"].removeItemFromPlayer = impl_inventory_manager_removeItemFromPlayer
    local function impl_inventory_manager_getItems() return {} end
    ---@return table
    M.types["inventory_manager"].getItems = impl_inventory_manager_getItems
    M.types["inventory_manager"].list = impl_inventory_manager_getItems
    M.types["inventory_manager"].getItems = impl_inventory_manager_getItems
    local function impl_inventory_manager_getItemsChest(target) return {} end
    ---@param target string
    ---@return table
    M.types["inventory_manager"].getItemsChest = impl_inventory_manager_getItemsChest
    M.types["inventory_manager"].listChest = impl_inventory_manager_getItemsChest
    M.types["inventory_manager"].getItemsChest = impl_inventory_manager_getItemsChest
    local function impl_inventory_manager_getArmor() return {} end
    ---@return table
    M.types["inventory_manager"].getArmor = impl_inventory_manager_getArmor
    local function impl_inventory_manager_isPlayerEquipped() return false end
    ---@return boolean
    M.types["inventory_manager"].isPlayerEquipped = impl_inventory_manager_isPlayerEquipped
    local function impl_inventory_manager_isWearing(index) return false end
    ---@param index integer
    ---@return boolean
    M.types["inventory_manager"].isWearing = impl_inventory_manager_isWearing
    local function impl_inventory_manager_getEmptySpace() return 0 end
    ---@return integer
    M.types["inventory_manager"].getEmptySpace = impl_inventory_manager_getEmptySpace
    local function impl_inventory_manager_isSpaceAvailable() return false end
    ---@return boolean
    M.types["inventory_manager"].isSpaceAvailable = impl_inventory_manager_isSpaceAvailable
    local function impl_inventory_manager_getFreeSlot() return 0 end
    ---@return integer
    M.types["inventory_manager"].getFreeSlot = impl_inventory_manager_getFreeSlot
end

---@class ap.MeBridge
M.types["me_bridge"] = {}
do
    local function impl_me_bridge_getName() return "" end
    ---@return string
    M.types["me_bridge"].getName = impl_me_bridge_getName
    local function impl_me_bridge_isConnected() return false end
    ---@return boolean
    M.types["me_bridge"].isConnected = impl_me_bridge_isConnected
    local function impl_me_bridge_isOnline() return {} end
    ---@return table
    M.types["me_bridge"].isOnline = impl_me_bridge_isOnline
    local function impl_me_bridge_getItem(arguments) return {} end
    ---@param arguments table
    ---@return table
    M.types["me_bridge"].getItem = impl_me_bridge_getItem
    local function impl_me_bridge_getFluid(arguments) return {} end
    ---@param arguments table
    ---@return table
    M.types["me_bridge"].getFluid = impl_me_bridge_getFluid
    local function impl_me_bridge_getChemical(arguments) return {} end
    ---@param arguments table
    ---@return table
    M.types["me_bridge"].getChemical = impl_me_bridge_getChemical
    local function impl_me_bridge_getItems(arguments) return {} end
    ---@param arguments table
    ---@return table
    M.types["me_bridge"].getItems = impl_me_bridge_getItems
    local function impl_me_bridge_getFluids(arguments) return {} end
    ---@param arguments table
    ---@return table
    M.types["me_bridge"].getFluids = impl_me_bridge_getFluids
    local function impl_me_bridge_getChemicals(arguments) return {} end
    ---@param arguments table
    ---@return table
    M.types["me_bridge"].getChemicals = impl_me_bridge_getChemicals
    local function impl_me_bridge_getCraftableItems(arguments) return {} end
    ---@param arguments table
    ---@return table
    M.types["me_bridge"].getCraftableItems = impl_me_bridge_getCraftableItems
    local function impl_me_bridge_getCraftableFluids(arguments) return {} end
    ---@param arguments table
    ---@return table
    M.types["me_bridge"].getCraftableFluids = impl_me_bridge_getCraftableFluids
    local function impl_me_bridge_getCells() return {} end
    ---@return table
    M.types["me_bridge"].getCells = impl_me_bridge_getCells
    local function impl_me_bridge_getDrives() return {} end
    ---@return table
    M.types["me_bridge"].getDrives = impl_me_bridge_getDrives
    local function impl_me_bridge_importItem(computer, arguments) return {} end
    ---@param computer table
    ---@param arguments table
    ---@return table
    M.types["me_bridge"].importItem = impl_me_bridge_importItem
    local function impl_me_bridge_exportItem(computer, arguments) return {} end
    ---@param computer table
    ---@param arguments table
    ---@return table
    M.types["me_bridge"].exportItem = impl_me_bridge_exportItem
    local function impl_me_bridge_importFluid(computer, arguments) return {} end
    ---@param computer table
    ---@param arguments table
    ---@return table
    M.types["me_bridge"].importFluid = impl_me_bridge_importFluid
    local function impl_me_bridge_exportFluid(computer, arguments) return {} end
    ---@param computer table
    ---@param arguments table
    ---@return table
    M.types["me_bridge"].exportFluid = impl_me_bridge_exportFluid
    local function impl_me_bridge_importChemical(computer, arguments) return {} end
    ---@param computer table
    ---@param arguments table
    ---@return table
    M.types["me_bridge"].importChemical = impl_me_bridge_importChemical
    local function impl_me_bridge_exportChemical(computer, arguments) return {} end
    ---@param computer table
    ---@param arguments table
    ---@return table
    M.types["me_bridge"].exportChemical = impl_me_bridge_exportChemical
    local function impl_me_bridge_getPatterns(arguments) return {} end
    ---@param arguments table
    ---@return table
    M.types["me_bridge"].getPatterns = impl_me_bridge_getPatterns
    local function impl_me_bridge_getStoredEnergy() return {} end
    ---@return table
    M.types["me_bridge"].getStoredEnergy = impl_me_bridge_getStoredEnergy
    local function impl_me_bridge_getEnergyCapacity() return {} end
    ---@return table
    M.types["me_bridge"].getEnergyCapacity = impl_me_bridge_getEnergyCapacity
    local function impl_me_bridge_getEnergyUsage() return {} end
    ---@return table
    M.types["me_bridge"].getEnergyUsage = impl_me_bridge_getEnergyUsage
    local function impl_me_bridge_getAverageEnergyInput() return {} end
    ---@return table
    M.types["me_bridge"].getAverageEnergyInput = impl_me_bridge_getAverageEnergyInput
    local function impl_me_bridge_getTotalExternalItemStorage() return {} end
    ---@return table
    M.types["me_bridge"].getTotalExternalItemStorage = impl_me_bridge_getTotalExternalItemStorage
    local function impl_me_bridge_getTotalExternalFluidStorage() return {} end
    ---@return table
    M.types["me_bridge"].getTotalExternalFluidStorage = impl_me_bridge_getTotalExternalFluidStorage
    local function impl_me_bridge_getTotalExternalChemicalStorage() return {} end
    ---@return table
    M.types["me_bridge"].getTotalExternalChemicalStorage = impl_me_bridge_getTotalExternalChemicalStorage
    local function impl_me_bridge_getTotalItemStorage() return {} end
    ---@return table
    M.types["me_bridge"].getTotalItemStorage = impl_me_bridge_getTotalItemStorage
    local function impl_me_bridge_getTotalFluidStorage() return {} end
    ---@return table
    M.types["me_bridge"].getTotalFluidStorage = impl_me_bridge_getTotalFluidStorage
    local function impl_me_bridge_getTotalChemicalStorage() return {} end
    ---@return table
    M.types["me_bridge"].getTotalChemicalStorage = impl_me_bridge_getTotalChemicalStorage
    local function impl_me_bridge_getUsedExternalItemStorage() return {} end
    ---@return table
    M.types["me_bridge"].getUsedExternalItemStorage = impl_me_bridge_getUsedExternalItemStorage
    local function impl_me_bridge_getUsedExternalFluidStorage() return {} end
    ---@return table
    M.types["me_bridge"].getUsedExternalFluidStorage = impl_me_bridge_getUsedExternalFluidStorage
    local function impl_me_bridge_getUsedExternalChemicalStorage() return {} end
    ---@return table
    M.types["me_bridge"].getUsedExternalChemicalStorage = impl_me_bridge_getUsedExternalChemicalStorage
    local function impl_me_bridge_getUsedItemStorage() return {} end
    ---@return table
    M.types["me_bridge"].getUsedItemStorage = impl_me_bridge_getUsedItemStorage
    local function impl_me_bridge_getUsedFluidStorage() return {} end
    ---@return table
    M.types["me_bridge"].getUsedFluidStorage = impl_me_bridge_getUsedFluidStorage
    local function impl_me_bridge_getUsedChemicalStorage() return {} end
    ---@return table
    M.types["me_bridge"].getUsedChemicalStorage = impl_me_bridge_getUsedChemicalStorage
    local function impl_me_bridge_getAvailableExternalItemStorage() return {} end
    ---@return table
    M.types["me_bridge"].getAvailableExternalItemStorage = impl_me_bridge_getAvailableExternalItemStorage
    local function impl_me_bridge_getAvailableExternalFluidStorage() return {} end
    ---@return table
    M.types["me_bridge"].getAvailableExternalFluidStorage = impl_me_bridge_getAvailableExternalFluidStorage
    local function impl_me_bridge_getAvailableExternalChemicalStorage() return {} end
    ---@return table
    M.types["me_bridge"].getAvailableExternalChemicalStorage = impl_me_bridge_getAvailableExternalChemicalStorage
    local function impl_me_bridge_getAvailableItemStorage() return {} end
    ---@return table
    M.types["me_bridge"].getAvailableItemStorage = impl_me_bridge_getAvailableItemStorage
    local function impl_me_bridge_getAvailableFluidStorage() return {} end
    ---@return table
    M.types["me_bridge"].getAvailableFluidStorage = impl_me_bridge_getAvailableFluidStorage
    local function impl_me_bridge_getAvailableChemicalStorage() return {} end
    ---@return table
    M.types["me_bridge"].getAvailableChemicalStorage = impl_me_bridge_getAvailableChemicalStorage
    local function impl_me_bridge_craftItem(computer, arguments) return {} end
    ---@param computer table
    ---@param arguments table
    ---@return table
    M.types["me_bridge"].craftItem = impl_me_bridge_craftItem
    local function impl_me_bridge_craftFluid(computer, arguments) return {} end
    ---@param computer table
    ---@param arguments table
    ---@return table
    M.types["me_bridge"].craftFluid = impl_me_bridge_craftFluid
    local function impl_me_bridge_getCraftingTasks() return {} end
    ---@return table
    M.types["me_bridge"].getCraftingTasks = impl_me_bridge_getCraftingTasks
    local function impl_me_bridge_getCraftingTask(id) return {} end
    ---@param id integer
    ---@return table
    M.types["me_bridge"].getCraftingTask = impl_me_bridge_getCraftingTask
    local function impl_me_bridge_cancelCraftingTasks(arguments) return {} end
    ---@param arguments table
    ---@return table
    M.types["me_bridge"].cancelCraftingTasks = impl_me_bridge_cancelCraftingTasks
    local function impl_me_bridge_isCraftable(arguments) return {} end
    ---@param arguments table
    ---@return table
    M.types["me_bridge"].isCraftable = impl_me_bridge_isCraftable
    local function impl_me_bridge_isCrafting(arguments) return {} end
    ---@param arguments table
    ---@return table
    M.types["me_bridge"].isCrafting = impl_me_bridge_isCrafting
    local function impl_me_bridge_getCraftingCPUs() return {} end
    ---@return table
    M.types["me_bridge"].getCraftingCPUs = impl_me_bridge_getCraftingCPUs
end

---@class ap.NbtStorage
M.types["nbt_storage"] = {}
do
    local function impl_nbt_storage_getName() return "" end
    ---@return string
    M.types["nbt_storage"].getName = impl_nbt_storage_getName
    local function impl_nbt_storage_read() return {} end
    ---@return table
    M.types["nbt_storage"].read = impl_nbt_storage_read
    local function impl_nbt_storage_writeJson(jsonData) return {} end
    ---@param jsonData string
    ---@return table
    M.types["nbt_storage"].writeJson = impl_nbt_storage_writeJson
    local function impl_nbt_storage_writeTable(Map__, data) return {} end
    ---@param Map__ table
    ---@param data table
    ---@return table
    M.types["nbt_storage"].writeTable = impl_nbt_storage_writeTable
end

-- overpowered_end_automata: methods contributed by plugins AutomataWarpingPlugin.
---@class ap.OverpoweredEndAutomata
M.types["overpowered_end_automata"] = {}
do
    local function impl_overpowered_end_automata_savePoint(name) return {} end
    ---@param name string
    ---@return table
    M.types["overpowered_end_automata"].savePoint = impl_overpowered_end_automata_savePoint
    local function impl_overpowered_end_automata_deletePoint(name) return {} end
    ---@param name string
    ---@return table
    M.types["overpowered_end_automata"].deletePoint = impl_overpowered_end_automata_deletePoint
    local function impl_overpowered_end_automata_points() return {} end
    ---@return table
    M.types["overpowered_end_automata"].points = impl_overpowered_end_automata_points
    local function impl_overpowered_end_automata_warpToPoint(name) return {} end
    ---@param name string
    ---@return table
    M.types["overpowered_end_automata"].warpToPoint = impl_overpowered_end_automata_warpToPoint
    local function impl_overpowered_end_automata_estimateWarpCost(name) return {} end
    ---@param name string
    ---@return table
    M.types["overpowered_end_automata"].estimateWarpCost = impl_overpowered_end_automata_estimateWarpCost
    local function impl_overpowered_end_automata_distanceToPoint(name) return {} end
    ---@param name string
    ---@return table
    M.types["overpowered_end_automata"].distanceToPoint = impl_overpowered_end_automata_distanceToPoint
end

-- overpowered_end_automata: methods contributed by plugins AutomataWarpingPlugin.
---@class ap.OverpoweredEndAutomata
M.types["overpowered_end_automata"] = {}
do
    local function impl_overpowered_end_automata_savePoint(name) return {} end
    ---@param name string
    ---@return table
    M.types["overpowered_end_automata"].savePoint = impl_overpowered_end_automata_savePoint
    local function impl_overpowered_end_automata_deletePoint(name) return {} end
    ---@param name string
    ---@return table
    M.types["overpowered_end_automata"].deletePoint = impl_overpowered_end_automata_deletePoint
    local function impl_overpowered_end_automata_points() return {} end
    ---@return table
    M.types["overpowered_end_automata"].points = impl_overpowered_end_automata_points
    local function impl_overpowered_end_automata_warpToPoint(name) return {} end
    ---@param name string
    ---@return table
    M.types["overpowered_end_automata"].warpToPoint = impl_overpowered_end_automata_warpToPoint
    local function impl_overpowered_end_automata_estimateWarpCost(name) return {} end
    ---@param name string
    ---@return table
    M.types["overpowered_end_automata"].estimateWarpCost = impl_overpowered_end_automata_estimateWarpCost
    local function impl_overpowered_end_automata_distanceToPoint(name) return {} end
    ---@param name string
    ---@return table
    M.types["overpowered_end_automata"].distanceToPoint = impl_overpowered_end_automata_distanceToPoint
end

-- overpowered_husbandry_automata: methods contributed by plugins AutomataEntityTransferPlugin, AutomataEntityHandPlugin.
---@class ap.OverpoweredHusbandryAutomata
M.types["overpowered_husbandry_automata"] = {}
do
    local function impl_overpowered_husbandry_automata_captureAnimal(arguments) return {} end
    ---@param arguments table
    ---@return table
    M.types["overpowered_husbandry_automata"].captureAnimal = impl_overpowered_husbandry_automata_captureAnimal
    local function impl_overpowered_husbandry_automata_releaseAnimal() return {} end
    ---@return table
    M.types["overpowered_husbandry_automata"].releaseAnimal = impl_overpowered_husbandry_automata_releaseAnimal
    local function impl_overpowered_husbandry_automata_getCapturedAnimal() return {} end
    ---@return table
    M.types["overpowered_husbandry_automata"].getCapturedAnimal = impl_overpowered_husbandry_automata_getCapturedAnimal
    local function impl_overpowered_husbandry_automata_useOnAnimal(arguments) return {} end
    ---@param arguments table
    ---@return table
    M.types["overpowered_husbandry_automata"].useOnAnimal = impl_overpowered_husbandry_automata_useOnAnimal
    local function impl_overpowered_husbandry_automata_inspectAnimal(arguments) return {} end
    ---@param arguments table
    ---@return table
    M.types["overpowered_husbandry_automata"].inspectAnimal = impl_overpowered_husbandry_automata_inspectAnimal
    local function impl_overpowered_husbandry_automata_searchAnimals() return {} end
    ---@return table
    M.types["overpowered_husbandry_automata"].searchAnimals = impl_overpowered_husbandry_automata_searchAnimals
end

-- overpowered_husbandry_automata: methods contributed by plugins AutomataEntityTransferPlugin, AutomataEntityHandPlugin.
---@class ap.OverpoweredHusbandryAutomata
M.types["overpowered_husbandry_automata"] = {}
do
    local function impl_overpowered_husbandry_automata_captureAnimal(arguments) return {} end
    ---@param arguments table
    ---@return table
    M.types["overpowered_husbandry_automata"].captureAnimal = impl_overpowered_husbandry_automata_captureAnimal
    local function impl_overpowered_husbandry_automata_releaseAnimal() return {} end
    ---@return table
    M.types["overpowered_husbandry_automata"].releaseAnimal = impl_overpowered_husbandry_automata_releaseAnimal
    local function impl_overpowered_husbandry_automata_getCapturedAnimal() return {} end
    ---@return table
    M.types["overpowered_husbandry_automata"].getCapturedAnimal = impl_overpowered_husbandry_automata_getCapturedAnimal
    local function impl_overpowered_husbandry_automata_useOnAnimal(arguments) return {} end
    ---@param arguments table
    ---@return table
    M.types["overpowered_husbandry_automata"].useOnAnimal = impl_overpowered_husbandry_automata_useOnAnimal
    local function impl_overpowered_husbandry_automata_inspectAnimal(arguments) return {} end
    ---@param arguments table
    ---@return table
    M.types["overpowered_husbandry_automata"].inspectAnimal = impl_overpowered_husbandry_automata_inspectAnimal
    local function impl_overpowered_husbandry_automata_searchAnimals() return {} end
    ---@return table
    M.types["overpowered_husbandry_automata"].searchAnimals = impl_overpowered_husbandry_automata_searchAnimals
end

-- overpowered_weak_automata: methods contributed by plugins AutomataItemSuckPlugin, AutomataLookPlugin, AutomataBlockHandPlugin, AutomataSoulFeedingPlugin, AutomataChargingPlugin.
---@class ap.OverpoweredWeakAutomata
M.types["overpowered_weak_automata"] = {}
do
    local function impl_overpowered_weak_automata_scanItems() return {} end
    ---@return table
    M.types["overpowered_weak_automata"].scanItems = impl_overpowered_weak_automata_scanItems
    local function impl_overpowered_weak_automata_collectSpecificItem(arguments) return {} end
    ---@param arguments table
    ---@return table
    M.types["overpowered_weak_automata"].collectSpecificItem = impl_overpowered_weak_automata_collectSpecificItem
    local function impl_overpowered_weak_automata_collectItems(arguments) return {} end
    ---@param arguments table
    ---@return table
    M.types["overpowered_weak_automata"].collectItems = impl_overpowered_weak_automata_collectItems
    local function impl_overpowered_weak_automata_lookAtBlock(arguments) return {} end
    ---@param arguments table
    ---@return table
    M.types["overpowered_weak_automata"].lookAtBlock = impl_overpowered_weak_automata_lookAtBlock
    local function impl_overpowered_weak_automata_lookAtEntity(arguments) return {} end
    ---@param arguments table
    ---@return table
    M.types["overpowered_weak_automata"].lookAtEntity = impl_overpowered_weak_automata_lookAtEntity
    local function impl_overpowered_weak_automata_digBlock(arguments) return {} end
    ---@param arguments table
    ---@return table
    M.types["overpowered_weak_automata"].digBlock = impl_overpowered_weak_automata_digBlock
    local function impl_overpowered_weak_automata_useOnBlock(arguments) return {} end
    ---@param arguments table
    ---@return table
    M.types["overpowered_weak_automata"].useOnBlock = impl_overpowered_weak_automata_useOnBlock
    local function impl_overpowered_weak_automata_placeBlock(arguments) return {} end
    ---@param arguments table
    ---@return table
    M.types["overpowered_weak_automata"].placeBlock = impl_overpowered_weak_automata_placeBlock
    local function impl_overpowered_weak_automata_feedSoul() return {} end
    ---@return table
    M.types["overpowered_weak_automata"].feedSoul = impl_overpowered_weak_automata_feedSoul
    local function impl_overpowered_weak_automata_chargeTurtle(arguments) return {} end
    ---@param arguments table
    ---@return table
    M.types["overpowered_weak_automata"].chargeTurtle = impl_overpowered_weak_automata_chargeTurtle
end

-- overpowered_weak_automata: methods contributed by plugins AutomataItemSuckPlugin, AutomataLookPlugin, AutomataBlockHandPlugin, AutomataSoulFeedingPlugin, AutomataChargingPlugin.
---@class ap.OverpoweredWeakAutomata
M.types["overpowered_weak_automata"] = {}
do
    local function impl_overpowered_weak_automata_scanItems() return {} end
    ---@return table
    M.types["overpowered_weak_automata"].scanItems = impl_overpowered_weak_automata_scanItems
    local function impl_overpowered_weak_automata_collectSpecificItem(arguments) return {} end
    ---@param arguments table
    ---@return table
    M.types["overpowered_weak_automata"].collectSpecificItem = impl_overpowered_weak_automata_collectSpecificItem
    local function impl_overpowered_weak_automata_collectItems(arguments) return {} end
    ---@param arguments table
    ---@return table
    M.types["overpowered_weak_automata"].collectItems = impl_overpowered_weak_automata_collectItems
    local function impl_overpowered_weak_automata_lookAtBlock(arguments) return {} end
    ---@param arguments table
    ---@return table
    M.types["overpowered_weak_automata"].lookAtBlock = impl_overpowered_weak_automata_lookAtBlock
    local function impl_overpowered_weak_automata_lookAtEntity(arguments) return {} end
    ---@param arguments table
    ---@return table
    M.types["overpowered_weak_automata"].lookAtEntity = impl_overpowered_weak_automata_lookAtEntity
    local function impl_overpowered_weak_automata_digBlock(arguments) return {} end
    ---@param arguments table
    ---@return table
    M.types["overpowered_weak_automata"].digBlock = impl_overpowered_weak_automata_digBlock
    local function impl_overpowered_weak_automata_useOnBlock(arguments) return {} end
    ---@param arguments table
    ---@return table
    M.types["overpowered_weak_automata"].useOnBlock = impl_overpowered_weak_automata_useOnBlock
    local function impl_overpowered_weak_automata_placeBlock(arguments) return {} end
    ---@param arguments table
    ---@return table
    M.types["overpowered_weak_automata"].placeBlock = impl_overpowered_weak_automata_placeBlock
    local function impl_overpowered_weak_automata_feedSoul() return {} end
    ---@return table
    M.types["overpowered_weak_automata"].feedSoul = impl_overpowered_weak_automata_feedSoul
    local function impl_overpowered_weak_automata_chargeTurtle(arguments) return {} end
    ---@param arguments table
    ---@return table
    M.types["overpowered_weak_automata"].chargeTurtle = impl_overpowered_weak_automata_chargeTurtle
end

---@class ap.PlayerDetector
M.types["player_detector"] = {}
do
    local function impl_player_detector_getName() return "" end
    ---@return string
    M.types["player_detector"].getName = impl_player_detector_getName
    local function impl_player_detector_getOnlinePlayers() return "" end
    ---@return string
    M.types["player_detector"].getOnlinePlayers = impl_player_detector_getOnlinePlayers
    local function impl_player_detector_getPlayersInCoords(Map__, firstCoord, Map__, secondCoord) return {} end
    ---@param Map__ table
    ---@param firstCoord table
    ---@param Map__ table
    ---@param secondCoord table
    ---@return table
    M.types["player_detector"].getPlayersInCoords = impl_player_detector_getPlayersInCoords
    local function impl_player_detector_getPlayersInCubic(x, y, z) return {} end
    ---@param x integer
    ---@param y integer
    ---@param z integer
    ---@return table
    M.types["player_detector"].getPlayersInCubic = impl_player_detector_getPlayersInCubic
    local function impl_player_detector_getPlayersInRange(range) return {} end
    ---@param range integer
    ---@return table
    M.types["player_detector"].getPlayersInRange = impl_player_detector_getPlayersInRange
    local function impl_player_detector_isPlayersInCoords(Map__, firstCoord, Map__, secondCoord) return false end
    ---@param Map__ table
    ---@param firstCoord table
    ---@param Map__ table
    ---@param secondCoord table
    ---@return boolean
    M.types["player_detector"].isPlayersInCoords = impl_player_detector_isPlayersInCoords
    local function impl_player_detector_isPlayersInCubic(x, y, z) return false end
    ---@param x integer
    ---@param y integer
    ---@param z integer
    ---@return boolean
    M.types["player_detector"].isPlayersInCubic = impl_player_detector_isPlayersInCubic
    local function impl_player_detector_isPlayersInRange(range) return false end
    ---@param range integer
    ---@return boolean
    M.types["player_detector"].isPlayersInRange = impl_player_detector_isPlayersInRange
    local function impl_player_detector_isPlayerInCoords(Map__, firstCoord, Map__, secondCoord, username) return false end
    ---@param Map__ table
    ---@param firstCoord table
    ---@param Map__ table
    ---@param secondCoord table
    ---@param username string
    ---@return boolean
    M.types["player_detector"].isPlayerInCoords = impl_player_detector_isPlayerInCoords
    local function impl_player_detector_isPlayerInCubic(x, y, z, username) return false end
    ---@param x integer
    ---@param y integer
    ---@param z integer
    ---@param username string
    ---@return boolean
    M.types["player_detector"].isPlayerInCubic = impl_player_detector_isPlayerInCubic
    local function impl_player_detector_isPlayerInRange(range, username) return false end
    ---@param range integer
    ---@param username string
    ---@return boolean
    M.types["player_detector"].isPlayerInRange = impl_player_detector_isPlayerInRange
end

---@class ap.RsBridge
M.types["rs_bridge"] = {}
do
    local function impl_rs_bridge_getName() return "" end
    ---@return string
    M.types["rs_bridge"].getName = impl_rs_bridge_getName
    local function impl_rs_bridge_isConnected() return false end
    ---@return boolean
    M.types["rs_bridge"].isConnected = impl_rs_bridge_isConnected
    local function impl_rs_bridge_isOnline() return {} end
    ---@return table
    M.types["rs_bridge"].isOnline = impl_rs_bridge_isOnline
    local function impl_rs_bridge_getItem(arguments) return {} end
    ---@param arguments table
    ---@return table
    M.types["rs_bridge"].getItem = impl_rs_bridge_getItem
    local function impl_rs_bridge_getFluid(arguments) return {} end
    ---@param arguments table
    ---@return table
    M.types["rs_bridge"].getFluid = impl_rs_bridge_getFluid
    local function impl_rs_bridge_getChemical(arguments) return {} end
    ---@param arguments table
    ---@return table
    M.types["rs_bridge"].getChemical = impl_rs_bridge_getChemical
    local function impl_rs_bridge_getItems(arguments) return {} end
    ---@param arguments table
    ---@return table
    M.types["rs_bridge"].getItems = impl_rs_bridge_getItems
    local function impl_rs_bridge_getFluids(arguments) return {} end
    ---@param arguments table
    ---@return table
    M.types["rs_bridge"].getFluids = impl_rs_bridge_getFluids
    local function impl_rs_bridge_getChemicals(arguments) return {} end
    ---@param arguments table
    ---@return table
    M.types["rs_bridge"].getChemicals = impl_rs_bridge_getChemicals
    local function impl_rs_bridge_getCraftableItems(arguments) return {} end
    ---@param arguments table
    ---@return table
    M.types["rs_bridge"].getCraftableItems = impl_rs_bridge_getCraftableItems
    local function impl_rs_bridge_getCraftableFluids(arguments) return {} end
    ---@param arguments table
    ---@return table
    M.types["rs_bridge"].getCraftableFluids = impl_rs_bridge_getCraftableFluids
    local function impl_rs_bridge_getCraftableChemicals(arguments) return {} end
    ---@param arguments table
    ---@return table
    M.types["rs_bridge"].getCraftableChemicals = impl_rs_bridge_getCraftableChemicals
    local function impl_rs_bridge_getCells() return {} end
    ---@return table
    M.types["rs_bridge"].getCells = impl_rs_bridge_getCells
    local function impl_rs_bridge_getDrives() return {} end
    ---@return table
    M.types["rs_bridge"].getDrives = impl_rs_bridge_getDrives
    local function impl_rs_bridge_importItem(computer, arguments) return {} end
    ---@param computer table
    ---@param arguments table
    ---@return table
    M.types["rs_bridge"].importItem = impl_rs_bridge_importItem
    local function impl_rs_bridge_exportItem(computer, arguments) return {} end
    ---@param computer table
    ---@param arguments table
    ---@return table
    M.types["rs_bridge"].exportItem = impl_rs_bridge_exportItem
    local function impl_rs_bridge_importFluid(computer, arguments) return {} end
    ---@param computer table
    ---@param arguments table
    ---@return table
    M.types["rs_bridge"].importFluid = impl_rs_bridge_importFluid
    local function impl_rs_bridge_exportFluid(computer, arguments) return {} end
    ---@param computer table
    ---@param arguments table
    ---@return table
    M.types["rs_bridge"].exportFluid = impl_rs_bridge_exportFluid
    local function impl_rs_bridge_importChemical(computer, arguments) return {} end
    ---@param computer table
    ---@param arguments table
    ---@return table
    M.types["rs_bridge"].importChemical = impl_rs_bridge_importChemical
    local function impl_rs_bridge_exportChemical(computer, arguments) return {} end
    ---@param computer table
    ---@param arguments table
    ---@return table
    M.types["rs_bridge"].exportChemical = impl_rs_bridge_exportChemical
    local function impl_rs_bridge_getStoredEnergy() return {} end
    ---@return table
    M.types["rs_bridge"].getStoredEnergy = impl_rs_bridge_getStoredEnergy
    local function impl_rs_bridge_getEnergyCapacity() return {} end
    ---@return table
    M.types["rs_bridge"].getEnergyCapacity = impl_rs_bridge_getEnergyCapacity
    local function impl_rs_bridge_getEnergyUsage() return {} end
    ---@return table
    M.types["rs_bridge"].getEnergyUsage = impl_rs_bridge_getEnergyUsage
    local function impl_rs_bridge_getAverageEnergyInput() return {} end
    ---@return table
    M.types["rs_bridge"].getAverageEnergyInput = impl_rs_bridge_getAverageEnergyInput
    local function impl_rs_bridge_getTotalExternalItemStorage() return {} end
    ---@return table
    M.types["rs_bridge"].getTotalExternalItemStorage = impl_rs_bridge_getTotalExternalItemStorage
    local function impl_rs_bridge_getTotalExternalFluidStorage() return {} end
    ---@return table
    M.types["rs_bridge"].getTotalExternalFluidStorage = impl_rs_bridge_getTotalExternalFluidStorage
    local function impl_rs_bridge_getTotalExternalChemicalStorage() return {} end
    ---@return table
    M.types["rs_bridge"].getTotalExternalChemicalStorage = impl_rs_bridge_getTotalExternalChemicalStorage
    local function impl_rs_bridge_getTotalItemStorage() return {} end
    ---@return table
    M.types["rs_bridge"].getTotalItemStorage = impl_rs_bridge_getTotalItemStorage
    local function impl_rs_bridge_getTotalFluidStorage() return {} end
    ---@return table
    M.types["rs_bridge"].getTotalFluidStorage = impl_rs_bridge_getTotalFluidStorage
    local function impl_rs_bridge_getTotalChemicalStorage() return {} end
    ---@return table
    M.types["rs_bridge"].getTotalChemicalStorage = impl_rs_bridge_getTotalChemicalStorage
    local function impl_rs_bridge_getUsedExternalItemStorage() return {} end
    ---@return table
    M.types["rs_bridge"].getUsedExternalItemStorage = impl_rs_bridge_getUsedExternalItemStorage
    local function impl_rs_bridge_getUsedExternalFluidStorage() return {} end
    ---@return table
    M.types["rs_bridge"].getUsedExternalFluidStorage = impl_rs_bridge_getUsedExternalFluidStorage
    local function impl_rs_bridge_getUsedExternalChemicalStorage() return {} end
    ---@return table
    M.types["rs_bridge"].getUsedExternalChemicalStorage = impl_rs_bridge_getUsedExternalChemicalStorage
    local function impl_rs_bridge_getUsedItemStorage() return {} end
    ---@return table
    M.types["rs_bridge"].getUsedItemStorage = impl_rs_bridge_getUsedItemStorage
    local function impl_rs_bridge_getUsedFluidStorage() return {} end
    ---@return table
    M.types["rs_bridge"].getUsedFluidStorage = impl_rs_bridge_getUsedFluidStorage
    local function impl_rs_bridge_getUsedChemicalStorage() return {} end
    ---@return table
    M.types["rs_bridge"].getUsedChemicalStorage = impl_rs_bridge_getUsedChemicalStorage
    local function impl_rs_bridge_getAvailableExternalItemStorage() return {} end
    ---@return table
    M.types["rs_bridge"].getAvailableExternalItemStorage = impl_rs_bridge_getAvailableExternalItemStorage
    local function impl_rs_bridge_getAvailableExternalFluidStorage() return {} end
    ---@return table
    M.types["rs_bridge"].getAvailableExternalFluidStorage = impl_rs_bridge_getAvailableExternalFluidStorage
    local function impl_rs_bridge_getAvailableExternalChemicalStorage() return {} end
    ---@return table
    M.types["rs_bridge"].getAvailableExternalChemicalStorage = impl_rs_bridge_getAvailableExternalChemicalStorage
    local function impl_rs_bridge_getAvailableItemStorage() return {} end
    ---@return table
    M.types["rs_bridge"].getAvailableItemStorage = impl_rs_bridge_getAvailableItemStorage
    local function impl_rs_bridge_getAvailableFluidStorage() return {} end
    ---@return table
    M.types["rs_bridge"].getAvailableFluidStorage = impl_rs_bridge_getAvailableFluidStorage
    local function impl_rs_bridge_getAvailableChemicalStorage() return {} end
    ---@return table
    M.types["rs_bridge"].getAvailableChemicalStorage = impl_rs_bridge_getAvailableChemicalStorage
    local function impl_rs_bridge_craftItem(computer, arguments) return {} end
    ---@param computer table
    ---@param arguments table
    ---@return table
    M.types["rs_bridge"].craftItem = impl_rs_bridge_craftItem
    local function impl_rs_bridge_craftFluid(computer, arguments) return {} end
    ---@param computer table
    ---@param arguments table
    ---@return table
    M.types["rs_bridge"].craftFluid = impl_rs_bridge_craftFluid
    local function impl_rs_bridge_craftChemical(computer, arguments) return {} end
    ---@param computer table
    ---@param arguments table
    ---@return table
    M.types["rs_bridge"].craftChemical = impl_rs_bridge_craftChemical
    local function impl_rs_bridge_getCraftingTasks() return {} end
    ---@return table
    M.types["rs_bridge"].getCraftingTasks = impl_rs_bridge_getCraftingTasks
    local function impl_rs_bridge_getCraftingTask(id) return {} end
    ---@param id integer
    ---@return table
    M.types["rs_bridge"].getCraftingTask = impl_rs_bridge_getCraftingTask
    local function impl_rs_bridge_cancelCraftingTasks(arguments) return {} end
    ---@param arguments table
    ---@return table
    M.types["rs_bridge"].cancelCraftingTasks = impl_rs_bridge_cancelCraftingTasks
    local function impl_rs_bridge_isCraftable(arguments) return {} end
    ---@param arguments table
    ---@return table
    M.types["rs_bridge"].isCraftable = impl_rs_bridge_isCraftable
    local function impl_rs_bridge_isCrafting(arguments) return {} end
    ---@param arguments table
    ---@return table
    M.types["rs_bridge"].isCrafting = impl_rs_bridge_isCrafting
    local function impl_rs_bridge_getPatterns(arguments) return {} end
    ---@param arguments table
    ---@return table
    M.types["rs_bridge"].getPatterns = impl_rs_bridge_getPatterns
end

-- weak_automata: methods contributed by plugins AutomataItemSuckPlugin, AutomataLookPlugin, AutomataBlockHandPlugin, AutomataSoulFeedingPlugin, AutomataChargingPlugin.
---@class ap.WeakAutomata
M.types["weak_automata"] = {}
do
    local function impl_weak_automata_scanItems() return {} end
    ---@return table
    M.types["weak_automata"].scanItems = impl_weak_automata_scanItems
    local function impl_weak_automata_collectSpecificItem(arguments) return {} end
    ---@param arguments table
    ---@return table
    M.types["weak_automata"].collectSpecificItem = impl_weak_automata_collectSpecificItem
    local function impl_weak_automata_collectItems(arguments) return {} end
    ---@param arguments table
    ---@return table
    M.types["weak_automata"].collectItems = impl_weak_automata_collectItems
    local function impl_weak_automata_lookAtBlock(arguments) return {} end
    ---@param arguments table
    ---@return table
    M.types["weak_automata"].lookAtBlock = impl_weak_automata_lookAtBlock
    local function impl_weak_automata_lookAtEntity(arguments) return {} end
    ---@param arguments table
    ---@return table
    M.types["weak_automata"].lookAtEntity = impl_weak_automata_lookAtEntity
    local function impl_weak_automata_digBlock(arguments) return {} end
    ---@param arguments table
    ---@return table
    M.types["weak_automata"].digBlock = impl_weak_automata_digBlock
    local function impl_weak_automata_useOnBlock(arguments) return {} end
    ---@param arguments table
    ---@return table
    M.types["weak_automata"].useOnBlock = impl_weak_automata_useOnBlock
    local function impl_weak_automata_placeBlock(arguments) return {} end
    ---@param arguments table
    ---@return table
    M.types["weak_automata"].placeBlock = impl_weak_automata_placeBlock
    local function impl_weak_automata_feedSoul() return {} end
    ---@return table
    M.types["weak_automata"].feedSoul = impl_weak_automata_feedSoul
    local function impl_weak_automata_chargeTurtle(arguments) return {} end
    ---@param arguments table
    ---@return table
    M.types["weak_automata"].chargeTurtle = impl_weak_automata_chargeTurtle
end

-- weak_automata: methods contributed by plugins AutomataItemSuckPlugin, AutomataLookPlugin, AutomataBlockHandPlugin, AutomataSoulFeedingPlugin, AutomataChargingPlugin.
---@class ap.WeakAutomata
M.types["weak_automata"] = {}
do
    local function impl_weak_automata_scanItems() return {} end
    ---@return table
    M.types["weak_automata"].scanItems = impl_weak_automata_scanItems
    local function impl_weak_automata_collectSpecificItem(arguments) return {} end
    ---@param arguments table
    ---@return table
    M.types["weak_automata"].collectSpecificItem = impl_weak_automata_collectSpecificItem
    local function impl_weak_automata_collectItems(arguments) return {} end
    ---@param arguments table
    ---@return table
    M.types["weak_automata"].collectItems = impl_weak_automata_collectItems
    local function impl_weak_automata_lookAtBlock(arguments) return {} end
    ---@param arguments table
    ---@return table
    M.types["weak_automata"].lookAtBlock = impl_weak_automata_lookAtBlock
    local function impl_weak_automata_lookAtEntity(arguments) return {} end
    ---@param arguments table
    ---@return table
    M.types["weak_automata"].lookAtEntity = impl_weak_automata_lookAtEntity
    local function impl_weak_automata_digBlock(arguments) return {} end
    ---@param arguments table
    ---@return table
    M.types["weak_automata"].digBlock = impl_weak_automata_digBlock
    local function impl_weak_automata_useOnBlock(arguments) return {} end
    ---@param arguments table
    ---@return table
    M.types["weak_automata"].useOnBlock = impl_weak_automata_useOnBlock
    local function impl_weak_automata_placeBlock(arguments) return {} end
    ---@param arguments table
    ---@return table
    M.types["weak_automata"].placeBlock = impl_weak_automata_placeBlock
    local function impl_weak_automata_feedSoul() return {} end
    ---@return table
    M.types["weak_automata"].feedSoul = impl_weak_automata_feedSoul
    local function impl_weak_automata_chargeTurtle(arguments) return {} end
    ---@param arguments table
    ---@return table
    M.types["weak_automata"].chargeTurtle = impl_weak_automata_chargeTurtle
end

return M
