#include "script_component.hpp"

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

[QGVARMAIN(initFramework), {
    setPlayerRespawnTime 10e10;
}] call CFUNC(addEventHandler);

[QGVAR(transferWR), {
    call FUNC(addCallRespawnMenu);
}] call CFUNC(addEventHandler);

// Set the respawn tickets
call FUNC(setRespawntickets);
