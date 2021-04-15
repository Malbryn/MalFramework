#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Sets a value of the given side in a TvT.

    Arguments:
        0: SIDE - Side to change
        1: SCALAR - Change of the total player number of the side
        2: SCALAR - Change of the current player number of the side
        3: SCALAR - Change of the respawn tickets of the side

    Example:
        [east, 0, 1, 1] call MF_common_fnc_setSideValue
        [west, -1, 0, -1] call MF_common_fnc_setSideValue

    Returns:
        -
*/

if !(isServer) exitWith {};

params [["_side", sideUnknown], ["_changeTotal", 0], ["_changeCurrent", 0], ["_changeTickets", 0]];

private _array = [];

switch _side do {
    case west : {
        _array = GVAR(sideBlufor);
        _array params ["_total", "_current", "_tickets"];

        _array set [0, _total + _changeTotal];
        _array set [1, _current + _changeCurrent];
        _array set [2, _tickets + _changeTickets];
        
        publicVariable QGVAR(sideBlufor);
    };

    case east : {
        _array = GVAR(sideRedfor);
        _array params ["_total", "_current", "_tickets"];

        _array set [0, _total + _changeTotal];
        _array set [1, _current + _changeCurrent];
        _array set [2, _tickets + _changeTickets];

        publicVariable QGVAR(sideRedfor);
    };

    default {
        [COMPONENT_STR, "WARNING", format ["Cannot set side value, invalid player side: %1", _side], true, 0] call EFUNC(main,log);
    };
};
