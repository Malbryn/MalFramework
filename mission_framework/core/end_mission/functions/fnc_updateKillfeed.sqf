#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Updates the killfeed in the End Screen.

    Arguments:
        -

    Example:
        call MF_end_mission_fnc_updateKillfeed

    Returns:
        void
*/

if !(hasInterface) exitWith {};

// Exit if the dialog is not visible
if (isNull findDisplay 899) exitWith {};

private _kfArray = GVAR(killFeed);

_kfArray apply {
    private _index = lbAdd [811, _x#0];

    // Red colour if it's a death event
    if !(_x#1) then {
        lbSetColor [811, _index, [1, 0, 0, 1]];
    };
};
