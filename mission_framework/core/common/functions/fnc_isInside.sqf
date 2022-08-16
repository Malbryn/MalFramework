#include "script_component.hpp"

/*
    Author:
        AZCoder (originally by JW)

    Description:
        Checks if the unit is inside a building.

    Arguments:
        0: OBJECT - Unit to check

    Example:
        [player] call MF_common_fnc_isInside

    Returns:
        BOOLEAN
*/

params ["_unit"];

private _inside = false;
private _worldPos = getPosWorld _unit;
private _skyPos = _worldPos vectorAdd [0, 0, 50];
private _line = lineIntersectsSurfaces [_worldPos, _skyPos, _unit, objNull, true, 1, "GEOM", "NONE"];

if (_line isNotEqualTo []) then {
    private _result = _line#0;
    private _house = _result#3;

    if (_house isKindOf "House") then {
        _inside = true;
    };
};

_inside
