#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Creates the RP menu for the group leader.

    Arguments:
        -

    Example:
        call MF_reinsertion_fnc_addRPMenu

    Returns:
        void
*/

if !(hasInterface) exitWith {};

// Create parent category
private _menu = ['Rally Point', 'Rally Point', '\a3\ui_f\data\GUI\Cfg\Hints\icon_text\b_inf_ca.paa', {}, {!visibleMap && isNull objectParent player}] call AFUNC(interact_menu,createAction);

[player, 1, ["ACE_SelfActions"], _menu] call AFUNC(interact_menu,addActionToObject);

// Deploy menu
_menu = ['Deploy Rally Point', 'Deploy Rally Point', '', {
    call FUNC(deployRP);
}, {true}] call AFUNC(interact_menu,createAction);

[player, 1, ["ACE_SelfActions", "Rally Point"], _menu] call AFUNC(interact_menu,addActionToObject);
