#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

ADDON = true;

// Global variables
GVAR(kills) = "TOTAL KILLS: 0";
GVAR(killCount) = 0;
GVAR(eventsArray) = [];

if (isDedicated) then {
    GVAR(friendlyFires) = ["FRIENDLY FIRE INCIDENTS: "];
    GVAR(civilianKills) = ["CIVILIAN KILLS: "];
} else {
    GVAR(friendlyFires) = "FRIENDLY FIRE INCIDENTS:<br/>";
    GVAR(civilianKills) = "CIVILIAN KILLS:<br/>";
}
