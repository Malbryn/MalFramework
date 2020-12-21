#include "script_component.hpp"

// The custom channels the player is part of
// Init before the module check
GVAR(playerCustomChannels) = [];

if !(GVARMAIN(moduleCustomChannel)) exitWith {};

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

ADDON = true;

GVAR(channelID) = 0;

// Init custom channel
if (isServer) then {
    GVAR(channelID) = radioChannelCreate [GVAR(channelColour), GVAR(channelName), "[%UNIT_GRP_NAME] %UNIT_NAME", [], true];
    publicVariable QGVAR(channelID);
};
