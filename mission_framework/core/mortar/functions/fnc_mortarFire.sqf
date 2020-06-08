#include "script_component.hpp"

/*
    Author:
        PabstMirror

    Description:
        Drops random mortar shells inside a trigger area

    Arguments:
        0: STRING - Name of the trigger
        1: SCALAR - Number of the shells dropped
        2: SCALAR - Safe distance from the player
        3: STRING - Shell type (optional, default: "Sh_82mm_AMOS")

    Example:
        [mortarTrigger, 6, 50] spawn MF_mortar_fnc_mortarFire

    Returns:
        void
*/

params ["_trigger", "_shellCount", "_safeDistance", ["_shellType", "Sh_82mm_AMOS"]];
private ["_triggerPos", "_triggerRadius"];

_triggerPos = getPos _trigger;
_triggerRadius = (triggerArea _trigger)#0;

for "_index" from 1 to _shellCount do {
    _posToFireAt = [];
    while {(count _posToFireAt) == 0} do {
        _posToFireAt = [_triggerPos, (random _triggerRadius), (random 360)] call BFUNC(relPos);
        {
            if ((_x distance _posToFireAt) < _safeDistance) exitWith {_posToFireAt = [];};
        } forEach allUnits;
    };

    _posToFireAt set [2, 800];
    _shell = _shellType createVehicle _posToFireAt;
    _shell setPos _posToFireAt;
    _shell setVelocity [0, 0, -200];

    if ((_index % 4) == 3) then {
        sleep (3 + (random 1) / 4);
    } else {
        sleep random 0.1;
    };
};
