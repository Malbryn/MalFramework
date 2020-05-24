#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Create ACE self-interaction menu for the logged-in admin and mission creator which opens the ACE Arsenal

    Arguments:
        -

    Example:
        [] call MF_arsenal_fnc_addArsenalMenu

    Returns:
        void
*/

private ["_menu"];

if !(IS_ADMIN_LOGGED || getPlayerUID player == GETPAVAR(GVARMAIN(missionMaker),"")) exitWith {};

_menu = ['Open Arsenal', 'Open Arsenal', '', {
    [player, player, true] call AFUNC(arsenal,openBox);
}, {true}] call AFUNC(interact_menu,createAction);

[player, 1, ["ACE_SelfActions", "Admin Menu"], _menu] call AFUNC(interact_menu,addActionToObject);
