#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Adds an ACE interaction menu to the player that allows the player to check the remaining mission time.

    Arguments:
        -

    Example:
        call MF_end_conditions_fnc_addTimeLimitCheckMenu

    Returns:
        void
*/

if !(hasInterface) exitWith {};

private _menu = ['Check remaining time', 'Check remaining time', '\a3\ui_f\data\GUI\Rsc\RscDisplayArsenal\watch_ca.paa', {
    call FUNC(checkTimeLimit);
}, {!visibleMap}] call AFUNC(interact_menu,createAction);

[player, 1, ["ACE_SelfActions"], _menu] call AFUNC(interact_menu,addActionToObject);
