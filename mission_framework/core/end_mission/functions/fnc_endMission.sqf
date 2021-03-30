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

params ["_ending", "_isVictory", ["_side", sideUnknown]];

if (isServer) then {
    // Delay until the end of the closing shot (~14s)
    [{
        // Disable simulation
        {
            _x enableSimulationGlobal false;
        } forEach (vehicles + allUnits);

        // Delay until the end of the end screen (SKIPTIME macro)
        [{
            [QGVAR(endMission), [_ending]] call CFUNC(globalEvent);
        }, [], SKIPTIME] call CFUNC(waitAndExecute);
    }, [], 14] call CFUNC(waitAndExecute);
};

if (hasInterface) then {
    // Screen effects
    call FUNC(runClosingShot);

    // Cancel pending tasks
    private _taskList = player call BFUNC(tasksUnit);

    _taskList apply {
        private _state = _x call BFUNC(taskState);

        if (_state in ["CREATED", "ASSIGNED"]) then {
            [_taskName, "CANCELED", true] call BFUNC(taskSetState);
        };
    };
};
