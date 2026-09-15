-- mock_api/createavionics.lua
-- Method tables for Create: Avionics peripherals.
-- Source: api-docs/createavionics/java/**/*.java + CODEMAP.md inventory.
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

---@class avionics.AltitudeSensor
M.types["altitude_sensor"] = {}
do
    local function impl_altitude_sensor_getHeight() return 0 end
    ---@return number
    M.types["altitude_sensor"].getHeight = impl_altitude_sensor_getHeight
    local function impl_altitude_sensor_getAirPressure() return 0 end
    ---@return number
    M.types["altitude_sensor"].getAirPressure = impl_altitude_sensor_getAirPressure
    local function impl_altitude_sensor_getVerticalSpeed() return 0 end
    ---@return number
    M.types["altitude_sensor"].getVerticalSpeed = impl_altitude_sensor_getVerticalSpeed
end

---@class avionics.AnalogTransmission
M.types["analog_transmission"] = {}
do
    local function impl_analog_transmission_getSelfId() return "" end
    ---@return string
    M.types["analog_transmission"].getSelfId = impl_analog_transmission_getSelfId
    local function impl_analog_transmission_getSourceId() return "" end
    ---@return string
    M.types["analog_transmission"].getSourceId = impl_analog_transmission_getSourceId
    local function impl_analog_transmission_getSubnetworkAnchorId() return "" end
    ---@return string
    M.types["analog_transmission"].getSubnetworkAnchorId = impl_analog_transmission_getSubnetworkAnchorId
    local function impl_analog_transmission_getNetworkId() return "" end
    ---@return string
    M.types["analog_transmission"].getNetworkId = impl_analog_transmission_getNetworkId
    local function impl_analog_transmission_getKind() return "" end
    ---@return string
    M.types["analog_transmission"].getKind = impl_analog_transmission_getKind
    local function impl_analog_transmission_getSpeed() return 0 end
    ---@return number
    M.types["analog_transmission"].getSpeed = impl_analog_transmission_getSpeed
    local function impl_analog_transmission_hasSource() return false end
    ---@return boolean
    M.types["analog_transmission"].hasSource = impl_analog_transmission_hasSource
    local function impl_analog_transmission_isOverstressed() return false end
    ---@return boolean
    M.types["analog_transmission"].isOverstressed = impl_analog_transmission_isOverstressed
    local function impl_analog_transmission_getStressImpact() return 0 end
    ---@return number
    M.types["analog_transmission"].getStressImpact = impl_analog_transmission_getStressImpact
    local function impl_analog_transmission_getStressContribution() return 0 end
    ---@return number
    M.types["analog_transmission"].getStressContribution = impl_analog_transmission_getStressContribution
    local function impl_analog_transmission_getSignal() return 0 end
    ---@return integer
    M.types["analog_transmission"].getSignal = impl_analog_transmission_getSignal
    local function impl_analog_transmission_setSignal(signal) end
    ---@param signal table
    M.types["analog_transmission"].setSignal = impl_analog_transmission_setSignal
    local function impl_analog_transmission_releaseSignal() end
    M.types["analog_transmission"].releaseSignal = impl_analog_transmission_releaseSignal
    local function impl_analog_transmission_isExternallyControlled() return false end
    ---@return boolean
    M.types["analog_transmission"].isExternallyControlled = impl_analog_transmission_isExternallyControlled
    local function impl_analog_transmission_getRotationModifier() return 0 end
    ---@return number
    M.types["analog_transmission"].getRotationModifier = impl_analog_transmission_getRotationModifier
    local function impl_analog_transmission_getOutputSpeed() return 0 end
    ---@return number
    M.types["analog_transmission"].getOutputSpeed = impl_analog_transmission_getOutputSpeed
    local function impl_analog_transmission_getOutputTheoreticalSpeed() return 0 end
    ---@return number
    M.types["analog_transmission"].getOutputTheoreticalSpeed = impl_analog_transmission_getOutputTheoreticalSpeed
    local function impl_analog_transmission_getOutputStressImpact() return 0 end
    ---@return number
    M.types["analog_transmission"].getOutputStressImpact = impl_analog_transmission_getOutputStressImpact
    local function impl_analog_transmission_isOversaturated() return false end
    ---@return boolean
    M.types["analog_transmission"].isOversaturated = impl_analog_transmission_isOversaturated
    local function impl_analog_transmission_getAxis() return "" end
    ---@return string
    M.types["analog_transmission"].getAxis = impl_analog_transmission_getAxis
end

---@class avionics.CreateCreativeMotor
M.types["Create_CreativeMotor"] = {}
do
    local function impl_Create_CreativeMotor_getSelfId() return "" end
    ---@return string
    M.types["Create_CreativeMotor"].getSelfId = impl_Create_CreativeMotor_getSelfId
    local function impl_Create_CreativeMotor_getSourceId() return "" end
    ---@return string
    M.types["Create_CreativeMotor"].getSourceId = impl_Create_CreativeMotor_getSourceId
    local function impl_Create_CreativeMotor_getSubnetworkAnchorId() return "" end
    ---@return string
    M.types["Create_CreativeMotor"].getSubnetworkAnchorId = impl_Create_CreativeMotor_getSubnetworkAnchorId
    local function impl_Create_CreativeMotor_getNetworkId() return "" end
    ---@return string
    M.types["Create_CreativeMotor"].getNetworkId = impl_Create_CreativeMotor_getNetworkId
    local function impl_Create_CreativeMotor_getKind() return "" end
    ---@return string
    M.types["Create_CreativeMotor"].getKind = impl_Create_CreativeMotor_getKind
    local function impl_Create_CreativeMotor_getSpeed() return 0 end
    ---@return number
    M.types["Create_CreativeMotor"].getSpeed = impl_Create_CreativeMotor_getSpeed
    local function impl_Create_CreativeMotor_hasSource() return false end
    ---@return boolean
    M.types["Create_CreativeMotor"].hasSource = impl_Create_CreativeMotor_hasSource
    local function impl_Create_CreativeMotor_isOverstressed() return false end
    ---@return boolean
    M.types["Create_CreativeMotor"].isOverstressed = impl_Create_CreativeMotor_isOverstressed
    local function impl_Create_CreativeMotor_getStressImpact() return 0 end
    ---@return number
    M.types["Create_CreativeMotor"].getStressImpact = impl_Create_CreativeMotor_getStressImpact
    local function impl_Create_CreativeMotor_getStressContribution() return 0 end
    ---@return number
    M.types["Create_CreativeMotor"].getStressContribution = impl_Create_CreativeMotor_getStressContribution
    local function impl_Create_CreativeMotor_setGeneratedSpeed(speed) end
    ---@param speed integer
    M.types["Create_CreativeMotor"].setGeneratedSpeed = impl_Create_CreativeMotor_setGeneratedSpeed
    local function impl_Create_CreativeMotor_getGeneratedSpeed() return 0 end
    ---@return number
    M.types["Create_CreativeMotor"].getGeneratedSpeed = impl_Create_CreativeMotor_getGeneratedSpeed
end

---@class avionics.DirectionalGearshift
M.types["directional_gearshift"] = {}
do
    local function impl_directional_gearshift_getSelfId() return "" end
    ---@return string
    M.types["directional_gearshift"].getSelfId = impl_directional_gearshift_getSelfId
    local function impl_directional_gearshift_getSourceId() return "" end
    ---@return string
    M.types["directional_gearshift"].getSourceId = impl_directional_gearshift_getSourceId
    local function impl_directional_gearshift_getSubnetworkAnchorId() return "" end
    ---@return string
    M.types["directional_gearshift"].getSubnetworkAnchorId = impl_directional_gearshift_getSubnetworkAnchorId
    local function impl_directional_gearshift_getNetworkId() return "" end
    ---@return string
    M.types["directional_gearshift"].getNetworkId = impl_directional_gearshift_getNetworkId
    local function impl_directional_gearshift_getKind() return "" end
    ---@return string
    M.types["directional_gearshift"].getKind = impl_directional_gearshift_getKind
    local function impl_directional_gearshift_getSpeed() return 0 end
    ---@return number
    M.types["directional_gearshift"].getSpeed = impl_directional_gearshift_getSpeed
    local function impl_directional_gearshift_hasSource() return false end
    ---@return boolean
    M.types["directional_gearshift"].hasSource = impl_directional_gearshift_hasSource
    local function impl_directional_gearshift_isOverstressed() return false end
    ---@return boolean
    M.types["directional_gearshift"].isOverstressed = impl_directional_gearshift_isOverstressed
    local function impl_directional_gearshift_getStressImpact() return 0 end
    ---@return number
    M.types["directional_gearshift"].getStressImpact = impl_directional_gearshift_getStressImpact
    local function impl_directional_gearshift_getStressContribution() return 0 end
    ---@return number
    M.types["directional_gearshift"].getStressContribution = impl_directional_gearshift_getStressContribution
    local function impl_directional_gearshift_getSourceAxis() return "" end
    ---@return string
    M.types["directional_gearshift"].getSourceAxis = impl_directional_gearshift_getSourceAxis
    local function impl_directional_gearshift_isLeftPowered() return false end
    ---@return boolean
    M.types["directional_gearshift"].isLeftPowered = impl_directional_gearshift_isLeftPowered
    local function impl_directional_gearshift_isRightPowered() return false end
    ---@return boolean
    M.types["directional_gearshift"].isRightPowered = impl_directional_gearshift_isRightPowered
    local function impl_directional_gearshift_getMode() return "" end
    ---@return string
    M.types["directional_gearshift"].getMode = impl_directional_gearshift_getMode
end

---@class avionics.CreateElevatorContact
M.types["Create_ElevatorContact"] = {}
do
    local function impl_Create_ElevatorContact_getSelfId() return "" end
    ---@return string
    M.types["Create_ElevatorContact"].getSelfId = impl_Create_ElevatorContact_getSelfId
    local function impl_Create_ElevatorContact_getColumnId() return "" end
    ---@return string
    M.types["Create_ElevatorContact"].getColumnId = impl_Create_ElevatorContact_getColumnId
    local function impl_Create_ElevatorContact_getY() return 0 end
    ---@return integer
    M.types["Create_ElevatorContact"].getY = impl_Create_ElevatorContact_getY
    local function impl_Create_ElevatorContact_getShortName() return "" end
    ---@return string
    M.types["Create_ElevatorContact"].getShortName = impl_Create_ElevatorContact_getShortName
    local function impl_Create_ElevatorContact_getLongName() return "" end
    ---@return string
    M.types["Create_ElevatorContact"].getLongName = impl_Create_ElevatorContact_getLongName
    local function impl_Create_ElevatorContact_setShortName(shortName) end
    ---@param shortName table
    M.types["Create_ElevatorContact"].setShortName = impl_Create_ElevatorContact_setShortName
    local function impl_Create_ElevatorContact_setLongName(longName) end
    ---@param longName table
    M.types["Create_ElevatorContact"].setLongName = impl_Create_ElevatorContact_setLongName
    local function impl_Create_ElevatorContact_getDoorMode() return "" end
    ---@return string
    M.types["Create_ElevatorContact"].getDoorMode = impl_Create_ElevatorContact_getDoorMode
    local function impl_Create_ElevatorContact_setDoorMode(mode) end
    ---@param mode table
    M.types["Create_ElevatorContact"].setDoorMode = impl_Create_ElevatorContact_setDoorMode
    local function impl_Create_ElevatorContact_isPowered() return false end
    ---@return boolean
    M.types["Create_ElevatorContact"].isPowered = impl_Create_ElevatorContact_isPowered
    local function impl_Create_ElevatorContact_isCalling() return false end
    ---@return boolean
    M.types["Create_ElevatorContact"].isCalling = impl_Create_ElevatorContact_isCalling
    local function impl_Create_ElevatorContact_isPowering() return false end
    ---@return boolean
    M.types["Create_ElevatorContact"].isPowering = impl_Create_ElevatorContact_isPowering
    local function impl_Create_ElevatorContact_getLastReportedFloor() return "" end
    ---@return string
    M.types["Create_ElevatorContact"].getLastReportedFloor = impl_Create_ElevatorContact_getLastReportedFloor
    local function impl_Create_ElevatorContact_call() end
    M.types["Create_ElevatorContact"].call = impl_Create_ElevatorContact_call
end

---@class avionics.CreateElevatorPulley
M.types["Create_ElevatorPulley"] = {}
do
    local function impl_Create_ElevatorPulley_getSelfId() return "" end
    ---@return string
    M.types["Create_ElevatorPulley"].getSelfId = impl_Create_ElevatorPulley_getSelfId
    local function impl_Create_ElevatorPulley_getSourceId() return "" end
    ---@return string
    M.types["Create_ElevatorPulley"].getSourceId = impl_Create_ElevatorPulley_getSourceId
    local function impl_Create_ElevatorPulley_getSubnetworkAnchorId() return "" end
    ---@return string
    M.types["Create_ElevatorPulley"].getSubnetworkAnchorId = impl_Create_ElevatorPulley_getSubnetworkAnchorId
    local function impl_Create_ElevatorPulley_getNetworkId() return "" end
    ---@return string
    M.types["Create_ElevatorPulley"].getNetworkId = impl_Create_ElevatorPulley_getNetworkId
    local function impl_Create_ElevatorPulley_getKind() return "" end
    ---@return string
    M.types["Create_ElevatorPulley"].getKind = impl_Create_ElevatorPulley_getKind
    local function impl_Create_ElevatorPulley_getSpeed() return 0 end
    ---@return number
    M.types["Create_ElevatorPulley"].getSpeed = impl_Create_ElevatorPulley_getSpeed
    local function impl_Create_ElevatorPulley_hasSource() return false end
    ---@return boolean
    M.types["Create_ElevatorPulley"].hasSource = impl_Create_ElevatorPulley_hasSource
    local function impl_Create_ElevatorPulley_isOverstressed() return false end
    ---@return boolean
    M.types["Create_ElevatorPulley"].isOverstressed = impl_Create_ElevatorPulley_isOverstressed
    local function impl_Create_ElevatorPulley_getStressImpact() return 0 end
    ---@return number
    M.types["Create_ElevatorPulley"].getStressImpact = impl_Create_ElevatorPulley_getStressImpact
    local function impl_Create_ElevatorPulley_getStressContribution() return 0 end
    ---@return number
    M.types["Create_ElevatorPulley"].getStressContribution = impl_Create_ElevatorPulley_getStressContribution
    local function impl_Create_ElevatorPulley_getContraption() return nil end
    ---@return any
    M.types["Create_ElevatorPulley"].getContraption = impl_Create_ElevatorPulley_getContraption
    local function impl_Create_ElevatorPulley_size() return 0 end
    ---@return integer
    M.types["Create_ElevatorPulley"].size = impl_Create_ElevatorPulley_size
    local function impl_Create_ElevatorPulley_getItemLimit(slot) return 0 end
    ---@param slot table
    ---@return integer
    M.types["Create_ElevatorPulley"].getItemLimit = impl_Create_ElevatorPulley_getItemLimit
    local function impl_Create_ElevatorPulley_isAssembled() return false end
    ---@return boolean
    M.types["Create_ElevatorPulley"].isAssembled = impl_Create_ElevatorPulley_isAssembled
    local function impl_Create_ElevatorPulley_assemble() end
    M.types["Create_ElevatorPulley"].assemble = impl_Create_ElevatorPulley_assemble
    local function impl_Create_ElevatorPulley_disassemble() end
    M.types["Create_ElevatorPulley"].disassemble = impl_Create_ElevatorPulley_disassemble
    local function impl_Create_ElevatorPulley_getOffset() return 0 end
    ---@return number
    M.types["Create_ElevatorPulley"].getOffset = impl_Create_ElevatorPulley_getOffset
    local function impl_Create_ElevatorPulley_getMaxLength() return 0 end
    ---@return integer
    M.types["Create_ElevatorPulley"].getMaxLength = impl_Create_ElevatorPulley_getMaxLength
    local function impl_Create_ElevatorPulley_getCurrentY() return 0 end
    ---@return integer
    M.types["Create_ElevatorPulley"].getCurrentY = impl_Create_ElevatorPulley_getCurrentY
    local function impl_Create_ElevatorPulley_getMovementSpeed() return 0 end
    ---@return number
    M.types["Create_ElevatorPulley"].getMovementSpeed = impl_Create_ElevatorPulley_getMovementSpeed
    local function impl_Create_ElevatorPulley_isArrived() return false end
    ---@return boolean
    M.types["Create_ElevatorPulley"].isArrived = impl_Create_ElevatorPulley_isArrived
    local function impl_Create_ElevatorPulley_getColumnId() return "" end
    ---@return string
    M.types["Create_ElevatorPulley"].getColumnId = impl_Create_ElevatorPulley_getColumnId
    local function impl_Create_ElevatorPulley_getCurrentTargetY() return 0 end
    ---@return integer
    M.types["Create_ElevatorPulley"].getCurrentTargetY = impl_Create_ElevatorPulley_getCurrentTargetY
    local function impl_Create_ElevatorPulley_stop() end
    M.types["Create_ElevatorPulley"].stop = impl_Create_ElevatorPulley_stop
    local function impl_Create_ElevatorPulley_setTargetY(y) end
    ---@param y table
    M.types["Create_ElevatorPulley"].setTargetY = impl_Create_ElevatorPulley_setTargetY
    local function impl_Create_ElevatorPulley_setTargetFloor(y) end
    ---@param y table
    M.types["Create_ElevatorPulley"].setTargetFloor = impl_Create_ElevatorPulley_setTargetFloor
    local function impl_Create_ElevatorPulley_getLastAssemblyError() return "" end
    ---@return string
    M.types["Create_ElevatorPulley"].getLastAssemblyError = impl_Create_ElevatorPulley_getLastAssemblyError
end

---@class avionics.CreateGantryShaft
M.types["Create_GantryShaft"] = {}
do
    local function impl_Create_GantryShaft_getSelfId() return "" end
    ---@return string
    M.types["Create_GantryShaft"].getSelfId = impl_Create_GantryShaft_getSelfId
    local function impl_Create_GantryShaft_getSourceId() return "" end
    ---@return string
    M.types["Create_GantryShaft"].getSourceId = impl_Create_GantryShaft_getSourceId
    local function impl_Create_GantryShaft_getSubnetworkAnchorId() return "" end
    ---@return string
    M.types["Create_GantryShaft"].getSubnetworkAnchorId = impl_Create_GantryShaft_getSubnetworkAnchorId
    local function impl_Create_GantryShaft_getNetworkId() return "" end
    ---@return string
    M.types["Create_GantryShaft"].getNetworkId = impl_Create_GantryShaft_getNetworkId
    local function impl_Create_GantryShaft_getKind() return "" end
    ---@return string
    M.types["Create_GantryShaft"].getKind = impl_Create_GantryShaft_getKind
    local function impl_Create_GantryShaft_getSpeed() return 0 end
    ---@return number
    M.types["Create_GantryShaft"].getSpeed = impl_Create_GantryShaft_getSpeed
    local function impl_Create_GantryShaft_hasSource() return false end
    ---@return boolean
    M.types["Create_GantryShaft"].hasSource = impl_Create_GantryShaft_hasSource
    local function impl_Create_GantryShaft_isOverstressed() return false end
    ---@return boolean
    M.types["Create_GantryShaft"].isOverstressed = impl_Create_GantryShaft_isOverstressed
    local function impl_Create_GantryShaft_getStressImpact() return 0 end
    ---@return number
    M.types["Create_GantryShaft"].getStressImpact = impl_Create_GantryShaft_getStressImpact
    local function impl_Create_GantryShaft_getStressContribution() return 0 end
    ---@return number
    M.types["Create_GantryShaft"].getStressContribution = impl_Create_GantryShaft_getStressContribution
    local function impl_Create_GantryShaft_getContraption() return nil end
    ---@return any
    M.types["Create_GantryShaft"].getContraption = impl_Create_GantryShaft_getContraption
    local function impl_Create_GantryShaft_size() return 0 end
    ---@return integer
    M.types["Create_GantryShaft"].size = impl_Create_GantryShaft_size
    local function impl_Create_GantryShaft_getItemLimit(slot) return 0 end
    ---@param slot table
    ---@return integer
    M.types["Create_GantryShaft"].getItemLimit = impl_Create_GantryShaft_getItemLimit
    local function impl_Create_GantryShaft_getPart() return "" end
    ---@return string
    M.types["Create_GantryShaft"].getPart = impl_Create_GantryShaft_getPart
    local function impl_Create_GantryShaft_getAxis() return "" end
    ---@return string
    M.types["Create_GantryShaft"].getAxis = impl_Create_GantryShaft_getAxis
    local function impl_Create_GantryShaft_isPowered() return false end
    ---@return boolean
    M.types["Create_GantryShaft"].isPowered = impl_Create_GantryShaft_isPowered
    local function impl_Create_GantryShaft_getMovementSpeed() return 0 end
    ---@return number
    M.types["Create_GantryShaft"].getMovementSpeed = impl_Create_GantryShaft_getMovementSpeed
    local function impl_Create_GantryShaft_canAssembleOn() return false end
    ---@return boolean
    M.types["Create_GantryShaft"].canAssembleOn = impl_Create_GantryShaft_canAssembleOn
    local function impl_Create_GantryShaft_getRailLength() return 0 end
    ---@return integer
    M.types["Create_GantryShaft"].getRailLength = impl_Create_GantryShaft_getRailLength
    local function impl_Create_GantryShaft_getRailIndex() return 0 end
    ---@return integer
    M.types["Create_GantryShaft"].getRailIndex = impl_Create_GantryShaft_getRailIndex
    local function impl_Create_GantryShaft_getCarriage() return nil end
    ---@return any
    M.types["Create_GantryShaft"].getCarriage = impl_Create_GantryShaft_getCarriage
    local function impl_Create_GantryShaft_getState() return "" end
    ---@return string
    M.types["Create_GantryShaft"].getState = impl_Create_GantryShaft_getState
    local function impl_Create_GantryShaft_getCarriagePosition() return 0 end
    ---@return number
    M.types["Create_GantryShaft"].getCarriagePosition = impl_Create_GantryShaft_getCarriagePosition
    local function impl_Create_GantryShaft_hasCarriage() return false end
    ---@return boolean
    M.types["Create_GantryShaft"].hasCarriage = impl_Create_GantryShaft_hasCarriage
    local function impl_Create_GantryShaft_getCarriageId() return "" end
    ---@return string
    M.types["Create_GantryShaft"].getCarriageId = impl_Create_GantryShaft_getCarriageId
    local function impl_Create_GantryShaft_isAssembled() return false end
    ---@return boolean
    M.types["Create_GantryShaft"].isAssembled = impl_Create_GantryShaft_isAssembled
    local function impl_Create_GantryShaft_isStalled() return false end
    ---@return boolean
    M.types["Create_GantryShaft"].isStalled = impl_Create_GantryShaft_isStalled
    local function impl_Create_GantryShaft_getRemainingMovement() return 0 end
    ---@return number
    M.types["Create_GantryShaft"].getRemainingMovement = impl_Create_GantryShaft_getRemainingMovement
    local function impl_Create_GantryShaft_getLastAssemblyError() return "" end
    ---@return string
    M.types["Create_GantryShaft"].getLastAssemblyError = impl_Create_GantryShaft_getLastAssemblyError
    local function impl_Create_GantryShaft_disassemble() return nil end
    ---@return any
    M.types["Create_GantryShaft"].disassemble = impl_Create_GantryShaft_disassemble
end

---@class avionics.GasProvider
M.types["gas_provider"] = {}
do
    local function impl_gas_provider_getGasOutput() return 0 end
    ---@return number
    M.types["gas_provider"].getGasOutput = impl_gas_provider_getGasOutput
    local function impl_gas_provider_isActive() return false end
    ---@return boolean
    M.types["gas_provider"].isActive = impl_gas_provider_isActive
    local function impl_gas_provider_getSignalStrength() return 0 end
    ---@return integer
    M.types["gas_provider"].getSignalStrength = impl_gas_provider_getSignalStrength
    local function impl_gas_provider_getGasType() return "" end
    ---@return string
    M.types["gas_provider"].getGasType = impl_gas_provider_getGasType
    local function impl_gas_provider_getTargetAmount() return 0 end
    ---@return integer
    M.types["gas_provider"].getTargetAmount = impl_gas_provider_getTargetAmount
    local function impl_gas_provider_setTargetAmount(amount) end
    ---@param amount table
    M.types["gas_provider"].setTargetAmount = impl_gas_provider_setTargetAmount
    local function impl_gas_provider_getBoilerEfficiency() return 0 end
    ---@return number
    M.types["gas_provider"].getBoilerEfficiency = impl_gas_provider_getBoilerEfficiency
    local function impl_gas_provider_hasBalloon() return false end
    ---@return boolean
    M.types["gas_provider"].hasBalloon = impl_gas_provider_hasBalloon
    local function impl_gas_provider_getBalloonCapacity() return 0 end
    ---@return integer
    M.types["gas_provider"].getBalloonCapacity = impl_gas_provider_getBalloonCapacity
    local function impl_gas_provider_getBalloonFilledVolume() return 0 end
    ---@return number
    M.types["gas_provider"].getBalloonFilledVolume = impl_gas_provider_getBalloonFilledVolume
    local function impl_gas_provider_getBalloonTargetVolume() return 0 end
    ---@return number
    M.types["gas_provider"].getBalloonTargetVolume = impl_gas_provider_getBalloonTargetVolume
    local function impl_gas_provider_getBalloonVolumeChange() return 0 end
    ---@return number
    M.types["gas_provider"].getBalloonVolumeChange = impl_gas_provider_getBalloonVolumeChange
    local function impl_gas_provider_getBalloonLift() return 0 end
    ---@return number
    M.types["gas_provider"].getBalloonLift = impl_gas_provider_getBalloonLift
    local function impl_gas_provider_getBalloonHeight() return 0 end
    ---@return number
    M.types["gas_provider"].getBalloonHeight = impl_gas_provider_getBalloonHeight
end

---@class avionics.GimbalSensor
M.types["gimbal_sensor"] = {}
do
    local function impl_gimbal_sensor_getAngles() return {} end
    ---@return table
    M.types["gimbal_sensor"].getAngles = impl_gimbal_sensor_getAngles
    local function impl_gimbal_sensor_getAnglesRad() return {} end
    ---@return table
    M.types["gimbal_sensor"].getAnglesRad = impl_gimbal_sensor_getAnglesRad
    local function impl_gimbal_sensor_getAngularRates() return {} end
    ---@return table
    M.types["gimbal_sensor"].getAngularRates = impl_gimbal_sensor_getAngularRates
    local function impl_gimbal_sensor_getAngularRatesRad() return {} end
    ---@return table
    M.types["gimbal_sensor"].getAngularRatesRad = impl_gimbal_sensor_getAngularRatesRad
    local function impl_gimbal_sensor_getGravity() return {} end
    ---@return table
    M.types["gimbal_sensor"].getGravity = impl_gimbal_sensor_getGravity
    local function impl_gimbal_sensor_getLinearAcceleration() return {} end
    ---@return table
    M.types["gimbal_sensor"].getLinearAcceleration = impl_gimbal_sensor_getLinearAcceleration
end

---@class avionics.GyroscopicPropellerBearing
M.types["gyroscopic_propeller_bearing"] = {}
do
    local function impl_gyroscopic_propeller_bearing_getSelfId() return "" end
    ---@return string
    M.types["gyroscopic_propeller_bearing"].getSelfId = impl_gyroscopic_propeller_bearing_getSelfId
    local function impl_gyroscopic_propeller_bearing_getSourceId() return "" end
    ---@return string
    M.types["gyroscopic_propeller_bearing"].getSourceId = impl_gyroscopic_propeller_bearing_getSourceId
    local function impl_gyroscopic_propeller_bearing_getSubnetworkAnchorId() return "" end
    ---@return string
    M.types["gyroscopic_propeller_bearing"].getSubnetworkAnchorId = impl_gyroscopic_propeller_bearing_getSubnetworkAnchorId
    local function impl_gyroscopic_propeller_bearing_getNetworkId() return "" end
    ---@return string
    M.types["gyroscopic_propeller_bearing"].getNetworkId = impl_gyroscopic_propeller_bearing_getNetworkId
    local function impl_gyroscopic_propeller_bearing_getKind() return "" end
    ---@return string
    M.types["gyroscopic_propeller_bearing"].getKind = impl_gyroscopic_propeller_bearing_getKind
    local function impl_gyroscopic_propeller_bearing_getSpeed() return 0 end
    ---@return number
    M.types["gyroscopic_propeller_bearing"].getSpeed = impl_gyroscopic_propeller_bearing_getSpeed
    local function impl_gyroscopic_propeller_bearing_hasSource() return false end
    ---@return boolean
    M.types["gyroscopic_propeller_bearing"].hasSource = impl_gyroscopic_propeller_bearing_hasSource
    local function impl_gyroscopic_propeller_bearing_isOverstressed() return false end
    ---@return boolean
    M.types["gyroscopic_propeller_bearing"].isOverstressed = impl_gyroscopic_propeller_bearing_isOverstressed
    local function impl_gyroscopic_propeller_bearing_getStressImpact() return 0 end
    ---@return number
    M.types["gyroscopic_propeller_bearing"].getStressImpact = impl_gyroscopic_propeller_bearing_getStressImpact
    local function impl_gyroscopic_propeller_bearing_getStressContribution() return 0 end
    ---@return number
    M.types["gyroscopic_propeller_bearing"].getStressContribution = impl_gyroscopic_propeller_bearing_getStressContribution
    local function impl_gyroscopic_propeller_bearing_getAxis() return "" end
    ---@return string
    M.types["gyroscopic_propeller_bearing"].getAxis = impl_gyroscopic_propeller_bearing_getAxis
    local function impl_gyroscopic_propeller_bearing_getThrustVector() return {} end
    ---@return table
    M.types["gyroscopic_propeller_bearing"].getThrustVector = impl_gyroscopic_propeller_bearing_getThrustVector
    local function impl_gyroscopic_propeller_bearing_getFacingVector() return {} end
    ---@return table
    M.types["gyroscopic_propeller_bearing"].getFacingVector = impl_gyroscopic_propeller_bearing_getFacingVector
    local function impl_gyroscopic_propeller_bearing_getRotationSpeed() return 0 end
    ---@return number
    M.types["gyroscopic_propeller_bearing"].getRotationSpeed = impl_gyroscopic_propeller_bearing_getRotationSpeed
    local function impl_gyroscopic_propeller_bearing_getAngularSpeed() return 0 end
    ---@return number
    M.types["gyroscopic_propeller_bearing"].getAngularSpeed = impl_gyroscopic_propeller_bearing_getAngularSpeed
    local function impl_gyroscopic_propeller_bearing_getAngle() return 0 end
    ---@return number
    M.types["gyroscopic_propeller_bearing"].getAngle = impl_gyroscopic_propeller_bearing_getAngle
    local function impl_gyroscopic_propeller_bearing_getThrust() return 0 end
    ---@return number
    M.types["gyroscopic_propeller_bearing"].getThrust = impl_gyroscopic_propeller_bearing_getThrust
    local function impl_gyroscopic_propeller_bearing_getAirflow() return 0 end
    ---@return number
    M.types["gyroscopic_propeller_bearing"].getAirflow = impl_gyroscopic_propeller_bearing_getAirflow
    local function impl_gyroscopic_propeller_bearing_getSailPower() return 0 end
    ---@return number
    M.types["gyroscopic_propeller_bearing"].getSailPower = impl_gyroscopic_propeller_bearing_getSailPower
    local function impl_gyroscopic_propeller_bearing_isActive() return false end
    ---@return boolean
    M.types["gyroscopic_propeller_bearing"].isActive = impl_gyroscopic_propeller_bearing_isActive
    local function impl_gyroscopic_propeller_bearing_getThrustHandedness() return "" end
    ---@return string
    M.types["gyroscopic_propeller_bearing"].getThrustHandedness = impl_gyroscopic_propeller_bearing_getThrustHandedness
    local function impl_gyroscopic_propeller_bearing_setThrustHandedness(handedness) end
    ---@param handedness table
    M.types["gyroscopic_propeller_bearing"].setThrustHandedness = impl_gyroscopic_propeller_bearing_setThrustHandedness
    local function impl_gyroscopic_propeller_bearing_isAssembled() return false end
    ---@return boolean
    M.types["gyroscopic_propeller_bearing"].isAssembled = impl_gyroscopic_propeller_bearing_isAssembled
    local function impl_gyroscopic_propeller_bearing_assemble() end
    M.types["gyroscopic_propeller_bearing"].assemble = impl_gyroscopic_propeller_bearing_assemble
    local function impl_gyroscopic_propeller_bearing_disassemble() end
    M.types["gyroscopic_propeller_bearing"].disassemble = impl_gyroscopic_propeller_bearing_disassemble
    local function impl_gyroscopic_propeller_bearing_isWoodenTop() return false end
    ---@return boolean
    M.types["gyroscopic_propeller_bearing"].isWoodenTop = impl_gyroscopic_propeller_bearing_isWoodenTop
    local function impl_gyroscopic_propeller_bearing_getBlockNormal() return {} end
    ---@return table
    M.types["gyroscopic_propeller_bearing"].getBlockNormal = impl_gyroscopic_propeller_bearing_getBlockNormal
    local function impl_gyroscopic_propeller_bearing_getTiltAngle() return 0 end
    ---@return number
    M.types["gyroscopic_propeller_bearing"].getTiltAngle = impl_gyroscopic_propeller_bearing_getTiltAngle
    local function impl_gyroscopic_propeller_bearing_getStabilizationStrength() return 0 end
    ---@return number
    M.types["gyroscopic_propeller_bearing"].getStabilizationStrength = impl_gyroscopic_propeller_bearing_getStabilizationStrength
    local function impl_gyroscopic_propeller_bearing_setManualTarget(Map__, target) end
    ---@param Map__ table
    ---@param target table
    M.types["gyroscopic_propeller_bearing"].setManualTarget = impl_gyroscopic_propeller_bearing_setManualTarget
    local function impl_gyroscopic_propeller_bearing_clearManualTarget() end
    M.types["gyroscopic_propeller_bearing"].clearManualTarget = impl_gyroscopic_propeller_bearing_clearManualTarget
    local function impl_gyroscopic_propeller_bearing_getManualTarget() return {} end
    ---@return table
    M.types["gyroscopic_propeller_bearing"].getManualTarget = impl_gyroscopic_propeller_bearing_getManualTarget
end

---@class avionics.KineticProvider
M.types["kinetic_provider"] = {}
do
    local function impl_kinetic_provider_getSelfId(be) return "" end
    ---@param be table
    ---@return string
    M.types["kinetic_provider"].getSelfId = impl_kinetic_provider_getSelfId
    local function impl_kinetic_provider_getSourceId(be) return "" end
    ---@param be table
    ---@return string
    M.types["kinetic_provider"].getSourceId = impl_kinetic_provider_getSourceId
    local function impl_kinetic_provider_getSubnetworkAnchorId(be) return "" end
    ---@param be table
    ---@return string
    M.types["kinetic_provider"].getSubnetworkAnchorId = impl_kinetic_provider_getSubnetworkAnchorId
    local function impl_kinetic_provider_getNetworkId(be) return "" end
    ---@param be table
    ---@return string
    M.types["kinetic_provider"].getNetworkId = impl_kinetic_provider_getNetworkId
    local function impl_kinetic_provider_getKind(be) return "" end
    ---@param be table
    ---@return string
    M.types["kinetic_provider"].getKind = impl_kinetic_provider_getKind
    local function impl_kinetic_provider_getSpeed(be) return 0 end
    ---@param be table
    ---@return number
    M.types["kinetic_provider"].getSpeed = impl_kinetic_provider_getSpeed
    local function impl_kinetic_provider_hasSource(be) return false end
    ---@param be table
    ---@return boolean
    M.types["kinetic_provider"].hasSource = impl_kinetic_provider_hasSource
    local function impl_kinetic_provider_isOverstressed(be) return false end
    ---@param be table
    ---@return boolean
    M.types["kinetic_provider"].isOverstressed = impl_kinetic_provider_isOverstressed
    local function impl_kinetic_provider_getStressImpact(be) return 0 end
    ---@param be table
    ---@return number
    M.types["kinetic_provider"].getStressImpact = impl_kinetic_provider_getStressImpact
    local function impl_kinetic_provider_getStressContribution(be) return 0 end
    ---@param be table
    ---@return number
    M.types["kinetic_provider"].getStressContribution = impl_kinetic_provider_getStressContribution
end

---@class avionics.LaserPointer
M.types["laser_pointer"] = {}
do
    local function impl_laser_pointer_getAxis() return "" end
    ---@return string
    M.types["laser_pointer"].getAxis = impl_laser_pointer_getAxis
    local function impl_laser_pointer_isFiring() return false end
    ---@return boolean
    M.types["laser_pointer"].isFiring = impl_laser_pointer_isFiring
    local function impl_laser_pointer_getPower() return 0 end
    ---@return integer
    M.types["laser_pointer"].getPower = impl_laser_pointer_getPower
    local function impl_laser_pointer_getRange() return 0 end
    ---@return number
    M.types["laser_pointer"].getRange = impl_laser_pointer_getRange
    local function impl_laser_pointer_getColor() return 0 end
    ---@return integer
    M.types["laser_pointer"].getColor = impl_laser_pointer_getColor
    local function impl_laser_pointer_setColor(color) end
    ---@param color table
    M.types["laser_pointer"].setColor = impl_laser_pointer_setColor
    local function impl_laser_pointer_isRainbow() return false end
    ---@return boolean
    M.types["laser_pointer"].isRainbow = impl_laser_pointer_isRainbow
    local function impl_laser_pointer_setRainbow(rainbow) end
    ---@param rainbow table
    M.types["laser_pointer"].setRainbow = impl_laser_pointer_setRainbow
end

---@class avionics.LaserSensor
M.types["laser_sensor"] = {}
do
    local function impl_laser_sensor_getPower() return 0 end
    ---@return integer
    M.types["laser_sensor"].getPower = impl_laser_sensor_getPower
    local function impl_laser_sensor_getClosestHitDistance() return 0 end
    ---@return number
    M.types["laser_sensor"].getClosestHitDistance = impl_laser_sensor_getClosestHitDistance
end

---@class avionics.LinkedTypewriter
M.types["linked_typewriter"] = {}
do
end

---@class avionics.CreateMechanicalBearing
M.types["Create_MechanicalBearing"] = {}
do
    local function impl_Create_MechanicalBearing_getSelfId() return "" end
    ---@return string
    M.types["Create_MechanicalBearing"].getSelfId = impl_Create_MechanicalBearing_getSelfId
    local function impl_Create_MechanicalBearing_getSourceId() return "" end
    ---@return string
    M.types["Create_MechanicalBearing"].getSourceId = impl_Create_MechanicalBearing_getSourceId
    local function impl_Create_MechanicalBearing_getSubnetworkAnchorId() return "" end
    ---@return string
    M.types["Create_MechanicalBearing"].getSubnetworkAnchorId = impl_Create_MechanicalBearing_getSubnetworkAnchorId
    local function impl_Create_MechanicalBearing_getNetworkId() return "" end
    ---@return string
    M.types["Create_MechanicalBearing"].getNetworkId = impl_Create_MechanicalBearing_getNetworkId
    local function impl_Create_MechanicalBearing_getKind() return "" end
    ---@return string
    M.types["Create_MechanicalBearing"].getKind = impl_Create_MechanicalBearing_getKind
    local function impl_Create_MechanicalBearing_getSpeed() return 0 end
    ---@return number
    M.types["Create_MechanicalBearing"].getSpeed = impl_Create_MechanicalBearing_getSpeed
    local function impl_Create_MechanicalBearing_hasSource() return false end
    ---@return boolean
    M.types["Create_MechanicalBearing"].hasSource = impl_Create_MechanicalBearing_hasSource
    local function impl_Create_MechanicalBearing_isOverstressed() return false end
    ---@return boolean
    M.types["Create_MechanicalBearing"].isOverstressed = impl_Create_MechanicalBearing_isOverstressed
    local function impl_Create_MechanicalBearing_getStressImpact() return 0 end
    ---@return number
    M.types["Create_MechanicalBearing"].getStressImpact = impl_Create_MechanicalBearing_getStressImpact
    local function impl_Create_MechanicalBearing_getStressContribution() return 0 end
    ---@return number
    M.types["Create_MechanicalBearing"].getStressContribution = impl_Create_MechanicalBearing_getStressContribution
    local function impl_Create_MechanicalBearing_getContraption() return nil end
    ---@return any
    M.types["Create_MechanicalBearing"].getContraption = impl_Create_MechanicalBearing_getContraption
    local function impl_Create_MechanicalBearing_size() return 0 end
    ---@return integer
    M.types["Create_MechanicalBearing"].size = impl_Create_MechanicalBearing_size
    local function impl_Create_MechanicalBearing_getItemLimit(slot) return 0 end
    ---@param slot table
    ---@return integer
    M.types["Create_MechanicalBearing"].getItemLimit = impl_Create_MechanicalBearing_getItemLimit
    local function impl_Create_MechanicalBearing_isAssembled() return false end
    ---@return boolean
    M.types["Create_MechanicalBearing"].isAssembled = impl_Create_MechanicalBearing_isAssembled
    local function impl_Create_MechanicalBearing_assemble() end
    M.types["Create_MechanicalBearing"].assemble = impl_Create_MechanicalBearing_assemble
    local function impl_Create_MechanicalBearing_disassemble() end
    M.types["Create_MechanicalBearing"].disassemble = impl_Create_MechanicalBearing_disassemble
    local function impl_Create_MechanicalBearing_getAngle() return 0 end
    ---@return number
    M.types["Create_MechanicalBearing"].getAngle = impl_Create_MechanicalBearing_getAngle
    local function impl_Create_MechanicalBearing_getAngleRad() return 0 end
    ---@return number
    M.types["Create_MechanicalBearing"].getAngleRad = impl_Create_MechanicalBearing_getAngleRad
    local function impl_Create_MechanicalBearing_getAngularSpeed() return 0 end
    ---@return number
    M.types["Create_MechanicalBearing"].getAngularSpeed = impl_Create_MechanicalBearing_getAngularSpeed
    local function impl_Create_MechanicalBearing_isNearInitialAngle() return false end
    ---@return boolean
    M.types["Create_MechanicalBearing"].isNearInitialAngle = impl_Create_MechanicalBearing_isNearInitialAngle
    local function impl_Create_MechanicalBearing_getRotationMode() return "" end
    ---@return string
    M.types["Create_MechanicalBearing"].getRotationMode = impl_Create_MechanicalBearing_getRotationMode
    local function impl_Create_MechanicalBearing_setRotationMode(mode) end
    ---@param mode table
    M.types["Create_MechanicalBearing"].setRotationMode = impl_Create_MechanicalBearing_setRotationMode
    local function impl_Create_MechanicalBearing_isWoodenTop() return false end
    ---@return boolean
    M.types["Create_MechanicalBearing"].isWoodenTop = impl_Create_MechanicalBearing_isWoodenTop
    local function impl_Create_MechanicalBearing_getLastAssemblyError() return "" end
    ---@return string
    M.types["Create_MechanicalBearing"].getLastAssemblyError = impl_Create_MechanicalBearing_getLastAssemblyError
end

---@class avionics.CreateMechanicalPiston
M.types["Create_MechanicalPiston"] = {}
do
    local function impl_Create_MechanicalPiston_getSelfId() return "" end
    ---@return string
    M.types["Create_MechanicalPiston"].getSelfId = impl_Create_MechanicalPiston_getSelfId
    local function impl_Create_MechanicalPiston_getSourceId() return "" end
    ---@return string
    M.types["Create_MechanicalPiston"].getSourceId = impl_Create_MechanicalPiston_getSourceId
    local function impl_Create_MechanicalPiston_getSubnetworkAnchorId() return "" end
    ---@return string
    M.types["Create_MechanicalPiston"].getSubnetworkAnchorId = impl_Create_MechanicalPiston_getSubnetworkAnchorId
    local function impl_Create_MechanicalPiston_getNetworkId() return "" end
    ---@return string
    M.types["Create_MechanicalPiston"].getNetworkId = impl_Create_MechanicalPiston_getNetworkId
    local function impl_Create_MechanicalPiston_getKind() return "" end
    ---@return string
    M.types["Create_MechanicalPiston"].getKind = impl_Create_MechanicalPiston_getKind
    local function impl_Create_MechanicalPiston_getSpeed() return 0 end
    ---@return number
    M.types["Create_MechanicalPiston"].getSpeed = impl_Create_MechanicalPiston_getSpeed
    local function impl_Create_MechanicalPiston_hasSource() return false end
    ---@return boolean
    M.types["Create_MechanicalPiston"].hasSource = impl_Create_MechanicalPiston_hasSource
    local function impl_Create_MechanicalPiston_isOverstressed() return false end
    ---@return boolean
    M.types["Create_MechanicalPiston"].isOverstressed = impl_Create_MechanicalPiston_isOverstressed
    local function impl_Create_MechanicalPiston_getStressImpact() return 0 end
    ---@return number
    M.types["Create_MechanicalPiston"].getStressImpact = impl_Create_MechanicalPiston_getStressImpact
    local function impl_Create_MechanicalPiston_getStressContribution() return 0 end
    ---@return number
    M.types["Create_MechanicalPiston"].getStressContribution = impl_Create_MechanicalPiston_getStressContribution
    local function impl_Create_MechanicalPiston_getContraption() return nil end
    ---@return any
    M.types["Create_MechanicalPiston"].getContraption = impl_Create_MechanicalPiston_getContraption
    local function impl_Create_MechanicalPiston_size() return 0 end
    ---@return integer
    M.types["Create_MechanicalPiston"].size = impl_Create_MechanicalPiston_size
    local function impl_Create_MechanicalPiston_getItemLimit(slot) return 0 end
    ---@param slot table
    ---@return integer
    M.types["Create_MechanicalPiston"].getItemLimit = impl_Create_MechanicalPiston_getItemLimit
    local function impl_Create_MechanicalPiston_isAssembled() return false end
    ---@return boolean
    M.types["Create_MechanicalPiston"].isAssembled = impl_Create_MechanicalPiston_isAssembled
    local function impl_Create_MechanicalPiston_assemble() end
    M.types["Create_MechanicalPiston"].assemble = impl_Create_MechanicalPiston_assemble
    local function impl_Create_MechanicalPiston_disassemble() end
    M.types["Create_MechanicalPiston"].disassemble = impl_Create_MechanicalPiston_disassemble
    local function impl_Create_MechanicalPiston_getOffset() return 0 end
    ---@return number
    M.types["Create_MechanicalPiston"].getOffset = impl_Create_MechanicalPiston_getOffset
    local function impl_Create_MechanicalPiston_getMovementSpeed() return 0 end
    ---@return number
    M.types["Create_MechanicalPiston"].getMovementSpeed = impl_Create_MechanicalPiston_getMovementSpeed
    local function impl_Create_MechanicalPiston_getMotionVector() return {} end
    ---@return table
    M.types["Create_MechanicalPiston"].getMotionVector = impl_Create_MechanicalPiston_getMotionVector
    local function impl_Create_MechanicalPiston_getState() return "" end
    ---@return string
    M.types["Create_MechanicalPiston"].getState = impl_Create_MechanicalPiston_getState
    local function impl_Create_MechanicalPiston_isSticky() return false end
    ---@return boolean
    M.types["Create_MechanicalPiston"].isSticky = impl_Create_MechanicalPiston_isSticky
    local function impl_Create_MechanicalPiston_getMovementMode() return "" end
    ---@return string
    M.types["Create_MechanicalPiston"].getMovementMode = impl_Create_MechanicalPiston_getMovementMode
    local function impl_Create_MechanicalPiston_setMovementMode(mode) end
    ---@param mode table
    M.types["Create_MechanicalPiston"].setMovementMode = impl_Create_MechanicalPiston_setMovementMode
    local function impl_Create_MechanicalPiston_getLastAssemblyError() return "" end
    ---@return string
    M.types["Create_MechanicalPiston"].getLastAssemblyError = impl_Create_MechanicalPiston_getLastAssemblyError
end

---@class avionics.MountedPotatoCannon
M.types["mounted_potato_cannon"] = {}
do
    local function impl_mounted_potato_cannon_getSelfId() return "" end
    ---@return string
    M.types["mounted_potato_cannon"].getSelfId = impl_mounted_potato_cannon_getSelfId
    local function impl_mounted_potato_cannon_getSourceId() return "" end
    ---@return string
    M.types["mounted_potato_cannon"].getSourceId = impl_mounted_potato_cannon_getSourceId
    local function impl_mounted_potato_cannon_getSubnetworkAnchorId() return "" end
    ---@return string
    M.types["mounted_potato_cannon"].getSubnetworkAnchorId = impl_mounted_potato_cannon_getSubnetworkAnchorId
    local function impl_mounted_potato_cannon_getNetworkId() return "" end
    ---@return string
    M.types["mounted_potato_cannon"].getNetworkId = impl_mounted_potato_cannon_getNetworkId
    local function impl_mounted_potato_cannon_getKind() return "" end
    ---@return string
    M.types["mounted_potato_cannon"].getKind = impl_mounted_potato_cannon_getKind
    local function impl_mounted_potato_cannon_getSpeed() return 0 end
    ---@return number
    M.types["mounted_potato_cannon"].getSpeed = impl_mounted_potato_cannon_getSpeed
    local function impl_mounted_potato_cannon_hasSource() return false end
    ---@return boolean
    M.types["mounted_potato_cannon"].hasSource = impl_mounted_potato_cannon_hasSource
    local function impl_mounted_potato_cannon_isOverstressed() return false end
    ---@return boolean
    M.types["mounted_potato_cannon"].isOverstressed = impl_mounted_potato_cannon_isOverstressed
    local function impl_mounted_potato_cannon_getStressImpact() return 0 end
    ---@return number
    M.types["mounted_potato_cannon"].getStressImpact = impl_mounted_potato_cannon_getStressImpact
    local function impl_mounted_potato_cannon_getStressContribution() return 0 end
    ---@return number
    M.types["mounted_potato_cannon"].getStressContribution = impl_mounted_potato_cannon_getStressContribution
    local function impl_mounted_potato_cannon_getAimingVector() return {} end
    ---@return table
    M.types["mounted_potato_cannon"].getAimingVector = impl_mounted_potato_cannon_getAimingVector
    local function impl_mounted_potato_cannon_getBarrelPos() return {} end
    ---@return table
    M.types["mounted_potato_cannon"].getBarrelPos = impl_mounted_potato_cannon_getBarrelPos
    local function impl_mounted_potato_cannon_getCogwheelSpeed() return 0 end
    ---@return number
    M.types["mounted_potato_cannon"].getCogwheelSpeed = impl_mounted_potato_cannon_getCogwheelSpeed
    local function impl_mounted_potato_cannon_isBlocked() return false end
    ---@return boolean
    M.types["mounted_potato_cannon"].isBlocked = impl_mounted_potato_cannon_isBlocked
    local function impl_mounted_potato_cannon_getBlockedLength() return 0 end
    ---@return number
    M.types["mounted_potato_cannon"].getBlockedLength = impl_mounted_potato_cannon_getBlockedLength
    local function impl_mounted_potato_cannon_hasAmmo() return false end
    ---@return boolean
    M.types["mounted_potato_cannon"].hasAmmo = impl_mounted_potato_cannon_hasAmmo
    local function impl_mounted_potato_cannon_getAmmoCount() return 0 end
    ---@return integer
    M.types["mounted_potato_cannon"].getAmmoCount = impl_mounted_potato_cannon_getAmmoCount
    local function impl_mounted_potato_cannon_getAmmoType() return "" end
    ---@return string
    M.types["mounted_potato_cannon"].getAmmoType = impl_mounted_potato_cannon_getAmmoType
end

---@class avionics.NavigationTable
M.types["navigation_table"] = {}
do
    local function impl_navigation_table_hasTarget() return false end
    ---@return boolean
    M.types["navigation_table"].hasTarget = impl_navigation_table_hasTarget
    local function impl_navigation_table_getTargetType() return "" end
    ---@return string
    M.types["navigation_table"].getTargetType = impl_navigation_table_getTargetType
    local function impl_navigation_table_getRelativeAngle() return 0 end
    ---@return number
    M.types["navigation_table"].getRelativeAngle = impl_navigation_table_getRelativeAngle
    local function impl_navigation_table_getRelativeAngleRad() return 0 end
    ---@return number
    M.types["navigation_table"].getRelativeAngleRad = impl_navigation_table_getRelativeAngleRad
    local function impl_navigation_table_getBearing() return 0 end
    ---@return number
    M.types["navigation_table"].getBearing = impl_navigation_table_getBearing
    local function impl_navigation_table_getBearingRad() return 0 end
    ---@return number
    M.types["navigation_table"].getBearingRad = impl_navigation_table_getBearingRad
    local function impl_navigation_table_getDistanceToTarget() return 0 end
    ---@return number
    M.types["navigation_table"].getDistanceToTarget = impl_navigation_table_getDistanceToTarget
    local function impl_navigation_table_getClosureRate() return 0 end
    ---@return number
    M.types["navigation_table"].getClosureRate = impl_navigation_table_getClosureRate
    local function impl_navigation_table_getVerticalOffsetToTarget() return 0 end
    ---@return number
    M.types["navigation_table"].getVerticalOffsetToTarget = impl_navigation_table_getVerticalOffsetToTarget
    local function impl_navigation_table_getOrientation() return {} end
    ---@return table
    M.types["navigation_table"].getOrientation = impl_navigation_table_getOrientation
    local function impl_navigation_table_getHeading() return 0 end
    ---@return number
    M.types["navigation_table"].getHeading = impl_navigation_table_getHeading
    local function impl_navigation_table_getHeadingRad() return 0 end
    ---@return number
    M.types["navigation_table"].getHeadingRad = impl_navigation_table_getHeadingRad
end

---@class avionics.PhysicsAssembler
M.types["physics_assembler"] = {}
do
    local function impl_physics_assembler_isAssembled() return false end
    ---@return boolean
    M.types["physics_assembler"].isAssembled = impl_physics_assembler_isAssembled
    local function impl_physics_assembler_getMass() return 0 end
    ---@return number
    M.types["physics_assembler"].getMass = impl_physics_assembler_getMass
    local function impl_physics_assembler_getCenterOfMass() return {} end
    ---@return table
    M.types["physics_assembler"].getCenterOfMass = impl_physics_assembler_getCenterOfMass
    local function impl_physics_assembler_getInertiaTensor() return {} end
    ---@return table
    M.types["physics_assembler"].getInertiaTensor = impl_physics_assembler_getInertiaTensor
    local function impl_physics_assembler_getSubLevelId() return "" end
    ---@return string
    M.types["physics_assembler"].getSubLevelId = impl_physics_assembler_getSubLevelId
    local function impl_physics_assembler_getSubLevelName() return "" end
    ---@return string
    M.types["physics_assembler"].getSubLevelName = impl_physics_assembler_getSubLevelName
end

---@class avionics.PortableEngine
M.types["portable_engine"] = {}
do
    local function impl_portable_engine_getSelfId() return "" end
    ---@return string
    M.types["portable_engine"].getSelfId = impl_portable_engine_getSelfId
    local function impl_portable_engine_getSourceId() return "" end
    ---@return string
    M.types["portable_engine"].getSourceId = impl_portable_engine_getSourceId
    local function impl_portable_engine_getSubnetworkAnchorId() return "" end
    ---@return string
    M.types["portable_engine"].getSubnetworkAnchorId = impl_portable_engine_getSubnetworkAnchorId
    local function impl_portable_engine_getNetworkId() return "" end
    ---@return string
    M.types["portable_engine"].getNetworkId = impl_portable_engine_getNetworkId
    local function impl_portable_engine_getKind() return "" end
    ---@return string
    M.types["portable_engine"].getKind = impl_portable_engine_getKind
    local function impl_portable_engine_getSpeed() return 0 end
    ---@return number
    M.types["portable_engine"].getSpeed = impl_portable_engine_getSpeed
    local function impl_portable_engine_hasSource() return false end
    ---@return boolean
    M.types["portable_engine"].hasSource = impl_portable_engine_hasSource
    local function impl_portable_engine_isOverstressed() return false end
    ---@return boolean
    M.types["portable_engine"].isOverstressed = impl_portable_engine_isOverstressed
    local function impl_portable_engine_getStressImpact() return 0 end
    ---@return number
    M.types["portable_engine"].getStressImpact = impl_portable_engine_getStressImpact
    local function impl_portable_engine_getStressContribution() return 0 end
    ---@return number
    M.types["portable_engine"].getStressContribution = impl_portable_engine_getStressContribution
    local function impl_portable_engine_getBurnTime() return 0 end
    ---@return integer
    M.types["portable_engine"].getBurnTime = impl_portable_engine_getBurnTime
    local function impl_portable_engine_getTotalBurnTime() return 0 end
    ---@return integer
    M.types["portable_engine"].getTotalBurnTime = impl_portable_engine_getTotalBurnTime
    local function impl_portable_engine_isSuperHeated() return false end
    ---@return boolean
    M.types["portable_engine"].isSuperHeated = impl_portable_engine_isSuperHeated
    local function impl_portable_engine_isCurrentFuelInfinite() return false end
    ---@return boolean
    M.types["portable_engine"].isCurrentFuelInfinite = impl_portable_engine_isCurrentFuelInfinite
    local function impl_portable_engine_isTotalFuelInfinite() return false end
    ---@return boolean
    M.types["portable_engine"].isTotalFuelInfinite = impl_portable_engine_isTotalFuelInfinite
    local function impl_portable_engine_isLit() return false end
    ---@return boolean
    M.types["portable_engine"].isLit = impl_portable_engine_isLit
    local function impl_portable_engine_getGeneratedSpeed() return 0 end
    ---@return number
    M.types["portable_engine"].getGeneratedSpeed = impl_portable_engine_getGeneratedSpeed
end

---@class avionics.PropellerBearing
M.types["propeller_bearing"] = {}
do
    local function impl_propeller_bearing_getSelfId() return "" end
    ---@return string
    M.types["propeller_bearing"].getSelfId = impl_propeller_bearing_getSelfId
    local function impl_propeller_bearing_getSourceId() return "" end
    ---@return string
    M.types["propeller_bearing"].getSourceId = impl_propeller_bearing_getSourceId
    local function impl_propeller_bearing_getSubnetworkAnchorId() return "" end
    ---@return string
    M.types["propeller_bearing"].getSubnetworkAnchorId = impl_propeller_bearing_getSubnetworkAnchorId
    local function impl_propeller_bearing_getNetworkId() return "" end
    ---@return string
    M.types["propeller_bearing"].getNetworkId = impl_propeller_bearing_getNetworkId
    local function impl_propeller_bearing_getKind() return "" end
    ---@return string
    M.types["propeller_bearing"].getKind = impl_propeller_bearing_getKind
    local function impl_propeller_bearing_getSpeed() return 0 end
    ---@return number
    M.types["propeller_bearing"].getSpeed = impl_propeller_bearing_getSpeed
    local function impl_propeller_bearing_hasSource() return false end
    ---@return boolean
    M.types["propeller_bearing"].hasSource = impl_propeller_bearing_hasSource
    local function impl_propeller_bearing_isOverstressed() return false end
    ---@return boolean
    M.types["propeller_bearing"].isOverstressed = impl_propeller_bearing_isOverstressed
    local function impl_propeller_bearing_getStressImpact() return 0 end
    ---@return number
    M.types["propeller_bearing"].getStressImpact = impl_propeller_bearing_getStressImpact
    local function impl_propeller_bearing_getStressContribution() return 0 end
    ---@return number
    M.types["propeller_bearing"].getStressContribution = impl_propeller_bearing_getStressContribution
    local function impl_propeller_bearing_getAxis() return "" end
    ---@return string
    M.types["propeller_bearing"].getAxis = impl_propeller_bearing_getAxis
    local function impl_propeller_bearing_getThrustVector() return {} end
    ---@return table
    M.types["propeller_bearing"].getThrustVector = impl_propeller_bearing_getThrustVector
    local function impl_propeller_bearing_getFacingVector() return {} end
    ---@return table
    M.types["propeller_bearing"].getFacingVector = impl_propeller_bearing_getFacingVector
    local function impl_propeller_bearing_getRotationSpeed() return 0 end
    ---@return number
    M.types["propeller_bearing"].getRotationSpeed = impl_propeller_bearing_getRotationSpeed
    local function impl_propeller_bearing_getAngularSpeed() return 0 end
    ---@return number
    M.types["propeller_bearing"].getAngularSpeed = impl_propeller_bearing_getAngularSpeed
    local function impl_propeller_bearing_getAngle() return 0 end
    ---@return number
    M.types["propeller_bearing"].getAngle = impl_propeller_bearing_getAngle
    local function impl_propeller_bearing_getThrust() return 0 end
    ---@return number
    M.types["propeller_bearing"].getThrust = impl_propeller_bearing_getThrust
    local function impl_propeller_bearing_getAirflow() return 0 end
    ---@return number
    M.types["propeller_bearing"].getAirflow = impl_propeller_bearing_getAirflow
    local function impl_propeller_bearing_getSailPower() return 0 end
    ---@return number
    M.types["propeller_bearing"].getSailPower = impl_propeller_bearing_getSailPower
    local function impl_propeller_bearing_isActive() return false end
    ---@return boolean
    M.types["propeller_bearing"].isActive = impl_propeller_bearing_isActive
    local function impl_propeller_bearing_getThrustHandedness() return "" end
    ---@return string
    M.types["propeller_bearing"].getThrustHandedness = impl_propeller_bearing_getThrustHandedness
    local function impl_propeller_bearing_setThrustHandedness(handedness) end
    ---@param handedness table
    M.types["propeller_bearing"].setThrustHandedness = impl_propeller_bearing_setThrustHandedness
    local function impl_propeller_bearing_isAssembled() return false end
    ---@return boolean
    M.types["propeller_bearing"].isAssembled = impl_propeller_bearing_isAssembled
    local function impl_propeller_bearing_assemble() end
    M.types["propeller_bearing"].assemble = impl_propeller_bearing_assemble
    local function impl_propeller_bearing_disassemble() end
    M.types["propeller_bearing"].disassemble = impl_propeller_bearing_disassemble
    local function impl_propeller_bearing_isWoodenTop() return false end
    ---@return boolean
    M.types["propeller_bearing"].isWoodenTop = impl_propeller_bearing_isWoodenTop
end

---@class avionics.Propeller
M.types["propeller"] = {}
do
    local function impl_propeller_getSelfId() return "" end
    ---@return string
    M.types["propeller"].getSelfId = impl_propeller_getSelfId
    local function impl_propeller_getSourceId() return "" end
    ---@return string
    M.types["propeller"].getSourceId = impl_propeller_getSourceId
    local function impl_propeller_getSubnetworkAnchorId() return "" end
    ---@return string
    M.types["propeller"].getSubnetworkAnchorId = impl_propeller_getSubnetworkAnchorId
    local function impl_propeller_getNetworkId() return "" end
    ---@return string
    M.types["propeller"].getNetworkId = impl_propeller_getNetworkId
    local function impl_propeller_getKind() return "" end
    ---@return string
    M.types["propeller"].getKind = impl_propeller_getKind
    local function impl_propeller_getSpeed() return 0 end
    ---@return number
    M.types["propeller"].getSpeed = impl_propeller_getSpeed
    local function impl_propeller_hasSource() return false end
    ---@return boolean
    M.types["propeller"].hasSource = impl_propeller_hasSource
    local function impl_propeller_isOverstressed() return false end
    ---@return boolean
    M.types["propeller"].isOverstressed = impl_propeller_isOverstressed
    local function impl_propeller_getStressImpact() return 0 end
    ---@return number
    M.types["propeller"].getStressImpact = impl_propeller_getStressImpact
    local function impl_propeller_getStressContribution() return 0 end
    ---@return number
    M.types["propeller"].getStressContribution = impl_propeller_getStressContribution
    local function impl_propeller_getAxis() return "" end
    ---@return string
    M.types["propeller"].getAxis = impl_propeller_getAxis
    local function impl_propeller_getRotationSpeed() return 0 end
    ---@return number
    M.types["propeller"].getRotationSpeed = impl_propeller_getRotationSpeed
    local function impl_propeller_getThrust() return 0 end
    ---@return number
    M.types["propeller"].getThrust = impl_propeller_getThrust
    local function impl_propeller_getAirflow() return 0 end
    ---@return number
    M.types["propeller"].getAirflow = impl_propeller_getAirflow
    local function impl_propeller_isActive() return false end
    ---@return boolean
    M.types["propeller"].isActive = impl_propeller_isActive
end

---@class avionics.CreateRopePulley
M.types["Create_RopePulley"] = {}
do
    local function impl_Create_RopePulley_getSelfId() return "" end
    ---@return string
    M.types["Create_RopePulley"].getSelfId = impl_Create_RopePulley_getSelfId
    local function impl_Create_RopePulley_getSourceId() return "" end
    ---@return string
    M.types["Create_RopePulley"].getSourceId = impl_Create_RopePulley_getSourceId
    local function impl_Create_RopePulley_getSubnetworkAnchorId() return "" end
    ---@return string
    M.types["Create_RopePulley"].getSubnetworkAnchorId = impl_Create_RopePulley_getSubnetworkAnchorId
    local function impl_Create_RopePulley_getNetworkId() return "" end
    ---@return string
    M.types["Create_RopePulley"].getNetworkId = impl_Create_RopePulley_getNetworkId
    local function impl_Create_RopePulley_getKind() return "" end
    ---@return string
    M.types["Create_RopePulley"].getKind = impl_Create_RopePulley_getKind
    local function impl_Create_RopePulley_getSpeed() return 0 end
    ---@return number
    M.types["Create_RopePulley"].getSpeed = impl_Create_RopePulley_getSpeed
    local function impl_Create_RopePulley_hasSource() return false end
    ---@return boolean
    M.types["Create_RopePulley"].hasSource = impl_Create_RopePulley_hasSource
    local function impl_Create_RopePulley_isOverstressed() return false end
    ---@return boolean
    M.types["Create_RopePulley"].isOverstressed = impl_Create_RopePulley_isOverstressed
    local function impl_Create_RopePulley_getStressImpact() return 0 end
    ---@return number
    M.types["Create_RopePulley"].getStressImpact = impl_Create_RopePulley_getStressImpact
    local function impl_Create_RopePulley_getStressContribution() return 0 end
    ---@return number
    M.types["Create_RopePulley"].getStressContribution = impl_Create_RopePulley_getStressContribution
    local function impl_Create_RopePulley_getContraption() return nil end
    ---@return any
    M.types["Create_RopePulley"].getContraption = impl_Create_RopePulley_getContraption
    local function impl_Create_RopePulley_size() return 0 end
    ---@return integer
    M.types["Create_RopePulley"].size = impl_Create_RopePulley_size
    local function impl_Create_RopePulley_getItemLimit(slot) return 0 end
    ---@param slot table
    ---@return integer
    M.types["Create_RopePulley"].getItemLimit = impl_Create_RopePulley_getItemLimit
    local function impl_Create_RopePulley_isAssembled() return false end
    ---@return boolean
    M.types["Create_RopePulley"].isAssembled = impl_Create_RopePulley_isAssembled
    local function impl_Create_RopePulley_assemble() end
    M.types["Create_RopePulley"].assemble = impl_Create_RopePulley_assemble
    local function impl_Create_RopePulley_disassemble() end
    M.types["Create_RopePulley"].disassemble = impl_Create_RopePulley_disassemble
    local function impl_Create_RopePulley_getOffset() return 0 end
    ---@return number
    M.types["Create_RopePulley"].getOffset = impl_Create_RopePulley_getOffset
    local function impl_Create_RopePulley_getMaxLength() return 0 end
    ---@return integer
    M.types["Create_RopePulley"].getMaxLength = impl_Create_RopePulley_getMaxLength
    local function impl_Create_RopePulley_getMovementSpeed() return 0 end
    ---@return number
    M.types["Create_RopePulley"].getMovementSpeed = impl_Create_RopePulley_getMovementSpeed
    local function impl_Create_RopePulley_getMotionVector() return {} end
    ---@return table
    M.types["Create_RopePulley"].getMotionVector = impl_Create_RopePulley_getMotionVector
    local function impl_Create_RopePulley_getCurrentY() return 0 end
    ---@return integer
    M.types["Create_RopePulley"].getCurrentY = impl_Create_RopePulley_getCurrentY
    local function impl_Create_RopePulley_getMovementMode() return "" end
    ---@return string
    M.types["Create_RopePulley"].getMovementMode = impl_Create_RopePulley_getMovementMode
    local function impl_Create_RopePulley_setMovementMode(mode) end
    ---@param mode table
    M.types["Create_RopePulley"].setMovementMode = impl_Create_RopePulley_setMovementMode
    local function impl_Create_RopePulley_isMirrorChild() return false end
    ---@return boolean
    M.types["Create_RopePulley"].isMirrorChild = impl_Create_RopePulley_isMirrorChild
    local function impl_Create_RopePulley_getMirrorParentId() return "" end
    ---@return string
    M.types["Create_RopePulley"].getMirrorParentId = impl_Create_RopePulley_getMirrorParentId
    local function impl_Create_RopePulley_getLastAssemblyError() return "" end
    ---@return string
    M.types["Create_RopePulley"].getLastAssemblyError = impl_Create_RopePulley_getLastAssemblyError
end

---@class avionics.RopeWinch
M.types["rope_winch"] = {}
do
    local function impl_rope_winch_getSelfId() return "" end
    ---@return string
    M.types["rope_winch"].getSelfId = impl_rope_winch_getSelfId
    local function impl_rope_winch_getSourceId() return "" end
    ---@return string
    M.types["rope_winch"].getSourceId = impl_rope_winch_getSourceId
    local function impl_rope_winch_getSubnetworkAnchorId() return "" end
    ---@return string
    M.types["rope_winch"].getSubnetworkAnchorId = impl_rope_winch_getSubnetworkAnchorId
    local function impl_rope_winch_getNetworkId() return "" end
    ---@return string
    M.types["rope_winch"].getNetworkId = impl_rope_winch_getNetworkId
    local function impl_rope_winch_getKind() return "" end
    ---@return string
    M.types["rope_winch"].getKind = impl_rope_winch_getKind
    local function impl_rope_winch_getSpeed() return 0 end
    ---@return number
    M.types["rope_winch"].getSpeed = impl_rope_winch_getSpeed
    local function impl_rope_winch_hasSource() return false end
    ---@return boolean
    M.types["rope_winch"].hasSource = impl_rope_winch_hasSource
    local function impl_rope_winch_isOverstressed() return false end
    ---@return boolean
    M.types["rope_winch"].isOverstressed = impl_rope_winch_isOverstressed
    local function impl_rope_winch_getStressImpact() return 0 end
    ---@return number
    M.types["rope_winch"].getStressImpact = impl_rope_winch_getStressImpact
    local function impl_rope_winch_getStressContribution() return 0 end
    ---@return number
    M.types["rope_winch"].getStressContribution = impl_rope_winch_getStressContribution
    local function impl_rope_winch_getLength() return 0 end
    ---@return integer
    M.types["rope_winch"].getLength = impl_rope_winch_getLength
    local function impl_rope_winch_getMaxLength() return 0 end
    ---@return integer
    M.types["rope_winch"].getMaxLength = impl_rope_winch_getMaxLength
    local function impl_rope_winch_getMinLength() return 0 end
    ---@return integer
    M.types["rope_winch"].getMinLength = impl_rope_winch_getMinLength
    local function impl_rope_winch_getMovementSpeed() return 0 end
    ---@return number
    M.types["rope_winch"].getMovementSpeed = impl_rope_winch_getMovementSpeed
end

---@class avionics.CreateRotationSpeedController
M.types["Create_RotationSpeedController"] = {}
do
    local function impl_Create_RotationSpeedController_getSelfId() return "" end
    ---@return string
    M.types["Create_RotationSpeedController"].getSelfId = impl_Create_RotationSpeedController_getSelfId
    local function impl_Create_RotationSpeedController_getSourceId() return "" end
    ---@return string
    M.types["Create_RotationSpeedController"].getSourceId = impl_Create_RotationSpeedController_getSourceId
    local function impl_Create_RotationSpeedController_getSubnetworkAnchorId() return "" end
    ---@return string
    M.types["Create_RotationSpeedController"].getSubnetworkAnchorId = impl_Create_RotationSpeedController_getSubnetworkAnchorId
    local function impl_Create_RotationSpeedController_getNetworkId() return "" end
    ---@return string
    M.types["Create_RotationSpeedController"].getNetworkId = impl_Create_RotationSpeedController_getNetworkId
    local function impl_Create_RotationSpeedController_getKind() return "" end
    ---@return string
    M.types["Create_RotationSpeedController"].getKind = impl_Create_RotationSpeedController_getKind
    local function impl_Create_RotationSpeedController_getSpeed() return 0 end
    ---@return number
    M.types["Create_RotationSpeedController"].getSpeed = impl_Create_RotationSpeedController_getSpeed
    local function impl_Create_RotationSpeedController_hasSource() return false end
    ---@return boolean
    M.types["Create_RotationSpeedController"].hasSource = impl_Create_RotationSpeedController_hasSource
    local function impl_Create_RotationSpeedController_isOverstressed() return false end
    ---@return boolean
    M.types["Create_RotationSpeedController"].isOverstressed = impl_Create_RotationSpeedController_isOverstressed
    local function impl_Create_RotationSpeedController_getStressImpact() return 0 end
    ---@return number
    M.types["Create_RotationSpeedController"].getStressImpact = impl_Create_RotationSpeedController_getStressImpact
    local function impl_Create_RotationSpeedController_getStressContribution() return 0 end
    ---@return number
    M.types["Create_RotationSpeedController"].getStressContribution = impl_Create_RotationSpeedController_getStressContribution
    local function impl_Create_RotationSpeedController_setTargetSpeed(speed) end
    ---@param speed integer
    M.types["Create_RotationSpeedController"].setTargetSpeed = impl_Create_RotationSpeedController_setTargetSpeed
    local function impl_Create_RotationSpeedController_getTargetSpeed() return 0 end
    ---@return number
    M.types["Create_RotationSpeedController"].getTargetSpeed = impl_Create_RotationSpeedController_getTargetSpeed
end

---@class avionics.CreateSpeedometer
M.types["Create_Speedometer"] = {}
do
    local function impl_Create_Speedometer_getSelfId() return "" end
    ---@return string
    M.types["Create_Speedometer"].getSelfId = impl_Create_Speedometer_getSelfId
    local function impl_Create_Speedometer_getSourceId() return "" end
    ---@return string
    M.types["Create_Speedometer"].getSourceId = impl_Create_Speedometer_getSourceId
    local function impl_Create_Speedometer_getSubnetworkAnchorId() return "" end
    ---@return string
    M.types["Create_Speedometer"].getSubnetworkAnchorId = impl_Create_Speedometer_getSubnetworkAnchorId
    local function impl_Create_Speedometer_getNetworkId() return "" end
    ---@return string
    M.types["Create_Speedometer"].getNetworkId = impl_Create_Speedometer_getNetworkId
    local function impl_Create_Speedometer_getKind() return "" end
    ---@return string
    M.types["Create_Speedometer"].getKind = impl_Create_Speedometer_getKind
    local function impl_Create_Speedometer_getSpeed() return 0 end
    ---@return number
    M.types["Create_Speedometer"].getSpeed = impl_Create_Speedometer_getSpeed
    local function impl_Create_Speedometer_hasSource() return false end
    ---@return boolean
    M.types["Create_Speedometer"].hasSource = impl_Create_Speedometer_hasSource
    local function impl_Create_Speedometer_isOverstressed() return false end
    ---@return boolean
    M.types["Create_Speedometer"].isOverstressed = impl_Create_Speedometer_isOverstressed
    local function impl_Create_Speedometer_getStressImpact() return 0 end
    ---@return number
    M.types["Create_Speedometer"].getStressImpact = impl_Create_Speedometer_getStressImpact
    local function impl_Create_Speedometer_getStressContribution() return 0 end
    ---@return number
    M.types["Create_Speedometer"].getStressContribution = impl_Create_Speedometer_getStressContribution
end

---@class avionics.SteeringWheel
M.types["steering_wheel"] = {}
do
    local function impl_steering_wheel_getSelfId() return "" end
    ---@return string
    M.types["steering_wheel"].getSelfId = impl_steering_wheel_getSelfId
    local function impl_steering_wheel_getSourceId() return "" end
    ---@return string
    M.types["steering_wheel"].getSourceId = impl_steering_wheel_getSourceId
    local function impl_steering_wheel_getSubnetworkAnchorId() return "" end
    ---@return string
    M.types["steering_wheel"].getSubnetworkAnchorId = impl_steering_wheel_getSubnetworkAnchorId
    local function impl_steering_wheel_getNetworkId() return "" end
    ---@return string
    M.types["steering_wheel"].getNetworkId = impl_steering_wheel_getNetworkId
    local function impl_steering_wheel_getKind() return "" end
    ---@return string
    M.types["steering_wheel"].getKind = impl_steering_wheel_getKind
    local function impl_steering_wheel_getSpeed() return 0 end
    ---@return number
    M.types["steering_wheel"].getSpeed = impl_steering_wheel_getSpeed
    local function impl_steering_wheel_hasSource() return false end
    ---@return boolean
    M.types["steering_wheel"].hasSource = impl_steering_wheel_hasSource
    local function impl_steering_wheel_isOverstressed() return false end
    ---@return boolean
    M.types["steering_wheel"].isOverstressed = impl_steering_wheel_isOverstressed
    local function impl_steering_wheel_getStressImpact() return 0 end
    ---@return number
    M.types["steering_wheel"].getStressImpact = impl_steering_wheel_getStressImpact
    local function impl_steering_wheel_getStressContribution() return 0 end
    ---@return number
    M.types["steering_wheel"].getStressContribution = impl_steering_wheel_getStressContribution
    local function impl_steering_wheel_isHeld() return false end
    ---@return boolean
    M.types["steering_wheel"].isHeld = impl_steering_wheel_isHeld
    local function impl_steering_wheel_getAngle() return 0 end
    ---@return number
    M.types["steering_wheel"].getAngle = impl_steering_wheel_getAngle
    local function impl_steering_wheel_getAngleRad() return 0 end
    ---@return number
    M.types["steering_wheel"].getAngleRad = impl_steering_wheel_getAngleRad
    local function impl_steering_wheel_getTargetAngle() return 0 end
    ---@return number
    M.types["steering_wheel"].getTargetAngle = impl_steering_wheel_getTargetAngle
    local function impl_steering_wheel_getTargetAngleRad() return 0 end
    ---@return number
    M.types["steering_wheel"].getTargetAngleRad = impl_steering_wheel_getTargetAngleRad
    local function impl_steering_wheel_getMaxAngle() return 0 end
    ---@return integer
    M.types["steering_wheel"].getMaxAngle = impl_steering_wheel_getMaxAngle
    local function impl_steering_wheel_getNormalizedAngle() return 0 end
    ---@return number
    M.types["steering_wheel"].getNormalizedAngle = impl_steering_wheel_getNormalizedAngle
end

---@class avionics.CreateStressometer
M.types["Create_Stressometer"] = {}
do
    local function impl_Create_Stressometer_getSelfId() return "" end
    ---@return string
    M.types["Create_Stressometer"].getSelfId = impl_Create_Stressometer_getSelfId
    local function impl_Create_Stressometer_getSourceId() return "" end
    ---@return string
    M.types["Create_Stressometer"].getSourceId = impl_Create_Stressometer_getSourceId
    local function impl_Create_Stressometer_getSubnetworkAnchorId() return "" end
    ---@return string
    M.types["Create_Stressometer"].getSubnetworkAnchorId = impl_Create_Stressometer_getSubnetworkAnchorId
    local function impl_Create_Stressometer_getNetworkId() return "" end
    ---@return string
    M.types["Create_Stressometer"].getNetworkId = impl_Create_Stressometer_getNetworkId
    local function impl_Create_Stressometer_getKind() return "" end
    ---@return string
    M.types["Create_Stressometer"].getKind = impl_Create_Stressometer_getKind
    local function impl_Create_Stressometer_getSpeed() return 0 end
    ---@return number
    M.types["Create_Stressometer"].getSpeed = impl_Create_Stressometer_getSpeed
    local function impl_Create_Stressometer_hasSource() return false end
    ---@return boolean
    M.types["Create_Stressometer"].hasSource = impl_Create_Stressometer_hasSource
    local function impl_Create_Stressometer_isOverstressed() return false end
    ---@return boolean
    M.types["Create_Stressometer"].isOverstressed = impl_Create_Stressometer_isOverstressed
    local function impl_Create_Stressometer_getStressImpact() return 0 end
    ---@return number
    M.types["Create_Stressometer"].getStressImpact = impl_Create_Stressometer_getStressImpact
    local function impl_Create_Stressometer_getStressContribution() return 0 end
    ---@return number
    M.types["Create_Stressometer"].getStressContribution = impl_Create_Stressometer_getStressContribution
    local function impl_Create_Stressometer_getStress() return 0 end
    ---@return number
    M.types["Create_Stressometer"].getStress = impl_Create_Stressometer_getStress
    local function impl_Create_Stressometer_getStressCapacity() return 0 end
    ---@return number
    M.types["Create_Stressometer"].getStressCapacity = impl_Create_Stressometer_getStressCapacity
end

---@class avionics.SwivelBearing
M.types["swivel_bearing"] = {}
do
    local function impl_swivel_bearing_getSelfId() return "" end
    ---@return string
    M.types["swivel_bearing"].getSelfId = impl_swivel_bearing_getSelfId
    local function impl_swivel_bearing_getSourceId() return "" end
    ---@return string
    M.types["swivel_bearing"].getSourceId = impl_swivel_bearing_getSourceId
    local function impl_swivel_bearing_getSubnetworkAnchorId() return "" end
    ---@return string
    M.types["swivel_bearing"].getSubnetworkAnchorId = impl_swivel_bearing_getSubnetworkAnchorId
    local function impl_swivel_bearing_getNetworkId() return "" end
    ---@return string
    M.types["swivel_bearing"].getNetworkId = impl_swivel_bearing_getNetworkId
    local function impl_swivel_bearing_getKind() return "" end
    ---@return string
    M.types["swivel_bearing"].getKind = impl_swivel_bearing_getKind
    local function impl_swivel_bearing_getSpeed() return 0 end
    ---@return number
    M.types["swivel_bearing"].getSpeed = impl_swivel_bearing_getSpeed
    local function impl_swivel_bearing_hasSource() return false end
    ---@return boolean
    M.types["swivel_bearing"].hasSource = impl_swivel_bearing_hasSource
    local function impl_swivel_bearing_isOverstressed() return false end
    ---@return boolean
    M.types["swivel_bearing"].isOverstressed = impl_swivel_bearing_isOverstressed
    local function impl_swivel_bearing_getStressImpact() return 0 end
    ---@return number
    M.types["swivel_bearing"].getStressImpact = impl_swivel_bearing_getStressImpact
    local function impl_swivel_bearing_getStressContribution() return 0 end
    ---@return number
    M.types["swivel_bearing"].getStressContribution = impl_swivel_bearing_getStressContribution
    local function impl_swivel_bearing_isAssembled() return false end
    ---@return boolean
    M.types["swivel_bearing"].isAssembled = impl_swivel_bearing_isAssembled
    local function impl_swivel_bearing_assemble() end
    M.types["swivel_bearing"].assemble = impl_swivel_bearing_assemble
    local function impl_swivel_bearing_disassemble() end
    M.types["swivel_bearing"].disassemble = impl_swivel_bearing_disassemble
    local function impl_swivel_bearing_getTargetAngle() return 0 end
    ---@return number
    M.types["swivel_bearing"].getTargetAngle = impl_swivel_bearing_getTargetAngle
    local function impl_swivel_bearing_getTargetAngleRad() return 0 end
    ---@return number
    M.types["swivel_bearing"].getTargetAngleRad = impl_swivel_bearing_getTargetAngleRad
    local function impl_swivel_bearing_getPlateId() return "" end
    ---@return string
    M.types["swivel_bearing"].getPlateId = impl_swivel_bearing_getPlateId
    local function impl_swivel_bearing_getSubLevelId() return "" end
    ---@return string
    M.types["swivel_bearing"].getSubLevelId = impl_swivel_bearing_getSubLevelId
    local function impl_swivel_bearing_isLocked() return false end
    ---@return boolean
    M.types["swivel_bearing"].isLocked = impl_swivel_bearing_isLocked
    local function impl_swivel_bearing_getLockingMode() return "" end
    ---@return string
    M.types["swivel_bearing"].getLockingMode = impl_swivel_bearing_getLockingMode
    local function impl_swivel_bearing_setLockingMode(mode) end
    ---@param mode table
    M.types["swivel_bearing"].setLockingMode = impl_swivel_bearing_setLockingMode
    local function impl_swivel_bearing_getLastAssemblyException() return "" end
    ---@return string
    M.types["swivel_bearing"].getLastAssemblyException = impl_swivel_bearing_getLastAssemblyException
end

---@class avionics.ThrottleLever
M.types["throttle_lever"] = {}
do
    local function impl_throttle_lever_getState() return 0 end
    ---@return integer
    M.types["throttle_lever"].getState = impl_throttle_lever_getState
    local function impl_throttle_lever_setSignal(signal) end
    ---@param signal table
    M.types["throttle_lever"].setSignal = impl_throttle_lever_setSignal
end

---@class avionics.TorsionSpring
M.types["torsion_spring"] = {}
do
    local function impl_torsion_spring_getSelfId() return "" end
    ---@return string
    M.types["torsion_spring"].getSelfId = impl_torsion_spring_getSelfId
    local function impl_torsion_spring_getSourceId() return "" end
    ---@return string
    M.types["torsion_spring"].getSourceId = impl_torsion_spring_getSourceId
    local function impl_torsion_spring_getSubnetworkAnchorId() return "" end
    ---@return string
    M.types["torsion_spring"].getSubnetworkAnchorId = impl_torsion_spring_getSubnetworkAnchorId
    local function impl_torsion_spring_getNetworkId() return "" end
    ---@return string
    M.types["torsion_spring"].getNetworkId = impl_torsion_spring_getNetworkId
    local function impl_torsion_spring_getKind() return "" end
    ---@return string
    M.types["torsion_spring"].getKind = impl_torsion_spring_getKind
    local function impl_torsion_spring_getSpeed() return 0 end
    ---@return number
    M.types["torsion_spring"].getSpeed = impl_torsion_spring_getSpeed
    local function impl_torsion_spring_hasSource() return false end
    ---@return boolean
    M.types["torsion_spring"].hasSource = impl_torsion_spring_hasSource
    local function impl_torsion_spring_isOverstressed() return false end
    ---@return boolean
    M.types["torsion_spring"].isOverstressed = impl_torsion_spring_isOverstressed
    local function impl_torsion_spring_getStressImpact() return 0 end
    ---@return number
    M.types["torsion_spring"].getStressImpact = impl_torsion_spring_getStressImpact
    local function impl_torsion_spring_getStressContribution() return 0 end
    ---@return number
    M.types["torsion_spring"].getStressContribution = impl_torsion_spring_getStressContribution
    local function impl_torsion_spring_setLimit(limit) end
    ---@param limit table
    M.types["torsion_spring"].setLimit = impl_torsion_spring_setLimit
    local function impl_torsion_spring_getAngle() return 0 end
    ---@return number
    M.types["torsion_spring"].getAngle = impl_torsion_spring_getAngle
    local function impl_torsion_spring_getAngleRad() return 0 end
    ---@return number
    M.types["torsion_spring"].getAngleRad = impl_torsion_spring_getAngleRad
    local function impl_torsion_spring_getLimit() return 0 end
    ---@return integer
    M.types["torsion_spring"].getLimit = impl_torsion_spring_getLimit
    local function impl_torsion_spring_isRunning() return false end
    ---@return boolean
    M.types["torsion_spring"].isRunning = impl_torsion_spring_isRunning
end

---@class avionics.VelocitySensor
M.types["velocity_sensor"] = {}
do
    local function impl_velocity_sensor_getVelocity() return 0 end
    ---@return number
    M.types["velocity_sensor"].getVelocity = impl_velocity_sensor_getVelocity
    local function impl_velocity_sensor_getAxis() return "" end
    ---@return string
    M.types["velocity_sensor"].getAxis = impl_velocity_sensor_getAxis
end

---@class avionics.WheelMount
M.types["wheel_mount"] = {}
do
    local function impl_wheel_mount_getSelfId() return "" end
    ---@return string
    M.types["wheel_mount"].getSelfId = impl_wheel_mount_getSelfId
    local function impl_wheel_mount_getSourceId() return "" end
    ---@return string
    M.types["wheel_mount"].getSourceId = impl_wheel_mount_getSourceId
    local function impl_wheel_mount_getSubnetworkAnchorId() return "" end
    ---@return string
    M.types["wheel_mount"].getSubnetworkAnchorId = impl_wheel_mount_getSubnetworkAnchorId
    local function impl_wheel_mount_getNetworkId() return "" end
    ---@return string
    M.types["wheel_mount"].getNetworkId = impl_wheel_mount_getNetworkId
    local function impl_wheel_mount_getKind() return "" end
    ---@return string
    M.types["wheel_mount"].getKind = impl_wheel_mount_getKind
    local function impl_wheel_mount_getSpeed() return 0 end
    ---@return number
    M.types["wheel_mount"].getSpeed = impl_wheel_mount_getSpeed
    local function impl_wheel_mount_hasSource() return false end
    ---@return boolean
    M.types["wheel_mount"].hasSource = impl_wheel_mount_hasSource
    local function impl_wheel_mount_isOverstressed() return false end
    ---@return boolean
    M.types["wheel_mount"].isOverstressed = impl_wheel_mount_isOverstressed
    local function impl_wheel_mount_getStressImpact() return 0 end
    ---@return number
    M.types["wheel_mount"].getStressImpact = impl_wheel_mount_getStressImpact
    local function impl_wheel_mount_getStressContribution() return 0 end
    ---@return number
    M.types["wheel_mount"].getStressContribution = impl_wheel_mount_getStressContribution
    local function impl_wheel_mount_setSteering(value) end
    ---@param value table
    M.types["wheel_mount"].setSteering = impl_wheel_mount_setSteering
    local function impl_wheel_mount_clearSteering() end
    M.types["wheel_mount"].clearSteering = impl_wheel_mount_clearSteering
    local function impl_wheel_mount_getSteering() return 0 end
    ---@return number
    M.types["wheel_mount"].getSteering = impl_wheel_mount_getSteering
    local function impl_wheel_mount_getSteeringAngle() return 0 end
    ---@return number
    M.types["wheel_mount"].getSteeringAngle = impl_wheel_mount_getSteeringAngle
    local function impl_wheel_mount_isSteeringOverridden() return false end
    ---@return boolean
    M.types["wheel_mount"].isSteeringOverridden = impl_wheel_mount_isSteeringOverridden
    local function impl_wheel_mount_setBrake(value) end
    ---@param value table
    M.types["wheel_mount"].setBrake = impl_wheel_mount_setBrake
    local function impl_wheel_mount_clearBrake() end
    M.types["wheel_mount"].clearBrake = impl_wheel_mount_clearBrake
    local function impl_wheel_mount_getBrake() return 0 end
    ---@return number
    M.types["wheel_mount"].getBrake = impl_wheel_mount_getBrake
    local function impl_wheel_mount_isBrakeOverridden() return false end
    ---@return boolean
    M.types["wheel_mount"].isBrakeOverridden = impl_wheel_mount_isBrakeOverridden
    local function impl_wheel_mount_hasTire() return false end
    ---@return boolean
    M.types["wheel_mount"].hasTire = impl_wheel_mount_hasTire
    local function impl_wheel_mount_getTireRadius() return 0 end
    ---@return number
    M.types["wheel_mount"].getTireRadius = impl_wheel_mount_getTireRadius
    local function impl_wheel_mount_getExtension() return 0 end
    ---@return number
    M.types["wheel_mount"].getExtension = impl_wheel_mount_getExtension
    local function impl_wheel_mount_getAngularVelocity() return 0 end
    ---@return number
    M.types["wheel_mount"].getAngularVelocity = impl_wheel_mount_getAngularVelocity
    local function impl_wheel_mount_getTouchingFriction() return 0 end
    ---@return number
    M.types["wheel_mount"].getTouchingFriction = impl_wheel_mount_getTouchingFriction
    local function impl_wheel_mount_isLiftedUp() return false end
    ---@return boolean
    M.types["wheel_mount"].isLiftedUp = impl_wheel_mount_isLiftedUp
end

return M
