#include "script_component.hpp"

if (hasInterface) then {
    [QGVARMAIN(initFramework), {
        call FUNC(addCredits);
    }] call CFUNC(addEventHandler);
};
