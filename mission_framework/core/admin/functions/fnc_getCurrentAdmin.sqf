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

private _admin = objNull;
private _adminUID = "";
private _adminName = "N/A";

if (count GVAR(gameMasters) > 1) then {
    private _missionMakerUID = GETPAVAR(GVARMAIN(missionMaker),"");
    private _filtered = GVAR(gameMasters) select {
        _x isNotEqualTo _missionMakerUID
    };

    _adminUID = _filtered select 0;
    _admin = [_adminUID] call BFUNC(getUnitByUID);
};

if (count GVAR(gameMasters) > 0) then {
    _adminUID = GVAR(gameMasters) select 0;
    _admin = [_adminUID] call BFUNC(getUnitByUID);
};

_adminName = name _admin;

_adminName
