#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        End the mission on the server and on every client

    Arguments:
        0: STRING - Class name of the ending (defined in CfgDebriefing)
        1: BOOLEAN - Is victory
        2: SIDE - 

    Example:
        ["MissionSuccess", true] call MF_end_mission_fnc_callMission

    Returns:
        void
*/

if !(isServer) exitWith {};

params ["_ending", "_isVictory", ["_side", sideUnknown]];
private ["_time"];

// Save end mission stats
call EFUNC(mission_stats,saveMissionTime);
call EFUNC(mission_stats,saveFriendlyFires);
call EFUNC(mission_stats,saveCivilianKills);

// Stop the end condition check
if !(isNil EGVAR(end_conditions,endConditionCheck)) then {
    [EGVAR(end_conditions,endConditionCheck)] call CFUNC(removePerFrameHandler);
};
/*
// Calling the end mission screen
switch _side do {
    case west : {
        [QGVARMAIN(missionEnd), [_ending, _isVictory], allPlayers select {side _x == west}] call CFUNC(targetEvent);
        [QGVARMAIN(missionEnd), [_ending, !(_isVictory)], allPlayers select {side _x == east}] call CFUNC(targetEvent);
        //[QGVARMAIN(missionEnd), [_ending, true]] call CFUNC(localEvent);
    };

    case east : {
        [QGVARMAIN(missionEnd), [_ending, !(_isVictory)], allPlayers select {side _x == west}] call CFUNC(targetEvent);
        [QGVARMAIN(missionEnd), [_ending, _isVictory], allPlayers select {side _x == east}] call CFUNC(targetEvent);
        //[QGVARMAIN(missionEnd), [_ending, true]] call CFUNC(localEvent);
    };

    default {
        [QGVARMAIN(missionEnd), [_ending, _isVictory]] call CFUNC(globalEvent);
    };
};
*/

[QGVARMAIN(missionEnd), [_ending, _isVictory], allPlayers] call CFUNC(targetEvent);
//[QGVARMAIN(missionEnd), [_ending, true]] call CFUNC(localEvent);

// Logging
_time = [CBA_missionTime] call BFUNC(secondsToString);
INFO_3("Ending mission... (Ending: %1 | Victory: %2 | Mission time: %3)",_ending,_isVictory,_time);

// Disable damage
if (GVARMAIN(moduleDisableDamage)) then {
    [QGVARMAIN(damageDisabled), []] call CFUNC(globalEvent);
    INFO("Player damage disabled");
};
