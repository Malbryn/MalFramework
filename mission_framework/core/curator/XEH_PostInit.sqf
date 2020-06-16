#include "script_component.hpp"

if (!GVARMAIN(moduleCurator) || GVARMAIN(isTvT)) exitWith {};

if (hasInterface) then {
    call FUNC(addReassignCuratorMenu);
    call FUNC(assignCurator);
};


if (isServer) then {
    [QGVARMAIN(curatorRegistered), {
        params ["_unit"];

        [_unit] call FUNC(createCurator);
    }] call CFUNC(addEventHandler);
    

    [QGVARMAIN(curatorReassigned), {
        params ["_unit"];

        [_unit] call FUNC(reassignCurator);
    }] call CFUNC(addEventHandler);
};
