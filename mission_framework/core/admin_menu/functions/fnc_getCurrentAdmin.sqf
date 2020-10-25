#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Get the name of the currently logged-in admin on the server.

    Arguments:
        -

    Example:
        call MF_admin_menu_fnc_getCurrentAdmin

    Returns:
        STRING
*/

if !(hasInterface) exitWith {};

// There's no logged-in admin in localhost, return the host name instead
if !(isDedicated) exitWith {name player};

// Get admin array
private _admin = (allPlayers select {(admin (owner _x)) > 0});

if (_admin isEqualTo []) then {
    "N/A"
} else {
    _admin select 0
};
