#include "script_component.hpp"

/*
    Author:
        nkenny

    Description:
        -

    Arguments:
        -

    Example:
        -

    Returns:
        -
*/

params ["_group", "_building"];

private _pos = [getpos _building, getpos leader _group] select isNull _building;
_enemy = (leader _group) findNearestEnemy _pos;

if (isNull _enemy || {_pos distance2d _enemy < 25}) exitWith {_enemy};

leader _group doSuppressiveFire _enemy;

ObjNull
