#include "script_component.hpp"

if GVAR(useWaveRespawn) then {
    // Wave respawn event
    [QGVAR(respawnWave), {
        call FUNC(handleRespawn);
    }] call CFUNC(addEventHandler);

    // Automatic respawn waves - start counter
    if !GVAR(manualWaveRespawns) then {
        [QGVARMAIN(initFramework), {
            call FUNC(startRespawnCounter);
        }] call CFUNC(addEventHandler);
    };
};
