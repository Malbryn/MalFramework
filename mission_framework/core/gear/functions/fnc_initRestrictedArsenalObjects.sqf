#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Adds virtual items to the Arsenal object based on the player's role.

    Arguments:
        -

    Example:
        call MF_gear_fnc_initRestrictedArsenalObjects

    Returns:
        void
*/

if (!hasInterface) exitWith {};

private _objects = GVAR(arsenalObjects);

if (count _objects == 0) exitWith {
    [
        COMPONENT_STR,
        "DEBUG",
        "No restricted Arsenal objects detected",
        true,
        1
    ] call EFUNC(main,log);
};

private _role = GETVAR(player,EGVAR(gear,currentRole),"");

if (_role == "") exitWith {
    [
        COMPONENT_STR,
        "ERROR",
        "Player role is empty, the restricted Arsenal cannot be added",
        true,
        1
    ] call EFUNC(main,log);
};

// Create items array
#include "..\..\..\config\gear\arsenal\whitelist.sqf"

private _whitelist = createHashMapFromArray GVAR(arsenalWhitelist);
private _commonItems = _whitelist getOrDefault ["COMMON", []];
private _roleItems = _whitelist getOrDefault [_role, []];
private _allItems = _roleItems;

// Check items array
if (count _allItems == 0) then {
    [
        COMPONENT_STR,
        "DEBUG",
        format ["The parsed Arsenal whitelist is empty for this role (%1)", _role],
        true,
        1
    ] call EFUNC(main,log);
};

// Combine common and role-specific items and filter any duplicate items
_commonItems apply {
    _allItems pushBackUnique _x;
};

// Add items to Arsenal objects
_objects apply {
    [_x, _allItems, false] call AFUNC(arsenal,initBox);

    // Add option to scroll wheel menu
    _x addAction [
        "Open Arsenal",
        {
            params ["_target", "_caller", "_actionId", "_arguments"];

            [_target, _caller] call AFUNC(arsenal,openBox);
        },
        nil,
        5,
        false,
        true,
        "",
        "true",
        7,
        false,
        "",
        ""
    ];
};

[
    COMPONENT_STR,
    "INFO",
    format ["Initialised (%1) Arsenal objects", count _objects],
    false,
    1
] call EFUNC(main,log);
