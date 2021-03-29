#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

ADDON = true;

// Init global vars
GVAR(endTitle) = "";
GVAR(endDescription) = "";
GVAR(isWin) = true;
