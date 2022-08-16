#include "..\script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Handles the admin logged out event.

    Arguments:
        0: OBJECT - The admin player

    Example:
        [player1] call MF_admin_fnc_handleAdminLoggedOut

    Returns:
        void
*/

if !(isServer) exitWith {};

params [
    ["_unit", objNull, [objNull]]
];

// Check input
if (isNull _unit) exitWith {
    [
        COMPONENT_STR,
        "ERROR",
        "Cannot handle the admin log-out event, the unit is null",
        false,
        1
    ] call EFUNC(main,log);
};

// Remove curator access
private _curatorObj = GETVAR(_unit,GVAR(curatorLogic),objNull);

if !(isNull _curatorObj) then {
    unassignCurator _curatorObj;
    deleteVehicle _curatorObj;
} else {
    // Log
    [
        COMPONENT_STR,
        "WARNING",
        "Cannot remove admin curator access, the curator object is not found",
        false,
        1
    ] call EFUNC(main,log);
};

// Stop any running player 3D FPS counter
[QGVAR(onPlayerFPSToggled), [0], _unit] call CFUNC(targetEvent);

// Close admin menu
[QGVAR(onAdminMenuClosed), [], _unit] call CFUNC(targetEvent);

// Remove from admin channel
[[_unit]] call FUNC(removeFromAdminChannel);
