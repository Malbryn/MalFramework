#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

ADDON = true;

// Global variables
EGVAR(end_conditions,civCas) = 0;
GVAR(stat_ck) = [];
