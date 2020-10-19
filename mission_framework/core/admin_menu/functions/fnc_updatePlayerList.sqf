#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Updates the player list in the Admin menu.

    Arguments:
        -

    Example:
        call MF_admin_menu_fnc_updatePlayerList

    Returns:
        void
*/

if !(hasInterface) exitWith {};

allPlayers apply {
    private _index = lbAdd [718, name _x];

    // Attach the player object (net ID) to the row
    lbSetData [718, _index, netId _x];
};

// Player count
call FUNC(updatePlayerCount);

// Alphabetical order
lbSort 718;
