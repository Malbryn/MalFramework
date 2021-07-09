#include "script_component.hpp"

[player, "Killed", {
    params ["_unit", "_killer", "_instigator", "_useEffects"];

    [_unit, _killer, _instigator, _useEffects] call FUNC(eventKilled);
}] call CFUNC(addBISEventHandler);

[player, "Respawn", {
    params ["_unit", "_corpse"];

    [_unit, _corpse] call FUNC(eventRespawned);
}] call CFUNC(addBISEventHandler);

// Set the respawn tickets
call FUNC(setRespawntickets);
