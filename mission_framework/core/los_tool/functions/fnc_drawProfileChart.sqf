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

(findDisplay GVAR(IDD) displayCtrl 51) ctrlRemoveEventHandler ["Draw", GVAR(profileTempDrawEH_ID)];

GVAR(chartDrawn) = true;

private _highest = -9000;
private _lowest = 9000;

GVAR(elevationOffset) = getNumber (configFile >> "CfgWorlds" >> worldName >> "elevationOffset");

GVAR(profileLength) = GVAR(profileStartPos) distance2D GVAR(profileEndPos);

private _pointsCount = GVAR(profileLength) / GVAR(chartAccuracy);

private _heightsArr = [];
for "_i" from 0 to _pointsCount do {
    private _pos = [
        (GVAR(profileStartPos) select 0) + ((GVAR(profileEndPos) select 0) - (GVAR(profileStartPos) select 0)) * _i / _pointsCount,
        (GVAR(profileStartPos) select 1) + ((GVAR(profileEndPos) select 1) - (GVAR(profileStartPos) select 1)) * _i / _pointsCount,
        0
    ];
    private _height = (ATLtoASL _pos) select 2;
    
    _heightsArr pushBack _height;
    
    if (_height > _highest) then {_highest = _height};
    if (_height < _lowest) then {_lowest = _height};
};

//vertical offset from start point, if end point is to the north, offset is negative
private _offset = 50;
private _horizontalShift = 0;

if (((GVAR(profileStartPos) select 0) + GVAR(profileLength) / 2) > worldSize) then {
    _horizontalShift = worldSize - ((GVAR(profileStartPos) select 0) + GVAR(profileLength) / 2);
};

if ((GVAR(profileStartPos) select 0) < 0) then {
    _horizontalShift = GVAR(profileStartPos) select 0;
};

GVAR(chartPolyNodes) = [];

//if second point is above first, we draw chart below and vice versa
//we do it to avoid obstructing view of target area
if ((GVAR(profileEndPos) select 1) > (GVAR(profileStartPos) select 1)) then {
    _offset = - _offset - (_highest - _lowest);
};

{
    GVAR(chartPolyNodes) pushBack [
        (GVAR(profileStartPos) select 0) + GVAR(profileLength) * _forEachIndex / _pointsCount - GVAR(profileLength) / 2 + _horizontalShift,
        //we substract lowest, so the chart doesn't go really far north
        //on map with high altitudes (like Takistan)
        (GVAR(profileStartPos) select 1) + _x + _offset - _lowest,
        0
    ];
} forEach _heightsArr;

GVAR(coordsToAltOffset) = -(GVAR(profileStartPos) select 1) - _offset + _lowest + (_highest - _lowest);

//last point of polyline is connected to first, we add 2 additional points below others
//so it loops around and doesn't look too bad
private _lastPoint = GVAR(chartPolyNodes) select (count GVAR(chartPolyNodes) - 1);
GVAR(chartPolyNodes) pushBack [
    _lastPoint select 0,
    (GVAR(profileStartPos) select 1) - 10 + _offset,
    0
];
private _firstPoint = GVAR(chartPolyNodes) select 0;
GVAR(chartPolyNodes) pushBack [
    _firstPoint select 0,
    (GVAR(profileStartPos) select 1) - 10 + _offset,
    0
];

GVAR(rightUpper) = [
    10 + ((GVAR(chartPolyNodes) select (count GVAR(chartPolyNodes) - 2)) select 0),
    10 + (GVAR(profileStartPos) select 1) + _highest + _offset - _lowest
];
GVAR(leftBottom) = [
    -10 + ((GVAR(chartPolyNodes) select (count GVAR(chartPolyNodes) - 1)) select 0),
    -10 + ((GVAR(chartPolyNodes) select (count GVAR(chartPolyNodes) - 1)) select 1)
];
GVAR(pointingDist) = (GVAR(chartPolyNodes) select 0) select 0;

GVAR(profileRunning) = false;

GVAR(profileDrawEH_ID) = (findDisplay GVAR(IDD) displayCtrl 51) ctrlAddEventHandler ["Draw", {
    private _ctrl = _this select 0;
    
    //Background
    _ctrl drawRectangle [
        [(GVAR(leftBottom) select 0) + ((GVAR(rightUpper) select 0) - (GVAR(leftBottom) select 0)) / 2, (GVAR(leftBottom) select 1) + ((GVAR(rightUpper) select 1) - (GVAR(leftBottom) select 1)) / 2],
        ((GVAR(rightUpper) select 0) - (GVAR(leftBottom) select 0)) / 2,
        ((GVAR(rightUpper) select 1) - (GVAR(leftBottom) select 1)) / 2,
        0,
        [1,1,1,1],
        "#(rgb,8,8,3)color(1,1,1,1)"
    ];
    //Line on map
    _ctrl drawLine [GVAR(profileStartPos), GVAR(profileEndPos), [0,0,0,1]];
    
    //Vertical lines
    private _xStart = (GVAR(chartPolyNodes) select (count GVAR(chartPolyNodes) - 1)) select 0;
    private _xEnd = (GVAR(chartPolyNodes) select (count GVAR(chartPolyNodes) - 2)) select 0;
    private _bottom = (GVAR(leftBottom) select 1) + 10;
    private _top = (GVAR(rightUpper) select 1) - 10;
    for "_i" from 100 to _xEnd - _xStart step 100 do {
        _ctrl drawLine [[_xStart + _i, _bottom], [_xStart + _i, _top], [0,0,0,0.5]];
        _ctrl drawIcon [
            "#(argb,8,8,3)color(0,0,0,0)",
            [0,0,0,0.5],
            [_xStart + _i, _top + 2],
            24,
            24,
            0,
            str _i + "m",
            false,
            (0.004 * 0.15) * 10^(abs log (ctrlMapScale _ctrl)),
            "TahomaB",
            "center"
        ];
    };
    
    //Horizontal lines
    private _yBottom = (GVAR(leftBottom) select 1) + 10;
    private _yTop = (GVAR(rightUpper) select 1) - 10;
    private _left = (GVAR(leftBottom) select 0) + 10;
    private _right = (GVAR(rightUpper) select 0) - 10;
    
    //pointing line
    _ctrl drawLine [[GVAR(pointingDist), _top + 5], [GVAR(pointingDist), _bottom - 5], [0,0.8,0,1]];
    
    private _pointedPos = [
        (GVAR(profileStartPos) select 0) + ((GVAR(profileEndPos) select 0) - (GVAR(profileStartPos) select 0)) * (GVAR(pointingDist) - ((GVAR(chartPolyNodes) select 0) select 0)) / GVAR(profileLength),
        (GVAR(profileStartPos) select 1) + ((GVAR(profileEndPos) select 1) - (GVAR(profileStartPos) select 1)) * (GVAR(pointingDist) - ((GVAR(chartPolyNodes) select 0) select 0)) / GVAR(profileLength)
    ];
    
    //dot showing location from graph
    _ctrl drawIcon [
        "\A3\ui_f\data\map\markers\military\dot_CA.paa",
        [0,0.8,0,1],
        _pointedPos,
        //(10 * 0.15) * 10^(abs log (ctrlMapScale _ctrl)),
        40,
        //(10 * 0.15) * 10^(abs log (ctrlMapScale _ctrl)),
        40,
        0,
        "",
        false,
        0,
        "TahomaB",
        "center"
    ];
    
    //draw thicker line at start altitude
    _ctrl drawLine [[_left, ((GVAR(chartPolyNodes) select 0) select 1)], [_right, ((GVAR(chartPolyNodes) select 0) select 1)], [0,0,0.8,1]];
    
    //height icons and lines
    _ctrl drawIcon [
        "#(argb,8,8,3)color(0,0,0,0)",
        [0,0,0,0.5],
        [_left - 4, ((GVAR(chartPolyNodes) select 0) select 1)],
        24,
        24,
        0,
        str round (((GVAR(chartPolyNodes) select 0) select 1) + GVAR(coordsToAltOffset) + GVAR(elevationOffset)) + "m",
        false,
        (0.004 * 0.15) * 10^(abs log (ctrlMapScale _ctrl)),
        "TahomaB",
        "center"
    ];
    for "_i" from ((GVAR(chartPolyNodes) select 0) select 1) + 10 to _yTop step 10 do {
        _ctrl drawLine [[_left, _i], [_right, _i], [0,0,0,0.5]];
        _ctrl drawIcon [
            "#(argb,8,8,3)color(0,0,0,0)",
            [0,0,0,0.5],
            [_left - 4, _i],
            24,
            24,
            0,
            str round (_i + GVAR(coordsToAltOffset) + GVAR(elevationOffset)) + "m",
            false,
            (0.003 * 0.15) * 10^(abs log (ctrlMapScale _ctrl)),
            "TahomaB",
            "center"
        ];
    };
    for "_i" from ((GVAR(chartPolyNodes) select 0) select 1) - 10 to _yBottom step -10 do {
        _ctrl drawLine [[_left, _i], [_right, _i], [0,0,0,0.5]];
        _ctrl drawIcon [
            "#(argb,8,8,3)color(0,0,0,0)",
            [0,0,0,0.5],
            [_left - 4, _i],
            24,
            24,
            0,
            str round (_i + GVAR(coordsToAltOffset) + GVAR(elevationOffset)) + "m",
            false,
            (0.003 * 0.15) * 10^(abs log (ctrlMapScale _ctrl)),
            "TahomaB",
            "center"
        ];
    };
    
    //Start and end icons
    _ctrl drawIcon [
        "#(argb,8,8,3)color(0,0,0,0)",
        [0,0,0,0.5],
        [_xStart, _bottom - 2],
        24,
        24,
        0,
        "start",
        false,
        (0.004 * 0.15) * 10^(abs log (ctrlMapScale _ctrl)),
        "TahomaB",
        "center"
    ];
    _ctrl drawIcon [
        "#(argb,8,8,3)color(0,0,0,0)",
        [0,0,0,0.5],
        [_xEnd, _bottom - 2],
        24,
        24,
        0,
        "end",
        false,
        (0.004 * 0.15) * 10^(abs log (ctrlMapScale _ctrl)),
        "TahomaB",
        "center"
    ];
    
    //start and end icons (line)
    _ctrl drawIcon [
        "#(argb,8,8,3)color(0,0,0,0)",
        [0,0,0,0.5],
        [GVAR(profileStartPos) select 0, (GVAR(profileStartPos) select 1) - 4],
        24,
        24,
        0,
        "start",
        false,
        0.06,
        "TahomaB",
        "right"
    ];
    _ctrl drawIcon [
        "#(argb,8,8,3)color(0,0,0,0)",
        [0,0,0,0.5],
        [GVAR(profileEndPos) select 0, (GVAR(profileEndPos) select 1) - 4],
        24,
        24,
        0,
        "end",
        false,
        0.06,
        "TahomaB",
        "right"
    ];
    
    //X for closing
    _ctrl drawIcon [
        "#(argb,8,8,3)color(0,0,0,0)",
        [0,0,0,1],
        [(GVAR(rightUpper) select 0) - 2.5, (GVAR(rightUpper) select 1) - 6],
        24,
        24,
        0,
        "X",
        false,
        (0.008 * 0.15) * 10^(abs log (ctrlMapScale _ctrl)),
        "TahomaB",
        "center"
    ];
    
    _ctrl drawPolygon [GVAR(chartPolyNodes), [0,0,0,1]];
}];
