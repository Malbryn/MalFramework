#include "script_component.hpp"

/*
    Author:
        Diwako, johnb43

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

private _vehicle = vehicle _target;

private _hasDriver = _vehicle emptyPositions "driver";
private _hasCommander = _vehicle emptyPositions "commander";
private _hasGunner =_vehicle emptyPositions "gunner";
private _hasCargo = _vehicle emptyPositions "cargo";

_hasDriver > 0 || _hasCommander > 0 || _hasGunner > 0 || _hasCargo > 0
