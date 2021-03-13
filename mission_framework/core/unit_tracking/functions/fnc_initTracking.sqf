#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Adds a group or vehicle to the unit tracking system.
        Note: This module is compatible with the vehicle respawn module.

    Arguments:
        0: GROUP or OBJECT - The tracked group or object
        1: STRING - Marker classname
                    See: https://community.bistudio.com/wiki/CfgMarkers#Arma_3
        2: STRING - Text displayed (Optional, default: "")
        3: STRING - Marker colour (Optional, default: black)
                    See: https://community.bistudio.com/wiki/Arma_3:_CfgMarkerColors

    Example:
        [this, "b_inf", "Alpha", "colorBLUFOR"] call MF_unit_tracking_fnc_initTracking

    Returns:
        void
*/

if !(isServer) exitWith {};

params [["_unit", objNull, [grpNull, objNull]], ["_type", ""], ["_text", ""], ["_colour", ""]];

// Check params
if (isNull _unit) exitWith {
    [QGVARMAIN(systemMessage), ["ERROR", "(Unit tracking) Group or object does not exit!"]] call CFUNC(globalEvent);
};

if !(_unit isEqualTypeAny [objNull, grpNull]) exitWith {
    [QGVARMAIN(systemMessage), ["ERROR", "(Unit tracking) Incorrect unit type!"]] call CFUNC(globalEvent);
};

if (_type == "") exitWith {
    [QGVARMAIN(systemMessage), ["ERROR", "(Unit tracking) Marker classname is empty!"]] call CFUNC(globalEvent);
};

if (GVAR(refreshInterval) < 1) then {
    GVAR(refreshInterval) = 1;
    INFO("Invalid update interval, using default value of (1 second).");
};

// Create marker
private _markerPos = if (_unit isEqualType objNull) then [{getPos _unit}, {getPos (leader _unit)}];

private _markerName = [_unit] call FUNC(createMarkerName);
private _marker = createMarker [_markerName, _markerPos];

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
GVAR(markerHash) set [_marker, _unit];
