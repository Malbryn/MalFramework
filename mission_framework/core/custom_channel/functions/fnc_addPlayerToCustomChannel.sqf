#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Add the selected player to the custom radio channel.

    Arguments:
        0: OBJECT - The selected player

    Example:
        [this] call MF_custom_channel_fnc_addPlayerToCustomChannel

    Returns:
        void
*/

params ["_unit"];

if !(hasInterface) exitWith {};

if (GVAR(channelID) == 0) exitWith {
    [COMPONENT_STR, "ERROR", "Custom channel does not exist", true] call EFUNC(main,log);
};

GVAR(channelID) radioChannelAdd [_unit];

// Save it for respawn
if (GVAR(playerCustomChannels) findIf {_x == GVAR(channelID)} == -1) then {
    GVAR(playerCustomChannels) pushBack GVAR(channelID);
};
