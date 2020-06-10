#include "script_component.hpp"

/*
    Author:
        BlackHawk

    Description:
        -

    Arguments:
        -

    Example:
        -

    Returns:
        void
*/

params ["_name", "_pos", "_alpha", "_color", "_index"];

private _brush = "Solid";
if (count _this > 5) then {
    _brush = _this select 5;
};

private _marker = "";
if (GVAR(firstGeneration)) then {
    _marker = createMarkerLocal [_name, _pos];
    _marker setMarkerShapeLocal "RECTANGLE";
    GVAR(markers) set [_index, _marker];
}
else {
    _marker = GVAR(markers) select _index;
};

_marker setMarkerBrushLocal _brush;
_marker setMarkerPosLocal _pos;
_marker setMarkerAlphaLocal _alpha;
_marker setMarkerColorLocal _color;
_marker setMarkerSizeLocal [GVAR(cellSize)/2,GVAR(cellSize)/2];
