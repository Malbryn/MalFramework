/*
 * Author:
 * Diwako
 *
 * Description:
 * Checks if there's free seat in the target unit's vehicle
 *
 * Arguments:
 * _this select 0: OBJECT - Target unit to check
 *
 * Return Value:
 * BOOLEAN
 *
 * Example:
 * [this] call MF_fnc_jipCheckEmptySeats
 *
 */

params [["_target", objNull]];

private _freeSeat = false;
private _hasDriver = vehicle _target emptyPositions "driver";
private _hasCommander = vehicle _target emptyPositions "commander";
private _hasGunner = vehicle _target emptyPositions "gunner";
private _hasDriver = vehicle _target emptyPositions "driver";
private _hasCargo = vehicle _target emptyPositions "cargo";

if (_hasDriver > 0 || _hasCommander > 0 || _hasGunner > 0 || _hasDriver > 0 || _hasCargo > 0) then {
    _freeSeat = true;
};

// Return
_freeSeat
