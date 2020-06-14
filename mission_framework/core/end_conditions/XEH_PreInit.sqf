#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

ADDON = true;

// Global variables
GVAR(tasks) = [];
GVAR(civCas) = 0;
GVAR(civCasBlufor) = 0;
GVAR(civCasRedfor) = 0;
