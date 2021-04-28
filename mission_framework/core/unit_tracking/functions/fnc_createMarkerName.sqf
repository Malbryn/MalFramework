#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Creates a unique marker name for the unit tracker.

    Arguments:
        0: GROUP or OBJECT - The group or object that will be tracked

    Example:
        [this] call MF_unit_tracking_fnc_createMarkerName

    Returns:
        STRING
*/

params [["_unit", objNull, [grpNull, objNull]]];

if (isNull _unit) exitWith {
    [COMPONENT_STR, "ERROR", "The group or object does not exist", true] call EFUNC(main,log);
};

// Create unique string
if (_unit isEqualType grpNull) then {
    _unit = leader _unit;
};

private _markerName = [_unit, "MF_"] call BFUNC(objectVar);

_markerName
