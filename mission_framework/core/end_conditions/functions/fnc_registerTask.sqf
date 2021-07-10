#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Registers the task to be monitored by the server.
        Put this in the init field of the task module.

    Arguments:
        0: STRING - Unique Task ID
        1: BOOLEAN - If the task is optional (won't count towards the outcome of the mission) (Optional, default: false)

    Example:
        ["t1", true] call MF_end_conditions_fnc_registerTask

    Returns:
        void
*/

if !(isServer) exitWith {};

params ["_taskID", ["_isOptional", false]];

if (_isOptional) exitWith {};

PUSH(GVAR(tasks),_taskID);
publicVariable QGVAR(tasks);
