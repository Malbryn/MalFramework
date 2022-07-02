#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Checks if the player is an admin (logged-in admin or mission maker).

    Arguments:
        -

    Example:
        call MF_admin_fnc_isAdmin

    Returns:
        BOOLEAN: true if the player is an admin
*/

if !(hasInterface) exitWith {};

private _playerUID = getPlayerUID player;

GVAR(admins) findIf { _x == _playerUID } > -1;
