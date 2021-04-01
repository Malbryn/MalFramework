#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Updates the friendly fires in the End Screen.

    Arguments:
        -

    Example:
        call MF_end_mission_fnc_updateCivilianKills

    Returns:
        void
*/

if !(hasInterface) exitWith {};

// Exit if the dialog is not visible
if (isNull findDisplay 899) exitWith {};

private _ckArray = GVAR(civilianKills);

_ckArray apply {
    lbAdd [813, _x];
};
