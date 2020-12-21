#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        blank

    Arguments:
        0: OBJECT - The chair object

    Example:
        call MF_sitting_fnc_initChair

    Returns:
        BOOLEAN
*/

if !(hasInterface) exitWith {};

params ["_obj"];

if (isNull _obj) exitWith {
    MSG("ERROR","(Sitting) Chair object does not exist");
    false
};

// Add action to the chair
_obj addAction [
    "<t color='#21749c'>Sit Down</t>",
    {call FUNC(sitDown)},
    "",
    5,
    false,
    true,
    "",
    "true",
    3
];

true
