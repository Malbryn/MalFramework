#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Registers the task to be monitored by the server.
        Use this only if GVARMAIN(moduleTaskLimit) == true or GVARMAIN(moduleExtraction) == true.
        Put this in the init field of the task module.

    Arguments:
        0: STRING - Unique Task ID

    Example:
        ["task1"] call MF_end_conditions_fnc_registerTask

    Returns:
        void
*/

if !(isServer) exitWith {};

params ["_taskID"];

PUSH(GVAR(tasks),_taskID);
