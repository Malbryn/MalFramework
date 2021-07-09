#include "script_component.hpp"

if (!GVARMAIN(moduleSupplyDrop) || GVARMAIN(isTvT)) exitWith {};

[QGVAR(transferSD), {
    call FUNC(addSupplyDropMenu);
}] call CFUNC(addEventHandler);

// Add supply drop menu
call FUNC(addSupplyDropMenu);
