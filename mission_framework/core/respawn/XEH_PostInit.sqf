#include "script_component.hpp"

if (hasInterface) then {
    // Killed event
    [player, "Killed", {
        params ["_unit", "_killer", "_instigator", "_useEffects"];

        [_unit, _killer, _instigator, _useEffects] call FUNC(eventKilled);
    }] call CFUNC(addBISEventHandler);

    // Respawn events
    [player, "Respawn", {
        params ["_unit", "_corpse"];

        [_unit, _corpse] call FUNC(eventRespawned);
    }] call CFUNC(addBISEventHandler);

    [QGVAR(respawnPlayer), {
        call FUNC(handleRespawn);
    }] call CFUNC(addEventHandler);

    // Group leader changed event
    ["leader", {
        // TODO
    }] call CFUNC(addPlayerEventHandler);

    call FUNC(setRespawntickets);
};

if (isServer) then {
    if GVAR(useWaveRespawn) then {
        // Wave respawn event
        [QGVAR(respawnWave), {
            // TODO
        }] call CFUNC(addEventHandler);

        // Automatic respawn waves - start counter
        if !GVAR(manualWaveRespawns) then {
            [QGVARMAIN(initFramework), {
                call FUNC(startRespawnCounter);
            }] call CFUNC(addEventHandler);
        };
    };
};
