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

// Remove from admin channel
[QGVAR(onRemovedFromAdminChannel), [_unit]] call CFUNC(localEvent);
