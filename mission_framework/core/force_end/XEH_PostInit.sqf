#include "script_component.hpp"

if (hasInterface) then {
    [QGVARMAIN(initFramework), {
        call FUNC(addAdminScenarioEndControlMenu);
    }] call CFUNC(addEventHandler);
};
