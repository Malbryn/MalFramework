#include "script_component.hpp"

/*
    Author:
        Diwako

    Description:
        Checks if there's a free seat in the target unit's vehicle

    Arguments:
        0: OBJECT - Target unit to check

    Example:
        [bob] call MF_common_fnc_checkEmptySeat

    Returns:
        BOOLEAN
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

_freeSeat
