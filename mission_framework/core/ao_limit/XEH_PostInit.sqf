#include "script_component.hpp"

if !(GVARMAIN(moduleAOLimit)) exitWith {};

if (hasInterface) then {
    call FUNC(initAOLimit);
};
