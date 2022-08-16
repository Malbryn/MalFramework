#include "script_component.hpp"

/*
    Author:
        Diwako (modified by Malbryn), johnb43

    Description:
        Checks target for a valid unit in the player's group

    Arguments:
        -

    Example:
        call MF_jip_fnc_chooseTarget

    Returns:
        OBJECT
*/

if !(hasInterface) exitWith {};

private _target = objNull;
private _leader = leader group player;

// If player is not the leader and the leader is alive then the leader is the target
if (player != _leader && {alive _leader}) then {
    _target = _leader;
} else {
    // If player is the leader or the leader is dead then pick the next best one
    _target = [player] call EFUNC(common,selectTarget);
};

_target
