#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Sets the player info text in the End Screen.

    Arguments:
        -

    Example:
        call MF_end_mission_fnc_setPlayerInfo

    Returns:
        void
*/

if !(hasInterface) exitWith {};

// Exit if the dialog is not visible
if (isNull findDisplay 899) exitWith {};

// Get role description without the CBA naming
private _unitDesc = [player] call EFUNC(common,getUnitDescription);

private _text = format ["%1 [%2 - %3]", name player, _unitDesc, groupId (group player)];

ctrlSetText [804, _text];
