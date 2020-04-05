/*
 * Author:
 * PabstMirror
 *
 * Description:
 * Drops random mortar shells inside a trigger area
 *
 * Arguments:
 * _this select 0: STRING - Name of the trigger
 * _this select 1: SCALAR - Number of the shells dropped
 * _this select 2: SCALAR - Safe distance from the player
 *
 * Return Value:
 * void
 *
 * Example:
 * [mortarTrigger, 6, 50] spawn MF_fnc_mortarFire
 *
 */

if (!isServer) exitWith {};

//params ["_trigger", "_shellCount", ["_safeDistance", 60], ["shellType", "Sh_82mm_AMOS"]];

private ["_trigger", "_shellCount", "_safeDistance", "_shellType", "_triggerPos", "_triggerRadius"];

_trigger = _this select 0;
_shellCount = _this select 1;
_safeDistance = _this select 2;
_shellType = "Sh_82mm_AMOS";

_triggerPos = getPos _trigger;
_triggerRadius = (triggerArea _trigger) select 0;

for "_index" from 1 to _shellCount do {
    _posToFireAt = [];
    while {(count _posToFireAt) == 0} do {
        _posToFireAt = [_triggerPos, (random _triggerRadius), (random 360)] call BIS_fnc_relPos;
    {
        if ((_x distance _posToFireAt) < _safeDistance) exitWith {_posToFireAt = [];};
    } forEach allUnits;
    };

    // systemChat format ["Shell Incomming [%1]", (player distance _posToFireAt)];

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
