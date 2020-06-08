#include "script_component.hpp"

if !(GVARMAIN(moduleBriefing)) exitWith{};

if (hasInterface) then {
    call FUNC(setBriefing);
};
