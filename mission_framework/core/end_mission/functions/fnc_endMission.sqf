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

// Save end mission stats
call EFUNC(mission_stats,saveMissionTime);
call EFUNC(mission_stats,saveFriendlyFires);
call EFUNC(mission_stats,saveCivilianKills);

// Calling the end mission screen
[_ending, _isVictory, true, true, true] call BFUNC(endMission);
INFO_2("Ending mission... (Ending: %1, Victory: %2)",_ending,_isVictory);

// Disable damage
if (GVARMAIN(moduleDisableDamage)) then {
    [QGVARMAIN(damageDisabled), []] call CFUNC(globalEvent);
    INFO("Player damage disabled");
};
