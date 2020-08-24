#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Creates an ACE self-interaction menu for the game masters.

    Arguments:
        -

    Example:
        call MF_performance_fnc_addPlayerFPSMenu

    Returns:
        void
*/

if !(hasInterface) exitWith {};

if !(IS_ADMIN_LOGGED || getPlayerUID player == GETPAVAR(GVARMAIN(missionMaker),"")) exitWith {};

// Main category
private _menu = ['Toggle player FPS', 'Toggle player FPS', '', {
    [] call FUNC(togglePlayerFPS);
}, {true}] call AFUNC(interact_menu,createAction);

[player, 1, ["ACE_SelfActions", "Admin Menu"], _menu] call AFUNC(interact_menu,addActionToObject);
