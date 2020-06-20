#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Ends the mission on the server and on every client.

    Arguments:
        0: STRING - Class name of the ending (defined in CfgDebriefing)
        1: BOOLEAN - Is victory
        2: SIDE - Which side isVictory refers to (TvT missions)

    Example:
        ["BluforWin", true, west] call MF_end_mission_fnc_callMission

    Returns:
        void
*/

if !(isServer) exitWith {};

params ["_ending", "_isVictory", ["_side", sideUnknown]];

// Save end mission stats
call EFUNC(mission_stats,saveMissionTime);
call EFUNC(mission_stats,saveFriendlyFires);
call EFUNC(mission_stats,saveCivilianKills);

// Stop the end condition check
[EGVAR(end_conditions,endConditionCheck)] call CFUNC(removePerFrameHandler);

// If dedicated, end the mission on the server as well
if (isDedicated) then {
    [QGVARMAIN(missionEnd), [_ending, true, _side]] call CFUNC(localEvent);
    [QGVARMAIN(missionEnd), [_ending, _isVictory, _side], allPlayers] call CFUNC(targetEvent);
} else {
    [QGVARMAIN(missionEnd), [_ending, _isVictory, _side]] call CFUNC(localEvent);
};

// Logging
private _time = [CBA_missionTime] call BFUNC(secondsToString);
INFO_3("Ending mission... (Ending: %1 | Victory: %2 | Mission time: %3)",_ending,_isVictory,_time);

// Disable damage
if (GVARMAIN(moduleDisableDamage)) then {
    [QGVARMAIN(damageDisabled), []] call CFUNC(globalEvent);
    INFO("Player damage disabled");
};
