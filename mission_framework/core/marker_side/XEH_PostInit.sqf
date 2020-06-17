#include "script_component.hpp"

if !(GVARMAIN(moduleMarkerSide)) exitWith {};

if (hasInterface) then {
    call FUNC(setMarkerSide);
};
