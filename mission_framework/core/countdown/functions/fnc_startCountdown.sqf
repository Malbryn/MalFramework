#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Starts the countdown on the server and triggers the UI element on target clients.
        Ends the mission once the countdown hits zero.

    Arguments:
        0: SCALAR - Timer in seconds
        1: STRING - Ending type
        2: BOOLEAN - Is victory (Optional, default: false)
        3: OBJECT or GROUP - Show visual countdown to target OBJECT or GROUP clients (Optional, default: every unit on playerSide)

    Example:
        [30, "MissionSuccess", true, targetPlayer] call MF_countdown_fnc_startCountdown

    Returns:
        void
*/

if !(isServer) exitWith {};

params ["_timer", "_ending", ["_isVictory", false], ["_target", playerSide]];

// Check inputs
if (_timer < 0) exitWith {
    [COMPONENT_STR, "ERROR", "Countdown timer cannot be negative", true, 0] call EFUNC(main,log);
};

if (!isClass (missionConfigFile >> "CfgDebriefing" >> _ending)) then {
    [COMPONENT_STR, "WARNING", format ["Ending type (%1) is not found in CfgDebriefing", _ending], true, 0] call EFUNC(main,log);
};

if (typeName _target != "OBJECT" && typeName _target != "GROUP") exitWith {
    [COMPONENT_STR, "ERROR", format ["Invalid target type (%1), OBJECT or GROUP is expected", typeName _target], true, 0] call EFUNC(main,log);
};

// Start the wait event
[{
    [_ending, _isVictory, playerSide] call EFUNC(end_mission,callMission);
}, [_ending, _isVictory, _target], _timer] call CFUNC(waitAndExecute);


// Display timer on clients
[QGVAR(showTimer), [_timer], _target] call CFUNC(targetEvent);

// Log
[COMPONENT_STR, "INFO", format ["Countdown started (%1 seconds)", _timer], false, 0] call EFUNC(main,log);
