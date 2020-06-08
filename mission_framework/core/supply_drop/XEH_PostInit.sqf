#include "script_component.hpp"

if !(GVARMAIN(moduleSupplyDrop)) exitWith{};

if (hasInterface) then {
    [QGVARMAIN(initFramework), {
        call FUNC(addSupplyDropMenu);
    }] call CFUNC(addEventHandler);

    [QGVARMAIN(transferSD), {
        call FUNC(addSupplyDropMenu);
    }] call CFUNC(addEventHandler);
};

if (isServer) then {
    [QGVAR(dropSupply), {
        params ["_crate", "_dir", "_alt", "_playerPos"];

        [_crate, _dir, _alt, _playerPos] call FUNC(callSupplyDrop);
    }] call CFUNC(addEventHandler);
};
