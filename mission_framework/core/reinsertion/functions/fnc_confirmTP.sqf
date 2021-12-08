#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Displays a confirmation box for the player.

    Arguments:
        0: STRING - Destination name

    Example:
        ["FOB"] call MF_reinsertion_fnc_confirmTP

    Returns:
        BOOLEAN
*/

if !(hasInterface) exitWith {};

params [["_dest", "UNKNOWN"]];

private _confirm = [
    format ["Please confirm the destination:<br/>%1", _dest], 
    "Teleport",
    true,
    true
] call BFUNC(guiMessage);

_confirm
