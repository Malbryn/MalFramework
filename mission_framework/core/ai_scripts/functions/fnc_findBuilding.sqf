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

private ["_building"];

_building = nearestobjects [(leader _group), ["house", "strategic", "ruins"], _range, true];
_building = _building select {count (_x buildingPos -1) > 0};
_building = _building select {count (_x getVariable ["LAMBS_CQB_cleared_" + str (side _group), [0, 0]]) > 0};
if (count _building > 0) exitWith {_building select 0};
ObjNull
