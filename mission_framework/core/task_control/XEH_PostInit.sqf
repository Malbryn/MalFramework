#include "script_component.hpp"

if (!GVARMAIN(moduleTaskControl) || GVARMAIN(isTvT)) exitWith {};

if (hasInterface) then {
    [QGVARMAIN(initFramework), {
        call FUNC(addTaskControlMenu);
    }] call CFUNC(addEventHandler);
};
