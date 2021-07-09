#include "script_component.hpp"

if !(GVARMAIN(moduleCBRN)) exitWith {};

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

ADDON = true;

GVAR(alertThreshold) = 0;
GVAR(isInZone) = false;
GVAR(isMuted) = false;
GVAR(timeLimitCurrent) = GVAR(timeLimit);
GVAR(zones) = [];
