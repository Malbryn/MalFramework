#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Checks if the player is a game master (logged-in admin or mission maker).

    Arguments:
        -

    Example:
        call MF_admin_fnc_isGameMaster

    Returns:
        BOOLEAN: true if the player is a game master
*/

if !(hasInterface) exitWith {};

private _playerUID = getPlayerUID player;

GVAR(gameMasters) findIf { _x == _playerUID } > -1;
