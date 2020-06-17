#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Adds an ACE interaction menu to the pilot seat of a plane.
        The pilot can use this action to paradrop the infantry using static line.

    Arguments:
        -

    Example:
        [plane1] call MF_static_line_fnc_addStaticLineDropMenu

    Returns:
        void
*/

if !(hasInterface) exitWith {};

params ["_plane"];

// Main catefory
private _menu = ['Static line', 'Static line', '\a3\ui_f\data\Map\VehicleIcons\iconParachute_ca.paa', {}, {player == driver (_this#0)}, {}, [_plane]] call AFUNC(interact_menu,createAction);

[_plane, 1, ["ACE_SelfActions"], _menu] call AFUNC(interact_menu,addActionToObject);

// Sub-category
_menu = ['Drop infantry', 'Drop infantry', '', {
    [_this#0] spawn FUNC(doParadrop);
}, {player == driver (_this select 0)}, {}, [_plane]] call AFUNC(interact_menu,createAction);

[_plane, 1, ["ACE_SelfActions", "Static line"], _menu] call AFUNC(interact_menu,addActionToObject);
