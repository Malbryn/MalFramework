#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Initialises the countdown.

    Arguments:
        0: SCALAR - Timer in seconds
        1: SCALAR - Start time in seconds
        2: STRING - Title text in the display

    Example:
        [30, 60, "Exfil"] call MF_countdown_fnc_initCountdown

    Returns:
        void
*/

if !(hasInterface) exitWith {};

params ["_timer", "_startTime", "_titleText"];

SETMVAR(GVAR(timer),_timer);
SETMVAR(GVAR(startTime),_startTime);
SETMVAR(GVAR(titleText),_titleText);

titleRsc ["RscCountdown", "PLAIN", 0.5, false];
