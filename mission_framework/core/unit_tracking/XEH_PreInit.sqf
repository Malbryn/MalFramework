#include "script_component.hpp"

if !(GVARMAIN(moduleUnitTracking)) exitWith {};

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

ADDON = true;

// Init map marker hash
GVAR(markerHash) = createHashMap;
