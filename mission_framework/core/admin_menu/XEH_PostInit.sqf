#include "script_component.hpp"

if (hasInterface) then {
    [QGVARMAIN(initFramework), {
        call FUNC(addAdminMenu);
    }] call CFUNC(addEventHandler);
};
