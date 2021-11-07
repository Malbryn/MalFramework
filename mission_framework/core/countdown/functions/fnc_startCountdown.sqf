#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Starts the countdown on the server and triggers the UI element on target clients.
        Runs the given code once the timer hits zero.

    Arguments:
        0: SCALAR - Timer in seconds
        1: CODE - Code to be executed once the timer hits zero (executed on the server)
        2: ARRAY - Arguments passed to the code (Optional, default: [])
        3: OBJECT, GROUP or ARRAY - Show visual countdown to target OBJECT, GROUP or ARRAY of clients only (Optional, default: global)
        4: STRING - Title text in the countdown display (Optional, default: "Countdown")

    Example:
        [30, {
            [_this select 0, _this select 1, playerSide] call MF_end_mission_fnc_callMission;
        }, ["MissionSuccess", true], targetPlayer, "Exfil"] call MF_countdown_fnc_startCountdown

    Returns:
        void
*/

if !(isServer) exitWith {};

params ["_timer", "_code", ["_args", []], ["_target", playerSide], ["_titleText", "Countdown"]];

// Check inputs
if (_timer < 0) exitWith {
    [COMPONENT_STR, "ERROR", "Countdown timer cannot be negative", true, 0] call EFUNC(main,log);
};

if (typeName _code != "CODE") exitWith {
    [COMPONENT_STR, "ERROR", format ["Invalid type (%1), CODE is expected", typeName _code], true, 0] call EFUNC(main,log);
};

if (typeName _args != "ARRAY") then {
    [COMPONENT_STR, "WARNING", format ["Invalid type (%1), ARRAY is expected", typeName _args], true, 0] call EFUNC(main,log);
    _args = [];
};

// Start the timeout
[{
    params ["_code", "_args"];

    _args call _code;
}, [_code, _args], _timer] call CFUNC(waitAndExecute);

// Display timer on target clients
if !((typeName _target) in ["OBJECT", "GROUP", "ARRAY"]) then {
    [QGVAR(initDialog), [_timer, serverTime, _titleText]] call CFUNC(globalEvent);
} else {
    [QGVAR(initDialog), [_timer, serverTime, _titleText], _target] call CFUNC(targetEvent);
};

// Log
[COMPONENT_STR, "INFO", format ["Countdown ('%1') started (%2 seconds)", _titleText, _timer], false, 0] call EFUNC(main,log);
