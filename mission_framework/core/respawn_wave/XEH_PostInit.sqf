#include "script_component.hpp"

if !(GVARMAIN(moduleWaveRespawn)) exitWith {};

if (hasInterface) then {
    [QGVARMAIN(initFramework), {
        call FUNC(addCallRespawnMenu);
        setPlayerRespawnTime 999999;
    }] call CFUNC(addEventHandler);

    [QGVARMAIN(respawnWaveCalled), {
        call FUNC(respawnPlayer);
    }] call CFUNC(addEventHandler);

    [QGVARMAIN(transferWR), {
        call FUNC(addCallRespawnMenu);
    }] call CFUNC(addEventHandler);
};
