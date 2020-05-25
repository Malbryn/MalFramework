#include "..\script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Add a "Reassign curator" option to the Admin menu

    Arguments:
        -

    Example:
        call MF_curator_fnc_addReassignCuratorMenu

    Returns:
        void
*/

private ["_menu"];

if !(IS_ADMIN_LOGGED || getPlayerUID player == GETPAVAR(GVARMAIN(missionMaker),"")) exitWith {};

private _menu = ['Reassign Curator', 'Reassign Curator', '', {
    [QGVAR(reassignCurator), [player]] call CFUNC(serverEvent);
}, {true}] call AFUNC(interact_menu,createAction);

[player, 1, ["ACE_SelfActions", "Admin Menu"], _menu] call AFUNC(interact_menu,addActionToObject);
