# AI Spawner
## Description:
_This module integrates DreadPirate's awesome [Jebus - Just Editor Based Unit Spawning](https://forums.bohemia.net/forums/topic/174661-jebus-just-editor-based-unit-spawning/) script._

_It takes editor-based groups and respawns them when the group is eliminated._

## Usage:
1. _Call `MF_ai_spawner_fnc_main` in the init field of the target group or unit (or use it with triggers)._

```
Arguments:
    0: OBJECT or GROUP - The unit or group
    1: SCALAR - The number of respawns the unit/group has (Optional, default: -1)
    2: SCALAR - Respawn delay in seconds (Optional, default: 30)
    3: SCALAR - Cache radius in meters (Optional, default: 0)
    4: SCALAR - Radius in which enemies will pause the spawner (Optional, default: 300)
    5: ARRAY - Array of markers where the unit/group will respawn randomly (Optional, default: [])
    6: OBJECT - Exit trigger. If activated, the respawn will stop (Optional, default: objNull)
    7: SCALAR - Initial spawn delay in seconds (Optional, default: 0)
    8: STRING - Init string to run upon spawning. (Use "_proxyThis" where you would usually use "this" in a script or function call) (Optional, default: "")
    9: STRING - Special spawn rules, for example "FLYING" (Optional, default: "NONE")

Example:
    [this, 2, 30, 300, 150, [], objNull, 0, "", "NONE"] spawn MF_ai_spawner_fnc_main
```

## Config:
\-

## Supported mission type(s):
 - Coop
