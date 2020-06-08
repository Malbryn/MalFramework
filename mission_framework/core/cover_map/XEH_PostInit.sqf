#include "script_component.hpp"

if !(GVARMAIN(moduleCoverMap)) exitWith{};

if (hasInterface) then {
    call FUNC(coverMap);
};
