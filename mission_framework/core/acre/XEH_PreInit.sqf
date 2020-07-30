#include "script_component.hpp"

if !(GVARMAIN(moduleACRE)) exitWith {};

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

ADDON = true;

GVAR(channels) = [];

if (hasInterface) then {
    #include "settings.hpp"
    call FUNC(initRadios);
};
