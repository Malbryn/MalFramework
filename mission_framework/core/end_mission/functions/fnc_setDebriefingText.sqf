#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Sets the debriefing text in the End Screen.

    Arguments:
        -

    Example:
        call MF_end_mission_fnc_setDebriefingText

    Returns:
        void
*/

if !(hasInterface) exitWith {};

// Exit if the dialog is not visible
if (isNull findDisplay 899) exitWith {};

// Title
private _title = GVAR(endTitle);
private _colour = [[1, 0, 0, 1], [0, 1, 0, 1]] select GVAR(isWin);

ctrlSetText [802, _title];
((findDisplay 899) displayCtrl 802) ctrlSetTextColor _colour;

// Description
private _description = GVAR(endDescription);

ctrlSetText [803, _description];
