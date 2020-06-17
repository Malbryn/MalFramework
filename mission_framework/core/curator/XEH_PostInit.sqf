#include "script_component.hpp"

if (!GVARMAIN(moduleCurator) || GVARMAIN(isTvT)) exitWith {};

if (isServer) then {
    [QGVAR(curatorRegistered), {
        params ["_unit"];

        [_unit] call FUNC(createCurator);
    }] call CFUNC(addEventHandler);
    

    [QGVAR(curatorReassigned), {
        params ["_unit"];

        [_unit] call FUNC(reassignCurator);
    }] call CFUNC(addEventHandler);
};

if (hasInterface) then {
    call FUNC(addReassignCuratorMenu);

    [QGVARMAIN(initFramework), {
        call FUNC(assignCurator);
    }] call CFUNC(addEventHandler);
};
