#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Creates an ACE self-interaction menu for the CO can be used for calling reinforcements.

    Arguments:
        -

    Example:
        call MF_respawn_fnc_addCallRespawnMenu

    Returns:
        void
*/

if !(hasInterface) exitWith {};

if !(GETVAR(player,EGVAR(player,isCO),false) && GVARMAIN(moduleWaveRespawn)) exitWith {};

// Respawn category
private _menu = ['Reinforcements', 'Reinforcements', '\a3\ui_f\data\IGUI\Cfg\simpleTasks\types\meet_ca.paa', {}, {!visibleMap}] call AFUNC(interact_menu,createAction);

[player, 1, ["ACE_SelfActions"], _menu] call AFUNC(interact_menu,addActionToObject);

// Respawn sub-categories
// Call
_menu = ['Call reinforcements', 'Call reinforcements', '', {
    if (GVAR(availableWaves) > 0) then {
        call FUNC(callReinforcements);
    } else {
        ["Warning", ["No more reinforcement wave remaining!"]] call BFUNC(showNotification);
    };
}, {true}] call AFUNC(interact_menu,createAction);

[player, 1, ["ACE_SelfActions", "Reinforcements"], _menu] call AFUNC(interact_menu,addActionToObject);

// Check
_menu = ['Check remaining reinforcement waves', 'Check remaining reinforcement waves', '', {
    [["Remaining reinforcement waves:<br/>%1", GVAR(availableWaves)], 2, ace_player, 12] call AFUNC(common,displayTextStructured);
}, {true}] call AFUNC(interact_menu,createAction);

[player, 1, ["ACE_SelfActions", "Reinforcements"], _menu] call AFUNC(interact_menu,addActionToObject);
