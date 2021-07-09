#include "script_component.hpp"

if (!GVARMAIN(moduleHALO) && !GVARMAIN(moduleMRV) && !GVARMAIN(moduleRP) && !GVARMAIN(moduleHAB) && !GVARMAIN(moduleTP)) exitWith {};

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

[QGVAR(addTPToRPOption), {
    params ["_obj"];

    _obj addAction ["Reinsertion - Squad Rally Point", {
        call FUNC(tpToRP);
    }, nil, 1, true, true, "", "true", 12];
}] call CFUNC(addEventHandler);

[QGVAR(addRemoveRPOption), {
    params ["_obj"];

    [_obj] call FUNC(addRemoveRPOption);
}] call CFUNC(addEventHandler);

[QGVAR(addRemoveHABOption), {
    params ["_obj"];

    [_obj] call FUNC(addRemoveHABOption);
}] call CFUNC(addEventHandler);

// Init the TP pole(s)
call FUNC(initPole);
