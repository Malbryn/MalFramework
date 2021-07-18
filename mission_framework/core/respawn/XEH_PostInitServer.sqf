#include "script_component.hpp"

// Automatic respawn waves - start counter
if !(GVAR(waveRespawn) == AUTO) then {
    [QGVARMAIN(initFramework), {
        call FUNC(startRespawnCounter);
    }] call CFUNC(addEventHandler);
};

// Manual respawn waves - Register EH
if (GVAR(waveRespawn) == MANUAL) then {
    [QGVAR(respawnWave), {
        call FUNC(handleRespawn);
    }] call CFUNC(addEventHandler);
};
