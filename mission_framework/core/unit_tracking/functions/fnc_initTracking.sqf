#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Adds a unit to the unit tracking system.

    Arguments:
        0: OBJECT - The tracked unit
        1: STRING - Marker classname
        2: STRING - Text displayed (Optional, default: "")
        3: STRING - Marker colour (Optional, default: black)
                    See: https://community.bistudio.com/wiki/Arma_3:_CfgMarkerColors

    Example:
        [this, "b_inf", "Alpha", "colorBLUFOR"] call MF_unit_tracking_fnc_initTracking

    Returns:
        void
*/

if !(isServer) exitWith {};

params [["_object", objNull], ["_type", ""], ["_text", ""], ["_colour", ""]];

// Check params
if (isNull _object) exitWith {
    [QGVARMAIN(systemMessage), ["ERROR", "(Unit tracking) Unit does not exit!"]] call CFUNC(globalEvent);
};

if (_type == "") exitWith {
    [QGVARMAIN(systemMessage), ["ERROR", "(Unit tracking) Marker classname is empty!"]] call CFUNC(globalEvent);
};

if (_interval < 1) then {
    _interval = 1;
    INFO("Invalid update interval, using default value (1 second).");
};

// Create marker
private _markerName = call FUNC(createMarkerName);
private _marker = createMarker [_markerName, _object];

// Customise marker
_marker setMarkerType _type;
_marker setMarkerText _text;

// Marker colour
if (_colour == "" || {!isClass (configFile >> "CfgMarkerColors" >> _colour)}) then {
    _marker setMarkerColor "ColorBlack";
} else {
    _marker setMarkerColor _colour;
};

// Add marker to hash
GVAR(markerHash) set [_marker, _object];
