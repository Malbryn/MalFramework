#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Starts the countdown on the server and triggers the UI element on target clients.
        Runs the given code on the target client once the timer hits zero.
        There can be only one countdown running at the same time.

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

    Returns:
        SCALAR: ID of the started countdown
*/

if !(isServer) exitWith {};

params ["_timer", "_code", ["_args", []], ["_target", allPlayers], ["_titleText", "Countdown"]];

// Check if there's already a running countdown (i.e. check last element)
private _lastIndex = 0;
private _isRunning = false;

// Getting element from an empty array would fail, an empty array also means no countdown is running
if (count GVAR(countdownStack) != 0) then {
    _lastIndex = count GVAR(countdownStack) - 1;
    _isRunning = GVAR(countdownStack) select _lastIndex;
};

if (_isRunning) exitWith {
    [
        COMPONENT_STR,
        "ERROR",
        "Running countdown detected, wait for it to end or cancel it before starting a new one",
        true,
        0
    ] call EFUNC(main,log);
};

// Check inputs
if (_timer < 0) exitWith {
    [
        COMPONENT_STR,
        "ERROR",
        "Countdown timer cannot be negative number",
        true,
        0
    ] call EFUNC(main,log);
};

if (typeName _code != "CODE") exitWith {
    [
        COMPONENT_STR,
        "ERROR",
        format ["Invalid type (%1), CODE is expected", typeName _code],
        true,
        0
    ] call EFUNC(main,log);
};

if (typeName _args != "ARRAY") then {
    [
        COMPONENT_STR,
        "WARNING",
        format ["Invalid type (%1), ARRAY is expected", typeName _args],
        true,
        0
    ] call EFUNC(main,log);

    _args = [];
};

// Set state
private _newIndex = GVAR(countdownStack) pushBack true;

// Start the timer
[{
    params ["_code", "_args", "_target", "_index"];

    // Check state of the countdown and run the code if the countdown is still active
    private _state = GVAR(countdownStack) select _index;

    // Log
    [
        COMPONENT_STR,
        "INFO",
        format [
            "Countdown finished (index: %1, state: %2)",
            _index, _state
        ],
        false,
        0
    ] call EFUNC(main,log);

    if (_state) then {
        // Set state
        GVAR(countdownStack) set [_index, false];

        // Run the code
        [_target, _args] call _code;
    } else {
        // Log
        [
            COMPONENT_STR,
            "INFO",
            format [
                "Stopped countdown detected (index: %1), cancelling running of code",
                _index
            ],
            false,
            0
        ] call EFUNC(main,log);
    }
}, [_code, _args, _target, _newIndex], _timer] call CFUNC(waitAndExecute);

// Convert SIDE to ARRAY (CBA target event doesn't accept SIDE as target)
if (typeName _target == "SIDE") then {
    _target = units _target;
};

// Display timer on target clients
if !((typeName _target) in ["OBJECT", "GROUP", "ARRAY"]) then {
    [QGVAR(openDialog), [_timer, serverTime, _titleText]] call CFUNC(globalEvent);
} else {
    [QGVAR(openDialog), [_timer, serverTime, _titleText], _target] call CFUNC(targetEvent);
};

// Log
[
    COMPONENT_STR,
    "INFO",
    format [
        "Countdown ('%1') started (timer: %2 seconds, index: %3)",
        _titleText, _timer, _newIndex
    ],
    false,
    0
] call EFUNC(main,log);

// Return the index
_newIndex
