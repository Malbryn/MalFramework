#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Closes the countdown dialog.

    Arguments:
        -

    Example:
        call MF_countdown_fnc_closeDialog

    Returns:
        void
*/

if !(hasInterface) exitWith {};

titleRsc ["Default", "PLAIN"];

// Log
[
    COMPONENT_STR,
    "INFO",
    "Closing countdown dialog",
    false,
    0
] call EFUNC(main,log);
