#include "script_component.hpp"

/*
    Author:
        GitHawk (modified by Malbryn)

    Description:
        Shows the resupplyable ammunition of all surrounding vehicles.

    Arguments:
        0: OBJECT - The object

    Example:
        [heli1] call MF_logistics_fnc_addRearmActions

    Returns:
        ARRAY
*/

if !(hasInterface) exitWith {};

params ["_object"];

private _rearmRange = GETVAR(_object,GVAR(rearmRange),20);

private _vehicles = nearestObjects [_object, ["AllVehicles"], _rearmRange];
_vehicles = _vehicles select {(_x != _object) && {!(_x isKindOf "CAManBase")}};

private _vehicleActions = [];

{
    private _vehicle = _x;
    private _icon = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "Icon");

    if !((_icon select [0, 1]) == "\") then {
        _icon = "";
    };

    private _action = [
        _vehicle,
        getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName"),
        _icon,
        {
            _this call FUNC(rearmEntireVehicle);
        },
        {true},
        {},
        _vehicle
    ] call AFUNC(interact_menu,createAction);

    _vehicleActions pushBack [_action, [], _object];
} forEach _vehicles;

_vehicleActions
