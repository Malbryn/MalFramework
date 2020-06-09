#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        End the mission on the server and on every client

    Arguments:
        0: STRING - Class name of the ending (defined in CfgDebriefing)
        1: BOOLEAN - Is victory

    Example:
        ["MissionSuccess", true] call MF_end_mission_fnc_endMission

    Returns:
        void
*/

if !(isServer) exitWith {};

params ["_ending", "_isVictory"];
private ["_time"];

// Save end mission stats
call EFUNC(mission_stats,saveMissionTime);
call EFUNC(mission_stats,saveFriendlyFires);
call EFUNC(mission_stats,saveCivilianKills);

// Stop the end condition check
if (GVARMAIN(moduleTimeLimit) || GVARMAIN(moduleFriendlyCasualties) || GVARMAIN(moduleTaskLimit) || GVARMAIN(moduleExtraction) || GVARMAIN(moduleCivilianCasualties)) then {
    [EGVAR(end_conditions,endConditionCheck)] call CFUNC(removePerFrameHandler);
};

// Calling the end mission screen
[_ending, _isVictory, true, true, true] call BFUNC(endMission);

_time = [CBA_missionTime] call BFUNC(secondsToString);
INFO_3("Ending mission... (Ending: %1 | Victory: %2 | Mission time: %3)",_ending,_isVictory,_time);

// Disable damage
if (GVARMAIN(moduleDisableDamage)) then {
    [QGVARMAIN(damageDisabled), []] call CFUNC(globalEvent);
    INFO("Player damage disabled");
};
