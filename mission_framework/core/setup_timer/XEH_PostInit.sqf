#include "script_component.hpp"

if !(GVARMAIN(moduleSetupTimer)) exitWith {};

if (isServer) then {
    [QGVARMAIN(initFramework), {
        GVAR(startTime) = serverTime;
        publicVariable QGVAR(startTime);
    }] call CFUNC(addEventHandler);
};

call FUNC(initSetupTimer);
