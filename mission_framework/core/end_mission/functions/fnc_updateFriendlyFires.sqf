#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Updates the friendly fires in the End Screen.

    Arguments:
        -

    Example:
        call MF_end_mission_fnc_updateFriendlyFires

    Returns:
        void
*/

if !(hasInterface) exitWith {};

// Exit if the dialog is not visible
if (isNull findDisplay 899) exitWith {};

private _ffArray = GVAR(friendlyFires);

_ffArray apply {
    lbAdd [812, _x];
};
