#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Creates a unique marker name.

    Arguments:
        0: GROUP or OBJECT - The group or object that will be marked

    Example:
        [this] call MF_unit_tracking_fnc_createMarkerName

    Returns:
        STRING
*/

params [["_unit", objNull, [grpNull, objNull]]];

if (isNull _unit) exitWith {MSG("ERROR", "(Unit tracking) Unable to create unique marker name. The group or object does not exist!")};

// Create unique string
if (_unit isEqualType grpNull) then {
    _unit = leader _unit;
};

private _markerName = [_unit, "MF_"] call BFUNC(objectVar);

_markerName
