#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Creates an ACE self-interaction menu for the game masters which opens the ACE Arsenal.

    Arguments:
        -

    Example:
        call MF_arsenal_fnc_addArsenalMenu

    Returns:
        void
*/

if !(hasInterface) exitWith {};

if !(IS_ADMIN_LOGGED || getPlayerUID player == GETPAVAR(GVARMAIN(missionMaker),"")) exitWith {};

private _menu = ['Open Arsenal', 'Open Arsenal', '', {
    [player, player, true] call AFUNC(arsenal,openBox);
}, {true}] call AFUNC(interact_menu,createAction);

[player, 1, ["ACE_SelfActions", "Admin Menu"], _menu] call AFUNC(interact_menu,addActionToObject);
