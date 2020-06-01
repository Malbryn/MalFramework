#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Add an ACE interaction menu to the player to check the remaining mission time

    Arguments:
        -

    Example:
        call MF_time_limit_fnc_addTimeLimitCheckMenu

    Returns:
        void
*/

if (GVARMAIN(moduleTimeLimit)) then {
    private ["_menu"];

    _menu = ['Check remaining time', 'Check remaining time', '\a3\ui_f\data\GUI\Rsc\RscDisplayArsenal\watch_ca.paa', {
        call FUNC(checkTimeLimit);
    }, {!visibleMap}] call AFUNC(interact_menu,createAction);

    [player, 1, ["ACE_SelfActions"], _menu] call AFUNC(interact_menu,addActionToObject);
};
