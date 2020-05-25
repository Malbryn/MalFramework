#include "script_component.hpp"

if (hasInterface) then {
    [QGVARMAIN(initFramework), {
        call FUNC(addReassignCuratorMenu);
        call FUNC(assignCurator);
    }] call CFUNC(addEventHandler);
};


if (isServer) then {
    [QGVAR(registerCurator), {
        params ["_unit"];

        [_unit] call FUNC(createCurator);
    }] call CFUNC(addEventHandler);
    

    [QGVAR(reassignCurator), {
        params ["_unit"];

        [_unit] call FUNC(reassignCurator);
    }] call CFUNC(addEventHandler);
};
