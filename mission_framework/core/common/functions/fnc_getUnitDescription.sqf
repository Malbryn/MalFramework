#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Returns the unit's description excluding the CBA group labeling.
        Example: "Squad Leader@ALPHA" becomes "Squad Leader".

    Arguments:
        0: OBJECT - The unit

    Example:
        [this] call MF_common_fnc_getUnitDescription

    Returns:
        STRING
*/

params [["_unit", objNull]];

private _unitDesc = roleDescription _unit;

if (_unitDesc find "@" != -1) then {
    _unitDescRaw = _unitDesc splitString "@";
    _unitDesc = _unitDescRaw select 0;
};

_unitDesc
