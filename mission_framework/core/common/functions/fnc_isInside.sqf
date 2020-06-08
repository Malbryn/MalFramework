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

params ["_unit"];
private ["_inside", "_worldPos", "_skyPos", "_line", "_house"];

_inside = false;
_worldPos = getPosWorld _unit;
_skyPos = getPosWorld _unit vectorAdd [0, 0, 50];
_line = lineIntersectsSurfaces [_worldPos, _skyPos, _unit, objNull, true, 1, "GEOM", "NONE"];

if (count _line > 0) then {
    _result = _line#0;
    _house = _result#3;

    if (_house isKindOf "House") then {
        _inside = true;
    };
};

_inside
