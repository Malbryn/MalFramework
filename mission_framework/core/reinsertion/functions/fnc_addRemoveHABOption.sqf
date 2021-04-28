#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Adds remove option to the HAB.

    Arguments:
        0: OBJECT - The HAB object

    Example:
        [this] call MF_reinsertion_fnc_addRemoveHABOption

    Returns:
        void
*/

if !(hasInterface) exitWith {};

params ["_obj"];

// Add remove option
private _menu = ['Remove HAB', 'Remove HAB', '', {
    call FUNC(removeHAB);
}, {[_this#0] call FUNC(canRemoveHAB)}] call AFUNC(interact_menu,createAction);

[_obj, 0, ["ACE_MainActions"], _menu] call AFUNC(interact_menu,addActionToObject);
