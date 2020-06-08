#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Create an ACE self-interaction menu for the Grass cutter script

    Arguments:
        -

    Example:
        call MF_grass_cutter_fnc_addGrassCutterMenu

    Returns:
        void
*/

private ["_menu"];

_menu = ['Cut grass', 'Cut grass', '', {
    call FUNC(cutGrass);
}, {!visibleMap}] call AFUNC(interact_menu,createAction);

[player, 1, ["ACE_SelfActions", "ACE_Equipment"], _menu] call AFUNC(interact_menu,addActionToObject);
