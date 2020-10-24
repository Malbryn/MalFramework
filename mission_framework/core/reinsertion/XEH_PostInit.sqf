#include "script_component.hpp"

if (!GVARMAIN(moduleHALO) && !GVARMAIN(moduleMRV) && !GVARMAIN(moduleRP)) exitWith {};

if (hasInterface) then {
    [QGVAR(transferRP), {
        call FUNC(addRPMenu);
    }] call CFUNC(addEventHandler);

    [QGVAR(transferHAB), {
        call FUNC(addHABMenu);
    }] call CFUNC(addEventHandler);

    [QGVAR(createTPDestination), {
        params ["_name", "_pos"];

        [_name, _pos] call FUNC(createTPDestination);
    }] call CFUNC(addEventHandler);

    call FUNC(initPole);
};
