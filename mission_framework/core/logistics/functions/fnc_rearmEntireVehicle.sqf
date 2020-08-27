#include "script_component.hpp"

/*
    Author:
        GitHawk (modified by Malbryn)

    Description:
        Starts progress bar for rearming an entire vehicle.

    Arguments:
        0: OBJECT - The rearm facility
        1: OBJECT - Player object
        2: OBJECT - The vehicle to rearm

    Example:
        [this, player, jet1] call MF_logistics_fnc_rearmEntireVehicle

    Returns:
        void
*/

if !(hasInterface) exitWith {};

params ["_object", "_player", "_vehicle"];

// Check the available resupply points
_rearmCount = GETVAR(_object,GVAR(rearmCount),0);

if (_rearmCount == 0) exitWith {
    ["No rearm points remaining", 2, ace_player, 12] call AFUNC(common,displayTextStructured);
};

if (_rearmCount != -1) then {
    _rearmCount = _rearmCount - 1;
    SETPVAR(_object,GVAR(rearmCount),_rearmCount);
};

[
    15,
    [_object, _vehicle, _player, _rearmCount],
    {
        param [0] params ["_object", "_vehicle", "_player", "_rearmCount"];

        [_object, _vehicle] call AFUNC(rearm,rearmEntireVehicleSuccess);

        if (_rearmCount != -1) then {
            [
                ["%1 has been rearmed.<br/>Remaining rearm points: %2", getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName"), _rearmCount],
                2,
                ace_player,
                12
            ] call AFUNC(common,displayTextStructured);
        };
    },
    {
        param [0] params ["_object", "_vehicle", "_player", "_rearmCount"];

        if (_rearmCount != -1) then {
            _rearmCount = _rearmCount + 1;
            SETPVAR(_object,GVAR(rearmCount),_rearmCount);
        };
    },
    format ["Rearming %1", getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName")],
    {
        param [0] params ["_object", "_vehicle", "_player", "_rearmCount"];

        private _rearmRange = GETVAR(_object,GVAR(rearmRange),20);
        _player distance _vehicle <= _rearmRange;
    },
    ["isnotinside"]
] call AFUNC(common,progressBar);
