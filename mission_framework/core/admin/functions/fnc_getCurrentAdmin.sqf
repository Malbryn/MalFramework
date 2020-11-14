#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Get the name of the currently logged-in admin on the server.

    Arguments:
        -

    Example:
        call MF_admin_fnc_getCurrentAdmin

    Returns:
        STRING
*/

if !(hasInterface) exitWith {};

// There's no logged-in admin in localhost, return the host name instead
if (isServer) exitWith {name player};

// Get admin array
[QGVAR(getAdmin)] call CFUNC(serverEvent);

private _admin = GVAR(currentAdmin);

if (_admin isEqualTo []) then {
    "N/A"
} else {
    name (_admin select 0);
};
