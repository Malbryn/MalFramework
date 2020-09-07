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

params ["_group"];
private ["_distance"];

private _newDist = _range;
private _all = (switchableUnits + playableUnits - entities "HeadlessClient_F");
_all = _all select {side _x != civilian && {side _x != side _group}};
private _target = objNull;

{
    _distance = (leader _group) distance2d _x;
    if (_distance < _newDist && {getpos _x select 2 < 200}) then {_target = _x;_newDist = _distance;};
    true
} count _all;

_target
