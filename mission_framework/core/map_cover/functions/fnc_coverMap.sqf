#include "script_component.hpp"

/*
    Author:
        BlackHawk, PIZZADOX and Karel Moricky

    Description:
        Covers the map area outside of the AO.

    Arguments:
        0: STRING - Name of AO marker

    Example:
        ["mrk_ao"] call MF_map_cover_fnc_coverMap

    Returns:
        void
*/

if !(hasInterface) exitWith {};

private _marker = GVAR(aoMarker);

// Check if the marker exists
if (getMarkerType _marker == "") then {
    [COMPONENT_STR, "WARNING", "AO marker is not found"] call EFUNC(main,log); 
};

private _sx = (getMarkerSize _marker)#0;
private _sy = (getMarkerSize _marker)#1;
private _p = getMarkerPos _marker;
private _px = _p#0;
private _py = _p#1;
private _a = markerDir _marker;
private _sxo = _sx;
private _syo = _sy;
private _mainS = 20000;
private _mainBS = 50;
private _zoomlevel = 0.4;

_marker setMarkerAlphaLocal 0;

if ((_a > 0 && _a <= 90) || (_a > 180 && _a <= 270)) then {
    private ["_temp"];

    _temp = _sx;
    _sx = _sy;
    _sy = _temp;
};

private _customColour = GVAR(colour);
private _colours = ["colorBlack", "colorBlack", _customColour, "colorGreen", _customColour, /**/"colorBlack"/**/, _customColour, _customColour];

{
    private ["_i", "_s", "_w", "_bw"];

    _x params ["_a"];
    _i = _forEachIndex;

    _a = _a mod 360;
    if (_a < 0) then {_a = _a + 360};

    _s = _sx;
    _w = 2 * _mainS+_sy;
    _bw = _sy + _mainBS;

    if !((_a > 0 && _a <= 90) || (_a > 180 && _a <= 270)) then {
        _s = _sy;
        _w = _sx + 2 * _mainBS;
        _bw = _sx + _mainBS;
    };

    _pos_x = _px + (sin _a) * (_mainS + _s + _mainBS);
    _pos_y = _py + (cos _a) * (_mainS + _s + _mainBS);

    {
        private ["_marker"];

        _x params ["_color"];

        _marker = createMarkerLocal ["ao_" + str _i + str _forEachIndex, [_pos_x, _pos_y]];

        _marker setMarkerSizeLocal [_w,_mainS];
        _marker setMarkerDirLocal _a;
        _marker setMarkerShapeLocal "rectangle";
        _marker setMarkerBrushLocal "solid";
        _marker setMarkerColorLocal _color;

        if (_forEachIndex == 5) then {
            _marker setMarkerBrushLocal "grid";
        };

    } forEach _colours;


    _pos_x = _px + (sin _a) * (_mainBS / 2 + _s);
    _pos_y = _py + (cos _a) * (_mainBS / 2 + _s);

    for "_m" from 0 to 7 do {
        _marker = createMarkerLocal ["ao_w_" + str _i + str _m,[_pos_x, _pos_y]];

        _marker setMarkerSizeLocal [_bw, _mainBS/2];
        _marker setMarkerDirLocal _a;
        _marker setMarkerShapeLocal "rectangle";
        _marker setMarkerBrushLocal "solid";
        _marker setMarkerColorLocal "colorwhite";
    };

} forEach [_a, _a + 90, _a + 180, _a + 270];

_marker = createMarkerLocal ["ao_b_1", [_px, _py]];

_marker setMarkerSizeLocal [_sxo, _syo];
_marker setMarkerDirLocal _a;
_marker setMarkerShapeLocal "rectangle";
_marker setMarkerBrushLocal "border";
_marker setMarkerColorLocal "colorBlack";

_marker = createMarkerLocal ["ao_b_2", [_px, _py]];

_marker setMarkerSizeLocal [_sxo+_mainBS, _syo+_mainBS];
_marker setMarkerDirLocal _a;
_marker setMarkerShapeLocal "rectangle";
_marker setMarkerBrushLocal "border";
_marker setMarkerColorLocal "colorBlack";

[_zoomlevel, _p] spawn {
    params [["_zoomlevel", 0.4], "_p"];
    disableSerialization;
    waitUntil {visibleMap};
    MapAnimAdd [0, _zoomlevel, _p];
    MapAnimCommit;
    waitUntil {mapAnimDone};
};
