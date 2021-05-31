#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Registers an object as a chair and adds the sit down action to it.

    Arguments:
        0: OBJECT - The chair object

    Example:
        [this] call MF_common_fnc_initChair

    Returns:
        BOOLEAN
*/

if !(hasInterface) exitWith {};

params ["_obj"];

if (isNull _obj) exitWith {
    [COMPONENT_STR, "ERROR", "Chair object does not exist", true] call EFUNC(main,log);
    false
};

// Seat is not taken by default
SETPVAR(_obj,GVAR(isTaken),false);

// Add action to the chair
_obj addAction [
    "<t color='#21749c'>Sit Down</t>",
    {call FUNC(sitDown)},
    "",
    5,
    false,
    true,
    "",
    "!(_target getVariable ['MF_common_isTaken', false]) && !(_this getVariable ['MF_common_isSeated', false])",
    3
];

true
