#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

ADDON = true;

// Global variables
GVAR(friendlyFires) = ["FRIENDLY FIRE INCIDENTS: "];
GVAR(civilianKills) = ["CIVILIAN KILLS: "];
