#include "script_component.hpp"

if (!GVARMAIN(moduleTaskControl) || GVARMAIN(isTvT)) exitWith {};

if (hasInterface) then {
    call FUNC(addTaskControlMenu);
};
