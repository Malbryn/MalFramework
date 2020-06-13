#include "script_component.hpp"

/*
    Author:
        AZCoder (originally by JW)

    Description:
        Checks if the unit is inside

    Arguments:
        0: OBJECT - Unit to check

    Example:
        [player] call MF_snowfall_fnc_isInside

    Returns:
        BOOLEAN
*/

params [["_side", sideUnknown], ["_changeTotal", 0], ["_changeCurrent", 0], ["_changeTickets", 0]];

switch _side do {
    case west : {
        _array = GVAR(sideBlufor);
        _array params ["_total", "_current", "_tickets"];

        _array set [0, _total + _changeTotal];
        _array set [1, _current + _changeCurrent];
        _array set [2, _tickets + _changeTickets];
    };

    case east : {
        _array = GVAR(sideRedfor);
        _array params ["_total", "_current", "_tickets"];

        _array set [0, _total + _changeTotal];
        _array set [1, _current + _changeCurrent];
        _array set [1, _tickets + _changeTickets];
    };

    default {
        MSG_2("WARNING","Set side: invalid side of unit: %1 (%2)",_unit,_side);
    };
};
