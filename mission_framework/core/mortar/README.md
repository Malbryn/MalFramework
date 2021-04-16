# Mortar
## Description:
_This module spawns scripted mortar fire (means that no mortar units have to be present)._

## Usage:
1. _Place down a trigger and give it a unique name (this will serve as the area of the effect so make sure it's an area trigger)_
2. _Place down another trigger and configure the activation conditions_
3. _In the activation field call `MF_mortar_fnc_mortarFire`_

```
Arguments:
    0: STRING - Name of the trigger
    1: SCALAR - Number of the shells dropped
    2: SCALAR - Safe distance from the player
    3: STRING - Shell type (Optional, default: "Sh_82mm_AMOS")

Example:
    [mortarTrigger, 6, 50] spawn MF_mortar_fnc_mortarFire
```

## Config:
\-

## Supported mission type(s):
 - Coop
 - TvT
