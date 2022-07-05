#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

ADDON = true;

// Global variables
GVAR(adminChannelID) = 0;
GVAR(admins) = [];
GVAR(currentAdmin) = [];
GVAR(isMonitoring) = false;
GVAR(serverFPS) = 999;
GVAR(serverFPSMin) = 999;
GVAR(toggleFPS) = false;
