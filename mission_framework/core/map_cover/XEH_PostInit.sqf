#include "script_component.hpp"

if !(GVARMAIN(moduleMapCover)) exitWith {};

if (hasInterface) then {
    call FUNC(coverMap);
};
