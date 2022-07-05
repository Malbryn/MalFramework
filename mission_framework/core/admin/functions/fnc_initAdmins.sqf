#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Initialises the array that contains the UID of the admins.

    Arguments:
        -

    Example:
        call MF_admin_fnc_initAdmins

    Returns:
        void
*/

if !(isServer) exitWith {};

// Reset the array
GVAR(admins) = [];

// Add the mission maker
private _missionMakerUID = GETPAVAR(GVARMAIN(missionMaker),"");

if (_missionMakerUID != "") then {
    GVAR(admins) pushBack _missionMakerUID;
};

// Find the admin
private _adminArray = allPlayers select { 0 < admin owner _x };

if (0 < count _adminArray) then {
    private _adminUID = getPlayerUID (_adminArray select 0);
    GVAR(admins) pushBackUnique _adminUID;
};

// Sync the array with the clients
publicVariable QGVAR(admins);

// Log
[
    COMPONENT_STR,
    "INFO",
    format ["Current admins: %1", GVAR(admins)],
    false,
    1
] call EFUNC(main,log);
