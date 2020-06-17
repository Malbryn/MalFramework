#include "script_component.hpp"

if !(GVARMAIN(moduleGrassCutter)) exitWith {};

if (hasInterface) then {
    call FUNC(addGrassCutterMenu);
};
