# Vehicle Respawn
## Description:
_This module can be used to respawn destroyed vehicles for a limited amount of times._

## Usage:
1. _Place down the target vehicle_
2. _Call `MF_vehicle_respawn_fnc_initVehicleRespawn` in the init field of the vehicle_

```
Arguments:
    0: OBJECT - Vehicle to be monitored for respawn
    1: SCALAR - Respawn delay in seconds (Optional, default: 5)
    2: CODE - Initialization for vehicle (to refer the vehicle use: _this) (Optional, default: {})
    3: SCALAR - Respawn limit. Number of respawns the vehicle has (-1 = unlimited) (Optional, default: -1)
    4: BOOLEAN - Deletes wreck on respawn. Wrecks within 100m of respawn point are automatically deleted, regardless of setting (Optional, default: false)
    5: BOOLEAN - Use custom loadout, saves inventory and loads it on respawn (Optional, default: true)
    6: BOOLEAN - Custom paintjob. Saves the current paint on the vehicle and applies it on respawn (Optional, default: true)

Example:
    [this, 30, {}, 3, false, true, true] call MF_vehicle_respawn_fnc_initVehicleRespawn
```

## Config:
\-

## Supported mission type(s):
 - Coop
 - TvT
