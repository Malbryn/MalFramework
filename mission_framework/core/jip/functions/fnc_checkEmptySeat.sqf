#include "script_component.hpp"

/*
    Author:
        Diwako

    Description:
        Check if there's free seat in the target unit's vehicle

    Arguments:
        0: OBJECT - Target unit to check

    Example:
        call MF_jip_fnc_checkEmptySeats

    Returns:
        BOOLEAN
*/

params [["_target", objNull]];
private ["_freeSeat", "_hasDriver", "_hasCommander", "_hasGunner", "_hasDriver", "_hasCargo"];

_freeSeat = false;
_hasDriver = vehicle _target emptyPositions "driver";
_hasCommander = vehicle _target emptyPositions "commander";
_hasGunner = vehicle _target emptyPositions "gunner";
_hasDriver = vehicle _target emptyPositions "driver";
_hasCargo = vehicle _target emptyPositions "cargo";

if (_hasDriver > 0 || _hasCommander > 0 || _hasGunner > 0 || _hasDriver > 0 || _hasCargo > 0) then {
    _freeSeat = true;
};

_freeSeat
