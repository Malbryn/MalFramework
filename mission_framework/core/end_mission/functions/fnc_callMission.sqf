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

params ["_ending", ["_isVictory", false], ["_side", sideUnknown]];

// Stop the end condition check
if (!isNil QEGVAR(end_conditions,endConditionCheck)) then {
    [EGVAR(end_conditions,endConditionCheck)] call CFUNC(removePerFrameHandler);
};

// Set vars
private _title = [missionConfigfile >> "CfgDebriefing" >> _ending, "title", "UNKNOWN"] call BFUNC(returnConfigEntry);
private _desc = [missionConfigfile >> "CfgDebriefing" >> _ending, "description", "Unknown."] call BFUNC(returnConfigEntry);

GVAR(endTitle) = toUpper _title;
GVAR(endDescription) = _desc;
GVAR(isWin) = _isVictory;

// Send info to clients
publicVariable QGVAR(endTitle);
publicVariable QGVAR(endDescription);
publicVariable QGVAR(isWin);

publicVariable QGVAR(civilianKills);
publicVariable QGVAR(friendlyFires);

// Run the end screen globally
[QGVAR(runOutro), [_ending, _isVictory]] call CFUNC(globalEvent);

// Logging
private _time = [CBA_missionTime] call BFUNC(secondsToString);

[COMPONENT_STR, "INFO", format [
    "Ending mission... (Ending: %1 | Victory: %2 | Mission time: %3)", _ending, _isVictory, _time
]] call EFUNC(main,log);
