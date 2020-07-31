#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Creates the HAB menu for the COs.

    Arguments:
        -

    Example:
        call MF_reinsertion_fnc_addHABMenu

    Returns:
        void
*/

if !(hasInterface) exitWith {};

// Create parent category
private  _menu = ['Platoon HAB', 'Platoon HAB', '\a3\ui_f\data\GUI\Cfg\Hints\icon_text\b_hq_ca.paa', {}, {!visibleMap && isNull objectParent player}] call AFUNC(interact_menu,createAction);

[player, 1, ["ACE_SelfActions"], _menu] call AFUNC(interact_menu,addActionToObject);

// Create child categories
// Deploy menu
_menu = ['Build Platoon HAB', 'Build Platoon HAB', '', {
    if (GVARMAIN(moduleHAB)) then {
        call FUNC(deployHAB);
    } else {
        ["Warning", ["Platoon HAB system is disabled in this mission"]] call BFUNC(showNotification);
    };
}, {true}] call AFUNC(interact_menu,createAction);

[player, 1, ["ACE_SelfActions", "Platoon HAB"], _menu] call AFUNC(interact_menu,addActionToObject);

// Remove menu
_menu = ['Remove Platoon HAB', 'Remove Platoon HAB', '', {
    if (GVARMAIN(moduleHAB)) then {
        call FUNC(removeHAB);
    } else {
        ["Warning", ["Platoon HAB system is disabled in this mission"]] call BFUNC(showNotification);
    };
}, {true}] call AFUNC(interact_menu,createAction);

[player, 1, ["ACE_SelfActions", "Platoon HAB"], _menu] call AFUNC(interact_menu,addActionToObject);
