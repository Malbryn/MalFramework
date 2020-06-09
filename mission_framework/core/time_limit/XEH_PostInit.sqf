#include "script_component.hpp"

if !(GVARMAIN(moduleTimeLimitCheck)) exitWith {};

if (hasInterface) then {
    [QGVARMAIN(initFramework), {
        call FUNC(addTimeLimitCheckMenu);
    }] call CFUNC(addEventHandler);
};
