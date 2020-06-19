#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Creates an ACE self-interaction menu that can be used to cut the grass around the player.

    Arguments:
        -

    Example:
        call MF_grass_cutter_fnc_addGrassCutterMenu

    Returns:
        void
*/

if !(hasInterface) exitWith {};

private _menu = ['Cut grass', 'Cut grass', '', {
    call FUNC(cutGrass);
}, {!visibleMap && isNull objectParent player}] call AFUNC(interact_menu,createAction);

[player, 1, ["ACE_SelfActions", "ACE_Equipment"], _menu] call AFUNC(interact_menu,addActionToObject);
