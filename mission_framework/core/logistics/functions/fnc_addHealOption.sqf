#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Adds heal option to an object (e.g. medical bag).
        This function has local effect.

    Arguments:
        0: OBJECT - The object

    Example:
        [this] call MF_logistics_fnc_addHealOption

    Returns:
        VOID
*/

if !(hasInterface) exitWith {};

params ["_object"];

if !(alive _object) exitWith {
    MSG("WARNING","(Logistics) Medic bag object was destroyed");
};

// Children code
_insertChildren = {
    params ["_target", "_player", "_params"];

    private _actions = [];
    private _menu;
    private _childStatement;

    {
        _childStatement = {
            [30, [_this], {
                [player, _this#0#0#2] call AFUNC(medical_treatment,fullHeal);
                ["Healing done", 2, ace_player, 12] call AFUNC(common,displayTextStructured);
            }, {
                ["Healing aborted", 2, ace_player, 12] call AFUNC(common,displayTextStructured);
            }, "Healing wounds", {_this#0#0#2 distance _this#0#0#0 < 8}] call AFUNC(common,progressBar);
        };

        _menu = [name _x, name _x, "", _childStatement, {true}, {}, _x] call AFUNC(interact_menu,createAction);
        _actions pushBack [_menu, [], _target];
    } forEach (_target nearEntities ["Man", 8]);

    _actions
};

// Main action
private _menu = [
    "Heal", "Heal", "\a3\ui_f\data\IGUI\Cfg\Actions\heal_ca.paa", {}, {}, _insertChildren, [], "", 2, [false, false, false, true, false]
] call AFUNC(interact_menu,createAction);

[_object, 0, [], _menu] call AFUNC(interact_menu,addActionToObject);
