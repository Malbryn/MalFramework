#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Updates the player count in the Admin menu.

    Arguments:
        -

    Example:
        call MF_admin_fnc_updatePlayerCount

    Returns:
        void
*/

if !(hasInterface) exitWith {};

private _text = format [
    "%1 / %2",
    count (call BFUNC(listPlayers)), getNumber (missionConfigFile >> "Header" >> "maxPlayers")
];

ctrlSetText [717, _text];
