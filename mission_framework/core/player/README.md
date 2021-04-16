# Player
## Description:
_This module handles the initialisation of the playable units._

## Usage:
1. _Place down a playable unit_
2. _Call `MF_player_fnc_initPlayer_` in the init field of the unit_

```
Arguments:
    0: OBJECT - The player unit
    1: STRING - Role of the unit, see: gear script
    2: SCALAR - Unit traits (Optional, default: 0):
        0 - No special ability
        1 - Squad level leadership (SL, FTL) -> can deploy Rally Poins
        2 - Platoon level leadership (PLTHQ, PLTSGT) -> can call respawns, resupply and tactical withdrawal
    3: ARRAY - ACE player variables (Optional, default: [false, false, false]):
        0 - Medic status
        1 - Pilot status
        2 - Engineer status
    4: STRING - Assigned fireteam colour (Optional, default: white (= "MAIN"))
    5: SCALAR - Unit's custom view distance (Optional, default: -1 (overwrites the default value defined in config.sqf))
    6: STRING - Custom shoulder insignia (Optional, default: "")

Example:
    [this, "MEDIC", 0, [true, false, false], "GREEN", 2500, "EAF_5thRegiment"] call MF_player_fnc_initPlayer
```

## Config:
\-

## Supported mission type(s):
 - Coop
 - TvT
