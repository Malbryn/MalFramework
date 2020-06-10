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
        ["MissionSuccess", true] call MF_end_mission_fnc_callMission

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
switch _ending do {
    case "BluforWin" : {
        [QGVARMAIN(missionEnd), ["BluforWin", true], allPlayers select {side _x == west}] call CFUNC(targetEvent);
        [QGVARMAIN(missionEnd), ["BluforWin", false], allPlayers select {side _x == east}] call CFUNC(targetEvent);
    };

    case "RedforWin" : {
        [QGVARMAIN(missionEnd), ["RedforWin", false], allPlayers select {side _x == west}] call CFUNC(targetEvent);
        [QGVARMAIN(missionEnd), ["RedforWin", true], allPlayers select {side _x == east}] call CFUNC(targetEvent);
    };

    default {
        [QGVARMAIN(missionEnd), [_ending, _isVictory]] call CFUNC(globalEvent);
    };
};

// Logging
_time = [CBA_missionTime] call BFUNC(secondsToString);
INFO_3("Ending mission... (Ending: %1 | Victory: %2 | Mission time: %3)",_ending,_isVictory,_time);

// Disable damage
if (GVARMAIN(moduleDisableDamage)) then {
    [QGVARMAIN(damageDisabled), []] call CFUNC(globalEvent);
    INFO("Player damage disabled");
};
