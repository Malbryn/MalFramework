#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Creates the admin menu for the game masters.

    Arguments:
        -

    Example:
        call MF_admin_fnc_addAdminMenu

    Returns:
        void
*/

if !(hasInterface) exitWith {};

if !(IS_ADMIN_LOGGED || getPlayerUID player == GETPAVAR(GVARMAIN(missionMaker),"")) exitWith {};

// Admin menu
private _menu = ['Admin Menu', 'Admin Menu', '\a3\ui_f\data\GUI\Cfg\Hints\Commanding_ca.paa', {
    createDialog "MF_AdminMenu";
}, {!visibleMap}] call AFUNC(interact_menu,createAction);

[player, 1, ["ACE_SelfActions"], _menu] call AFUNC(interact_menu,addActionToObject);

// Admin chat
GVAR(adminChannelID) radioChannelAdd [player];
