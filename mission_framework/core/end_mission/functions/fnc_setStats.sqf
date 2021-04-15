#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Sets the player stats and mission time in the End Screen.

    Arguments:
        -

    Example:
        call MF_end_mission_fnc_setStats

    Returns:
        void
*/

if !(hasInterface) exitWith {};

// Exit if the dialog is not visible
if (isNull findDisplay 899) exitWith {};

// Mission time
private _missionTime = "";
private _endTime = [CBA_missionTime] call EFUNC(common,getTimeStamp);

if (GVARMAIN(moduleTimeLimit)) then {
    private _timeLimit = [EGVAR(end_conditions,timeLimit)] call EFUNC(common,getTimeStamp);

    // Compensate for the delay of the end condition detection (as it can exceed the time limit)
    if (CBA_missionTime >= EGVAR(end_conditions,timeLimit)) then {
        _endTime = _timeLimit;
    };

    _missionTime = format ["%1 / %2", _endTime, _timeLimit];
    ctrlSetText [805, _missionTime];
} else {
    _missionTime = format ["%1 / --:--:--", _endTime];
    ctrlSetText [805, _missionTime];
};

// Kill count
private _killCount = GVAR(killCount);
ctrlSetText [806, str _killCount];

// Death count
private _deathCount = GVAR(deathCount);
ctrlSetText [807, str _deathCount];
