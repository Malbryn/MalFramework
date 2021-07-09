#include "script_component.hpp"

if (!GVARMAIN(moduleSupplyDrop) || GVARMAIN(isTvT)) exitWith {};

// Supply drop called event
[QGVAR(supplyDrop), {
    params ["_crate", "_dir", "_alt", "_playerPos"];

    [_crate, _dir, _alt, _playerPos] call FUNC(callSupplyDrop);
}] call CFUNC(addEventHandler);
