#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Ends the mission on the server and on every client.

    Arguments:
        0: STRING - Class name of the ending (defined in CfgDebriefing)
        1: BOOLEAN - Success?

    Example:
        ["BluforWin", true] call MF_end_mission_fnc_runOutro

    Returns:
        void
*/

params ["_ending", "_isVictory"];

if (isServer) then {
    // Delay until the end of the closing shot (~13s)
    [{
        // Disable simulation
        {
            _x enableSimulationGlobal false;
        } forEach (vehicles + allUnits);

        // Delay until the end of the end screen (SKIPTIME macro)
        [{
            [QGVAR(endMission), [_this#0]] call CFUNC(globalEvent);
        }, _this, SKIPTIME] call CFUNC(waitAndExecute);
    }, [_ending], 13] call CFUNC(waitAndExecute);
};

if (hasInterface) then {
    // Screen effects
    [_ending, _isVictory] call FUNC(runClosingShot);

    // Set respawn timer and prevent players that just died from entering spectator
    setPlayerRespawnTime 10e10;
    GVAR(outroIsRunning) = true;

    // Disable damage (dying during the closing shot breaks the end screen)
    player allowDamage false;
    (vehicle player) allowDamage false;

    // Cancel pending tasks
    private _taskList = player call BFUNC(tasksUnit);

    _taskList apply {
        private _state = _x call BFUNC(taskState);

        if (_state in ["CREATED", "ASSIGNED"]) then {
            [_x, "CANCELED", true] call BFUNC(taskSetState);
        };
    };
};
