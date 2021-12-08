#include "script_component.hpp"

// Killed event
[player, "Killed", {
    params ["_unit", "_killer", "_instigator", "_useEffects"];

    [_unit, _killer, _instigator, _useEffects] call FUNC(eventKilled);
}] call CFUNC(addBISEventHandler);

// Respawn event
[player, "Respawn", {
    params ["_unit", "_corpse"];

    [_unit, _corpse] call FUNC(eventRespawned);
}] call CFUNC(addBISEventHandler);

// Respawn player
[QGVAR(respawnPlayer), {
    call FUNC(handleRespawn);
}] call CFUNC(addEventHandler);

// Transfer respawn menu
[QGVAR(transferRespawnMenu), {
    call FUNC(addCallRespawnMenu);
}] call CFUNC(addEventHandler);

// Set the respawn tickets
[player, GVAR(tickets)] call FUNC(setRespawntickets);

// Init player's status
SETVAR(player,GVAR(isDead),false);
