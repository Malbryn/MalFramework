#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Adds remove option to the RP.

    Arguments:
        0: OBJECT - The RP object

    Example:
        [this] call MF_reinsertion_fnc_addRemoveRPOption

    Returns:
        void
*/

if !(hasInterface) exitWith {};

params ["_obj"];

// Add remove option
private _menu = ['Remove Rally Point', 'Remove Rally Point', '', {
    call FUNC(removeRP);
}, {[_this#0] call FUNC(canRemoveRP)}] call AFUNC(interact_menu,createAction);

[_obj, 0, ["ACE_MainActions"], _menu] call AFUNC(interact_menu,addActionToObject);
