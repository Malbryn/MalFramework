#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Shows the countdown dialog.

    Arguments:
        0: SCALAR - Timer in seconds

    Example:
        [30] call MF_countdown_fnc_showCountdownDialog

    Returns:
        void
*/

if !(hasInterface) exitWith {};

params ["_timer"];

if (_timer < 0) exitWith {
    [COMPONENT_STR, "ERROR", "Countdown timer cannot be negative", true] call EFUNC(main,log);
};

titleRsc ["RscCountdown", "PLAIN", 0.5, false];
