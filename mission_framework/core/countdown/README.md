# Countdown
## Description:
_This module starts a countdown on the server and executes the provided code on the target client (or on the server) when the timer hits zero._

_It is also possible to display a counter HUD element on the target clients._

_There can be only one countdown running at the same time, however a running countdown can be stopped._

## Usage:
_Call `MF_countdown_fnc_startCountdown` in the activation field of a trigger._

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

_It is also possible to cancel the currently running countdown by calling `MF_countdown_fnc_stopCountdown`._

```
Arguments:
    -

Example:
    call MF_countdown_fnc_stopCountdown
```

## Config:
\-

## Supported mission type(s):
 - Coop
 - TvT
