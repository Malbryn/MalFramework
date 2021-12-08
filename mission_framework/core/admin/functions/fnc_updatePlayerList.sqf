#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Updates the player list in the Admin menu.

    Arguments:
        -

    Example:
        call MF_admin_fnc_updatePlayerList

    Returns:
        void
*/

if !(hasInterface) exitWith {};

// Exit if the dialog is not visible
if (isNull findDisplay 799) exitWith {};

// Clear it first
lbClear 718;

private _playerList = call BFUNC(listPlayers);

_playerList apply {
    private _index = lbAdd [718, name _x];

    // Attach the player object (net ID) to the row
    lbSetData [718, _index, netId _x];
};

// Player count
call FUNC(updatePlayerCount);

// Alphabetical order
lbSort 718;
