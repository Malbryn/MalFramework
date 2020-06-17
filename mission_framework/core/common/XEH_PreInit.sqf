#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

ADDON = true;

// Global variables
GVAR(sideBlufor) = [0, 0, GVARMAIN(respawnTicketsBlufor)];
GVAR(sideRedfor) = [0, 0, GVARMAIN(respawnTicketsRedfor)];
