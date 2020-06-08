#include "script_component.hpp"

if (hasInterface) then {
    [QGVARMAIN(initFramework), {
        call FUNC(addArsenalMenu);
    }] call CFUNC(addEventHandler);
};
