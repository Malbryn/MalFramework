#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        blank

    Arguments:
        -

    Example:
        [plane1] call MF_static_line_fnc_addStaticLineDropMenu

    Returns:
        void
*/

params ["_plane"];
private ["_menu"];

if !(hasInterface) exitWith {};

_menu = ['Static line drop', 'Static line drop', '\a3\ui_f\data\Map\VehicleIcons\iconParachute_ca.paa', {
    [_this#0] spawn FUNC(doParadrop);
}, {player == driver (_this select 0)}, {}, [_plane]] call AFUNC(interact_menu,createAction);

[_plane, 1, ["ACE_SelfActions"], _menu] call AFUNC(interact_menu,addActionToObject);
