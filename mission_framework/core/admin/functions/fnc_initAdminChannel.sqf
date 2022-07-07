#include "..\script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Creates a text channel for the admins.

    Arguments:
        -

    Example:
        call MF_admin_fnc_initAdminChannel

    Returns:
        void
*/

if !(isServer) exitWith {};

// Create the channel
private _adminChannelID = radioChannelCreate [
    [0.9, 0.2, 0.1, 1],
    "Admin channel",
    "Admin chat (%UNIT_NAME)",
    [],
    true
];

if (_adminChannelID != 0) then {
    // Sync it with players
    GVAR(adminChannelID) = _adminChannelID;
    publicVariable QGVAR(adminChannelID);

    // Add admins to the channel
    private _units = [GVAR(gameMasters)] call EFUNC(common,getUnitsByUID);

    [_units] call FUNC(addToAdminChannel);
};
