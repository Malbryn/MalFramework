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

if GVARMAIN(isTvT) exitWith {
    [COMPONENT_STR, "INFO", "HAB is not available in TvT missions", true, 2] call EFUNC(main,log);
};

// Create parent category
private  _menu = ['Platoon HAB', 'Platoon HAB', '\a3\ui_f\data\GUI\Cfg\Hints\icon_text\b_hq_ca.paa', {}, {!visibleMap && isNull objectParent player}] call AFUNC(interact_menu,createAction);

[player, 1, ["ACE_SelfActions"], _menu] call AFUNC(interact_menu,addActionToObject);

// Deploy menu
_menu = ['Build Platoon HAB', 'Build Platoon HAB', '', {
    call FUNC(deployHAB);
}, {true}] call AFUNC(interact_menu,createAction);

[player, 1, ["ACE_SelfActions", "Platoon HAB"], _menu] call AFUNC(interact_menu,addActionToObject);
