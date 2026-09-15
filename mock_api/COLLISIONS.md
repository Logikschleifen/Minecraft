# Peripheral collisions: create/ vs createavionics/

Rule (per requirements): **createavionics wins**. The `create.lua` mock
omits these 5 types; the `createavionics.lua` mock provides them.
Method diffs below are informational only.

## `Create_CreativeMotor`
- create class: `CreativeMotorPeripheral` (2 methods)
- avionics class: `CreativeMotorPeripheral` (12 methods)
- only in avionics (kept in mock): `getKind`, `getNetworkId`, `getSelfId`, `getSourceId`, `getSpeed`, `getStressContribution`, `getStressImpact`, `getSubnetworkAnchorId`, `hasSource`, `isOverstressed`

## `Create_RotationSpeedController`
- create class: `SpeedControllerPeripheral` (2 methods)
- avionics class: `SpeedControllerPeripheral` (12 methods)
- only in avionics (kept in mock): `getKind`, `getNetworkId`, `getSelfId`, `getSourceId`, `getSpeed`, `getStressContribution`, `getStressImpact`, `getSubnetworkAnchorId`, `hasSource`, `isOverstressed`

## `Create_SequencedGearshift`
- create class: `SequencedGearshiftPeripheral` (3 methods)
- avionics class: `SequencedGearshiftPeripheral` (6 methods)
- only in create (dropped from mock): `isRunning`, `move`, `rotate`
- only in avionics (kept in mock): `getProgress`, `getRemainingTicks`, `getRotationModifier`, `setInstructions`, `start`, `stop`

## `Create_Speedometer`
- create class: `SpeedGaugePeripheral` (1 methods)
- avionics class: `SpeedGaugePeripheral` (10 methods)
- only in avionics (kept in mock): `getKind`, `getNetworkId`, `getSelfId`, `getSourceId`, `getStressContribution`, `getStressImpact`, `getSubnetworkAnchorId`, `hasSource`, `isOverstressed`

## `Create_Stressometer`
- create class: `StressGaugePeripheral` (2 methods)
- avionics class: `StressGaugePeripheral` (12 methods)
- only in avionics (kept in mock): `getKind`, `getNetworkId`, `getSelfId`, `getSourceId`, `getSpeed`, `getStressContribution`, `getStressImpact`, `getSubnetworkAnchorId`, `hasSource`, `isOverstressed`
