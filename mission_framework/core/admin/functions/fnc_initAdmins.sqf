#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Initialises the array that contains the admins.

    Arguments:
        -

    Example:
        call MF_admin_fnc_initAdmins

    Returns:
        void
*/

if !(isServer) exitWith {};

// Add the mission maker
private _missionMakerUID = GETPAVAR(GVARMAIN(missionMaker),"");

if (_missionMakerUID != "") then {
    GVAR(admins) pushBack _missionMakerUID;
};

// Find the logged-in admin
private _adminArray = allPlayers select { 0 < admin owner _x };

if (0 < count _adminArray) then {
    GVAR(admins) pushBackUnique (_adminArray select 0);
};

// Log
[
    COMPONENT_STR,
    "INFO",
    format ["Current admins: %1", GVAR(admins)],
    false,
    1
] call EFUNC(main,log);
