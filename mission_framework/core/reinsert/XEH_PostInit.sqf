#include "script_component.hpp"

if !(GVARMAIN(moduleHALO) && GVARMAIN(moduleMRV) && GVARMAIN(moduleRP)) exitWith {};

if (hasInterface) then {
    [QGVARMAIN(initFramework), {
        call FUNC(initPole);
    }] call CFUNC(addEventHandler);

    [QGVARMAIN(transferRP), {
        call FUNC(addRPMenu);
    }] call CFUNC(addEventHandler);
};
