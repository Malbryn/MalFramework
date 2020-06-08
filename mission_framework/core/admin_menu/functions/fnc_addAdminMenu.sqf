#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Create ACE self-interaction menu for the logged-in admin and mission creator

    Arguments:
        -

    Example:
        call MF_admin_menu_fnc_addAdminMenu

    Returns:
        void
*/

private ["_menu"];

if !(IS_ADMIN_LOGGED || getPlayerUID player == GETPAVAR(GVARMAIN(missionMaker),"")) exitWith {};

_menu = ['Admin Menu', 'Admin Menu', '\a3\ui_f\data\GUI\Cfg\Hints\Commanding_ca.paa', {}, {!visibleMap}] call AFUNC(interact_menu,createAction);
[player, 1, ["ACE_SelfActions"], _menu] call AFUNC(interact_menu,addActionToObject);
