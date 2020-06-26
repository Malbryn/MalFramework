#include "script_component.hpp"

if (!GVARMAIN(moduleSupplyDrop) || GVARMAIN(isTvT)) exitWith {};

if (hasInterface) then {
    [QGVAR(transferSD), {
        call FUNC(addSupplyDropMenu);
    }] call CFUNC(addEventHandler);

    call FUNC(addSupplyDropMenu);
};

if (isServer) then {
    [QGVAR(supplyDrop), {
        params ["_crate", "_dir", "_alt", "_playerPos"];

        [_crate, _dir, _alt, _playerPos] call FUNC(callSupplyDrop);
    }] call CFUNC(addEventHandler);
};
