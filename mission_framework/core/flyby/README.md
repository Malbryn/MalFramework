# Fly-by
## Description:
_This module spawns a friendly aircraft that performs a fly-by along the designated path and then despawns it._

## Usage:
_Call the function in the activation field of a trigger._

```
Arguments:
    0: STRING - Class name of the aircraft
    1: ARRAY - Starting position of the aircraft (Note: third coordinate is the altitude of the aircraft)
    2: ARRAY - First waypoint position
    3: ARRAY - Second waypoint position

Example:
    ["B_Plane_CAS_01_dynamicLoadout_F", [7003, 4978, 100], [7161, 2043, 0], [4004, 2028, 0]] call MF_flyby_fnc_doFlyby
```

## Config:
\-

## Supported mission type(s):
 - Coop
 - TvT
