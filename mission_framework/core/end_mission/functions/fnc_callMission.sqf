#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Calls the mission end on the server, then it ends the mission globally.

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

// Stop the end condition check
[EGVAR(end_conditions,endConditionCheck)] call CFUNC(removePerFrameHandler);

// Run the end screen globally
[QGVAR(runOutro), [_ending, true, _side]] call CFUNC(globalEvent);

// Logging
private _time = [CBA_missionTime] call BFUNC(secondsToString);
INFO_3("Ending mission... (Ending: %1 | Victory: %2 | Mission time: %3)",_ending,_isVictory,_time);
