#include "script_component.hpp"

/*
    Author:
        nkenny (modified by Malbryn)

    Description:
        -

    Arguments:
        -

    Example:
        -

    Returns:
        -
*/

private ["_newDist", "_all", "_target", "_group", "_distance"];

_newDist = _range; 
_all = (switchableUnits + playableUnits - entities "HeadlessClient_F");
_all = _all select {side _x != civilian && {side _x != side _group}};
_target = objNull;

{
    _distance = (leader _group) distance2d _x;
    if (_distance < _newDist && {getpos _x select 2 < 200}) then {_target = _x;_newDist = _distance;};
    true
} count _all; 

_target
