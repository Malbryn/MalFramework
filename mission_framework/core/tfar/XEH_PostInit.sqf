#include "script_component.hpp"

if (GVARMAIN(moduleTFAR)) exitWith {};

if (hasInterface) then {
    [QGVARMAIN(initFramework), {
        call FUNC(setChannels);
    }] call CFUNC(addEventHandler);
};
