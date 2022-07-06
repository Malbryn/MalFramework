#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Resolves player units by their UID.
        UID's with no player units will be omitted.

    Arguments:
        0: ARRAY - Array of UID strings

    Example:
        [["0000", "0001"]] call MF_common_fnc_getUnitsByUID

    Returns:
        ARRAY: array of players objects
*/

params [
    ["_uidArray", [], [[]]]
];

private _units = [];

{
    private _currentUnit = _x call BFUNC(getUnitByUID);
    
    if !(isNull _currentUnit) then {
        PUSH(_units,_currentUnit);
    };
} forEach _uidArray;

_units;
