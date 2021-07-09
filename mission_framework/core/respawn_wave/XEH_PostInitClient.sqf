#include "script_component.hpp"

if (!GVARMAIN(moduleWaveRespawn) || GVARMAIN(isTvT)) exitWith {};

[QGVARMAIN(initFramework), {
    setPlayerRespawnTime 10e10;
}] call CFUNC(addEventHandler);

[QGVARMAIN(respawnWaveCalled), {
    call FUNC(respawnPlayer);
}] call CFUNC(addEventHandler);

[QGVAR(transferWR), {
    call FUNC(addCallRespawnMenu);
}] call CFUNC(addEventHandler);

// Add respawn menu to CO
call FUNC(addCallRespawnMenu);
