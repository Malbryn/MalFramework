#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Initialises a Capture the Flag style flag pole (or any object).
        Interacting with the pole completes a task.

    Arguments:
        0: OBJECT - The flag pole object
        1: STRING - The ID of the task
        3: STRING - Action text (Optional, default: "Capture")
        2: SCALAR - Capture duration in seconds (Optional, default: 10)

    Example:
        [this, "t1", "Capture AAF outpost", 10] call MF_common_fnc_initCTF

    Returns:
        void
*/

if !(hasInterface) exitWith {};

params ["_obj", "_taskID", ["_text", "Capture"], ["_duration", 10]];

// Add hold action
[
    _obj,
    _text,
    "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_requestLeadership_ca.paa",
    "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_requestLeadership_ca.paa",
    "_this distance _target < 7",
    "_caller distance _target < 7",
    {},
    {},
    {
        params ["_obj", "_finder", "_ID", "_args"];
        _args params ["_taskID"];

        // Set task state
        [_taskID, "SUCCEEDED"] call BFUNC(taskSetState);

        // Remove hold action from everyone and JIP clients
        [QGVAR(removeCTFAction), [_obj, _ID]] call CFUNC(globalEventJIP);
    },
    {},
    [_taskID],
    _duration,
    20,
    true,
    false
] call BFUNC(holdActionAdd);
