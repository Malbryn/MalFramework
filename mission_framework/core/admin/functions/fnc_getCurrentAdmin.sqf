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
        STRING: name of the admin player
*/

if !(hasInterface) exitWith {};

// There's no logged-in admin in localhost, return the host name instead
if (isServer) exitWith {
    name player;
};

private _admin = "N/A";

if (count GVAR(gameMasters) > 1) then {
    private _filtered = GVAR(gameMasters) select {
        _x isNotEqualTo GVARMAIN(missionMaker)
    };

    _admin = _filtered select 0;
} else if (count GVAR(gameMasters) > 0) then {
    _admin = GVAR(gameMasters) select 0;
};

_admin;
