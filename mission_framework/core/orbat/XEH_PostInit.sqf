#include "script_component.hpp"

if !(GVARMAIN(moduleOrbat)) exitWith {};

if (hasInterface) then {
    call FUNC(initOrbat);
};
