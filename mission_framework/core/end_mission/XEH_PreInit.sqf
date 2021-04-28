#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

ADDON = true;

// Init global vars
GVAR(civilianKills) = [];
GVAR(outroIsRunning) = false;
GVAR(deathCount) = 0;
GVAR(endTitle) = "";
GVAR(endDescription) = "";
GVAR(friendlyFires) = [];
GVAR(isWin) = true;
GVAR(killCount) = 0;
GVAR(killFeed) = [];
