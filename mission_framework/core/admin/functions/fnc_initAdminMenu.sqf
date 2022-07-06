#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Creates the admin menu for the game masters.

    Arguments:
        -

    Example:
        call MF_admin_fnc_initAdminMenu

    Returns:
        void
*/

if !(hasInterface) exitWith {};

// Create and add the admin ACE interaction option
private _menu = [
    'Admin Menu',
    'Admin Menu',
    '\a3\ui_f\data\GUI\Cfg\Hints\Commanding_ca.paa',
    {
        createDialog QGVARMAIN(AdminMenu);
    },
    {
        call FUNC(isGameMaster) && !visibleMap
    }
] call AFUNC(interact_menu,createAction);

[
    player,
    1,
    ["ACE_SelfActions"],
    _menu
] call AFUNC(interact_menu,addActionToObject);
