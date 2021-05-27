#include "script_component.hpp"

if !(GVARMAIN(moduleCBRN)) exitWith {};

// Start check event
if (hasInterface) then {
    [QGVARMAIN(initFramework), {
        call FUNC(initZoneCheck);
    }] call CFUNC(addEventHandler);
};
