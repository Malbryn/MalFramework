#include "script_component.hpp"

/*
    Author:
        Diwako (modified by Malbryn)

    Description:
        Initialise the JIP teleport system and add an ACE self-interaction option to the player

    Arguments:
        -

    Example:
        call MF_jip_fnc_addJIPMenu

    Returns:
        void
*/

params ["_menu"];

if !(didJIP) exitWith {};

["JipTeleport"] call BFUNC(showNotification);
SETVAR(player,GVAR(spawnPos),getPos player);

_menu = ["Teleport to squad", "Teleport to squad", "\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\transport_ca.paa", {
    call FUNC(tpPlayer);
}, {!visibleMap && (player distance2D GETVAR(player,GVAR(spawnPos),0) < 200)}] call AFUNC(interact_menu,createAction);

[player, 1, ["ACE_SelfActions"], _menu] call AFUNC(interact_menu,addActionToObject);

// Remove option after x minutes (defined in config)
[{
    if (GVAR(jipAvailable)) then {
        [player, 1, ["ACE_SelfActions", "Teleport to squad"]] call AFUNC(interact_menu,removeActionFromObject);
        ["Warning", ["JIP teleport is no longer available!"]] call BFUNC(showNotification);
    };
}, [], GVAR(jipTimer)] call CFUNC(waitAndExecute);
