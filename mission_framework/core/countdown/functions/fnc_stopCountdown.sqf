#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Stops the currently running countdown.

    Arguments:
        -

    Example:
        call MF_countdown_fnc_stopCountdown

    Returns:
        void
*/

if !(isServer) exitWith {};

// Change state of last item
private _lastIndex = count GVAR(countdownStack) - 1; 

GVAR(countdownStack) set [_lastIndex, false];

// Disable dialog on every client
[QGVAR(closeDialog)] call CFUNC(globalEvent);

// Log
[
    COMPONENT_STR,
    "INFO",
    format [
        "Countdown (index: %1) stopped",
        _lastIndex
    ],
    false,
    0
] call EFUNC(main,log);
