#include "script_component.hpp"
#include "..\..\config\config.sqf"  // Import framework settings

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

ADDON = true;
