#include "..\script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Adds a player to the admin channel.

    Arguments:
        0: ARRAY - The player(s) to be added to the channel

    Example:
        [[player1, player2]] call MF_admin_fnc_handleAddToAdminChannel

    Returns:
        void
*/

if !(isServer) exitWith {};

params [
    ["_units", [], [[]]]
];

// Check input
if (count _units == 0) exitWith {
    [
        COMPONENT_STR,
        "ERROR",
        "Cannot add the unit(s) to the admin channel, the unit array is empty",
        false,
        1
    ] call EFUNC(main,log);
};

// Add unit to the channel
GVAR(adminChannelID) radioChannelAdd _units;
