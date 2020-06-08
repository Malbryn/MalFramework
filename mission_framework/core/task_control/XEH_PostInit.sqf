#include "script_component.hpp"


if (hasInterface) then {
    [QGVARMAIN(initFramework), {
        call FUNC(addTaskControlMenu);
    }] call CFUNC(addEventHandler);
};
