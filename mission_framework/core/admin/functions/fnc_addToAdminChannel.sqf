#include "..\script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Adds unit(s) to the admin channel.

    Arguments:
        0: ARRAY - The player(s) to be added to the channel

    Example:
        [[player1, player2]] call MF_admin_fnc_addToAdminChannel

    Returns:
        void
*/

if !(isServer) exitWith {};

params [
    ["_units", [], [[]]]
];

// Check input
if (_units isEqualTo []) exitWith {
    [
        COMPONENT_STR,
        "ERROR",
        "Cannot add the unit(s) to the admin channel, the unit array is empty",
        false,
        1
    ] call EFUNC(main,log);
};

// Add units to the channel
GVAR(adminChannelID) radioChannelAdd _units;
