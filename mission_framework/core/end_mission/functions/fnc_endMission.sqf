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
        ["MissionSuccess", true] call MF_end_mission_fnc_end_mission

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
[QGVAR(missionEnd), [_ending, _isVictory]] call CFUNC(globalEvent);

// Disable damage
if (GVARMAIN(moduleDisableDamage)) then {
    [QGVARMAIN(damageDisabled), []] call CFUNC(globalEvent);
    MSG("INFO","DAM DIS");
};
