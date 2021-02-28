#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Creates a unique marker name.

    Arguments:
        0: OBJECT - The object that will be marked

    Example:
        [this] call MF_unit_tracking_fnc_createMarkerName

    Returns:
        STRING
*/

params [["_object", objNull]];

if (isNull _object) exitWith {MSG("ERROR", "(Unit tracking) Unable to create unique marker name. The object does not exist!")};

// Create unique string
private _markerName = [_object, "MF_mrk_"] call BFUNC(objectVar);

_markerName
