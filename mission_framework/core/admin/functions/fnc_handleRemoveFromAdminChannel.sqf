#include "..\script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Removes a player from the admin channel.

    Arguments:
        0: ARRAY - The player(s) to be removed from the channel

    Example:
        [[player1, player2]] call MF_admin_fnc_handleRemoveFromAdminChannel

    Returns:
        void
*/

if !(isServer) exitWith {};

params [
    ["_unit", [], [[]]]
];

// Check input
if (count _units == 0) exitWith {
    [
        COMPONENT_STR,
        "ERROR",
        "Cannot remove the unit(s) from the admin channel, the unit array is empty",
        false,
        1
    ] call EFUNC(main,log);
};

// Remove unit from the channel
GVAR(adminChannelID) radioChannelRemove _unit;
