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
        BOOLEAN: true if the countdown was successfully stopped
*/

if !(isServer) exitWith {};

// Change state of last item
private _lastIndex = count GVAR(countdownStack) - 1;

if (count GVAR(countdownStack) != 0 && { GVAR(countdownStack) select _lastIndex }) then {
    GVAR(countdownStack) set [_lastIndex, false];

    // Disable dialog and remove handler on every client
    [QGVAR(closeDialog)] call CFUNC(globalEvent);
    [GVAR(displaySetupTimer)] call CFUNC(removePerFrameHandler);

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

    true
} else {
    false
};
