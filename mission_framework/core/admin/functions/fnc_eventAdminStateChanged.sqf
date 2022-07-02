#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Handles the change of admin state.

    Arguments:
        -

    Example:
        ["3", true, false] call MF_admin_fnc_eventAdminStateChanged

    Returns:
        void
*/

if !(isServer) exitWith {};

params ["_networkId", "_loggedIn", "_votedIn"];

// Get the UID from network ID
private _userInfo = getUserInfo _networkId;
private _playerUID = _userInfo select 2;

// Update admins array
if (_loggedIn) then {
    GVAR(admins) pushBackUnique _playerUID;

    // Log
    [
        COMPONENT_STR,
        "INFO",
        format ["Admin logged in (UID: %1)", _playerUID],
        true,
        0
    ] call EFUNC(main,log);
} else {
    private _missionMakerUID = GETPAVAR(GVARMAIN(missionMaker),"");

    // Don't remove the mission maker
    if (_playerUID != _missionMakerUID) then {
        GVAR(admins) = GVAR(admins) - [_playerUID];
    };

    // Log
    [
        COMPONENT_STR,
        "INFO",
        format ["Admin logged out (UID: %1)", _playerUID],
        true,
        0
    ] call EFUNC(main,log);
};

// Make changes public
publicVariable QGVAR(admins);
