#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Initialises the array that contains the UID of the game masters.

    Arguments:
        -

    Example:
        call MF_admin_fnc_initGameMasters

    Returns:
        void
*/

if !(isServer) exitWith {};

// Reset the array
GVAR(gameMasters) = [];

// Add the local host
if (hasInterface && {!isDedicated}) then {
    GVAR(gameMasters) pushBack (getPlayerUID player);
};

// Add the mission maker
private _missionMakerUID = GETPAVAR(GVARMAIN(missionMaker),"");

if (_missionMakerUID != "") then {
    GVAR(gameMasters) pushBackUnique _missionMakerUID;
};

// Find the admin
private _adminArray = allUsers select { 0 < (getUserInfo _x) select 8 };

if (_adminArray isNotEqualTo []) then {
    private _admin = _adminArray select 0;
    private _adminUID = (getUserInfo _admin) select 2;
    GVAR(gameMasters) pushBackUnique _adminUID;
};

// Sync the array with the clients
publicVariable QGVAR(gameMasters);

// Log
[
    COMPONENT_STR,
    "INFO",
    format ["Current admins: %1", GVAR(gameMasters)],
    false,
    1
] call EFUNC(main,log);
