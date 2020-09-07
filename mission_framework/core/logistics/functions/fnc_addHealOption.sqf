#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Adds maintenance heal option to an object.
        It has local effect.

    Arguments:
        0: OBJECT - The object

    Example:
        [this] call MF_logistics_fnc_addHealOption

    Returns:
        BOOLEAN
*/

if !(hasInterface) exitWith {false};

params ["_object"];

if !(alive object) exitWith {false};

// Action menu
private _menu = ['Heal', 'Heal', '\a3\ui_f\data\IGUI\Cfg\Actions\heal_ca.paa', {
    [20, [], {
        [player, player] call AFUNC(medical_treatment,fullHeal);
    }, {}, "Healing wounds"] call AFUNC(common,progressBar);
}, {true}] call AFUNC(interact_menu,createAction);

[_object, 0, ["ACE_MainActions"], _menu] call AFUNC(interact_menu,addActionToObject);

true
