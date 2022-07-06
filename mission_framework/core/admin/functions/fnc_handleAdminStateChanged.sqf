#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Handles the change of admin state.

    Arguments:
        -

    Example:
        ["3", true, false] call MF_admin_fnc_handleAdminStateChanged

    Returns:
        void
*/

if !(isServer) exitWith {};

params ["_networkId", "_loggedIn", "_votedIn"];

// Get the UID from network ID
private _userInfo = getUserInfo _networkId;
private _playerUID = _userInfo select 2;
private _unit = _userInfo select 10;

if (isNull _unit) then {
    [
        COMPONENT_STR,
        "WARNING",
        "Admin player object is null",
        false,
        1
    ] call EFUNC(main,log);
};

// Update admins array
if (_loggedIn) then {
    // Add to array
    GVAR(gameMasters) pushBackUnique _playerUID;

    // Fire event
    [QGVAR(onAdminLoggedIn), [_unit]] call CFUNC(localEvent);

    // Log
    [
        COMPONENT_STR,
        "INFO",
        format ["Admin logged in (UID: %1)", _playerUID],
        false,
        1
    ] call EFUNC(main,log);
} else {
    private _missionMakerUID = GETPAVAR(GVARMAIN(missionMaker),"");

    // Remove from array (don't remove if it's the mission maker)
    if (_playerUID != _missionMakerUID) then {
        GVAR(gameMasters) = GVAR(gameMasters) - [_playerUID];
    };

    // Fire event
    [QGVAR(onAdminLoggedOut), [_unit]] call CFUNC(localEvent);

    // Log
    [
        COMPONENT_STR,
        "INFO",
        format ["Admin logged out (UID: %1)", _playerUID],
        false,
        1
    ] call EFUNC(main,log);
};

// Make changes public
publicVariable QGVAR(gameMasters);
