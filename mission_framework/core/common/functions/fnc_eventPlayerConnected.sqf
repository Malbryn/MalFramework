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

addMissionEventHandler ["PlayerConnected", {
    params ["_id", "_uid", "_name", "_jip", "_owner", "_idstr"];
    private ["_side"];

    _side = _unit call BFUNC(objectSide);

    switch _side do {
        case west : {
            _array = GVAR(sideBlufor);
            _array params ["_total", "_current", "_tickets"];

            _array set [0, _total + 1];
            _array set [1, _current + 1];
            _array set [2, _tickets + 1];
        };

        case east : {
            _array = GVAR(sideRedfor);
            _array params ["_total", "_current", "_tickets"];

            _array set [0, _total + 1];
            _array set [1, _current + 1];
            _array set [1, _tickets + 1];
        };

        default {
            WARNING_2("Connect: invalid side of unit: %1 (%2)",_unit,_side);
        };
    };
}]
