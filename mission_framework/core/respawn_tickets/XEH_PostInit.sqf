#include "script_component.hpp"

if (hasInterface) then {
    [QGVARMAIN(initFramework), {
        call FUNC(setRespawntickets);
    }] call CFUNC(addEventHandler);
};
