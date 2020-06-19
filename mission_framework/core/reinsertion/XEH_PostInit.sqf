#include "script_component.hpp"

if (!GVARMAIN(moduleHALO) && !GVARMAIN(moduleMRV) && !GVARMAIN(moduleRP)) exitWith {};

if (hasInterface) then {
    [QGVARMAIN(transferRP), {
        call FUNC(addRPMenu);
    }] call CFUNC(addEventHandler);

    call FUNC(initPole);
};
