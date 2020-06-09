#include "script_component.hpp"

if !(GVARMAIN(moduleCurator)) exitWith {};

if (hasInterface) then {
    [QGVARMAIN(initFramework), {
        call FUNC(addReassignCuratorMenu);
        call FUNC(assignCurator);
    }] call CFUNC(addEventHandler);
};


if (isServer) then {
    [QGVARMAIN(registerCurator), {
        params ["_unit"];

        [_unit] call FUNC(createCurator);
    }] call CFUNC(addEventHandler);
    

    [QGVARMAIN(reassignCurator), {
        params ["_unit"];

        [_unit] call FUNC(reassignCurator);
    }] call CFUNC(addEventHandler);
};
