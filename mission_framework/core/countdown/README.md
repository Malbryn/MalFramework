# Countdown
## Description:
_This module starts a countdown on the server and executes the provided code when the timer hits zero._

_It also can display a countdown HUD element on target clients._

## Usage:
_Call the function in the activation field of a trigger._

```
Arguments:
    0: SCALAR - Timer in seconds
    1: CODE - Code to be executed once the timer hits zero (executed on the server, passed params: [_target, _args])
    2: ARRAY - Arguments passed to the code (Optional, default: [])
    3: OBJECT, GROUP, SIDE or ARRAY - Show visual countdown to target OBJECT, GROUP, SIDE or ARRAY of clients only (Optional, default: global)
    4: STRING - Title text in the countdown display (Optional, default: "Countdown")

Example:
    [10, {
        params ["_target", "_args"];

        ["Mission is ending..."] remoteExec ["hint", _target];
        [_args select 0, _args select 1, _target] call MF_end_mission_fnc_callMission;
    }, ["MissionSuccess", true], targetPlayer, "Exfil"] call MF_countdown_fnc_startCountdown
```

## Config:
\-

## Supported mission type(s):
 - Coop
 - TvT
