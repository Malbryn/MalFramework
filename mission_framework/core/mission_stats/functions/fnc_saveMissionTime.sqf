#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Save the mission time in a global variable

    Arguments:
        -

    Example:
        call MF_mission_stats_fnc_saveMissionTime

    Returns:
        void
*/

private ["_time", "_timeLimit", "_text"];

_time = [CBA_missionTime] call BFUNC(secondsToString);
_timeLimit = [EGVAR(end_conditions,timeLimit)] call BFUNC(secondsToString);
_text = "";

if (GVARMAIN(moduleTimeLimit)) then {
    _text = format ["MISSION TIME:<br/>%1 out of %2", _time, _timeLimit];
} else {
    _text = format ["MISSION TIME:<br/>%1 minutes", _time];
};

SETPMVAR(GVAR(missionTime),_text);
