#include "script_component.hpp"

if !(GVARMAIN(modulecoverMap)) exitWith{};

if (hasInterface) then {
    call FUNC(coverMap);
};
