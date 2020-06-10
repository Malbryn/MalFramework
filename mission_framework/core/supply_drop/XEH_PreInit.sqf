#include "script_component.hpp"

if (!GVARMAIN(moduleSupplyDrop) || GVARMAIN(isTvT)) exitWith {};

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

ADDON = true;

// Global variables
GVAR(supplyCrates) = [];
GVAR(plane) = objNull;
GVAR(chute) = objNull;
