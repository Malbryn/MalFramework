#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Create an ACE self-interaction menu for the the CO to be able to call reinforcements

    Arguments:
        -

    Example:
        call MF_respawn_wave_fnc_addCallRespawnMenu

    Returns:
        void
*/

if (GETVAR(player,EGVAR(player,isCO),false) && GVARMAIN(moduleWaveRespawn)) then {

    private ["_menu"];

    // Respawn category
    _menu = ['Reinforcements', 'Reinforcements', '\a3\ui_f\data\IGUI\Cfg\simpleTasks\types\meet_ca.paa', {}, {!visibleMap}] call AFUNC(interact_menu,createAction);
    [player, 1, ["ACE_SelfActions"], _menu] call AFUNC(interact_menu,addActionToObject);

    // Respawn sub-categories
    // Call
    _menu = ['Call reinforcements', 'Call reinforcements', '', {
        if (GVAR(availableWaves) > 0) then {
            private ["_deadPlayer", "_count"];

            _deadPlayers = (allPlayers select {!alive _x});
            _count = 0;

            // Check if the player has respawn tickets left
            if (GETVAR(player,EGVAR(respawn_tickets,amount),-1) != -1) then { // Respawn tickets are enabled - count players with remaining tickets only
                {
                    if (GETVAR(_x,EGVAR(respawn_tickets,amount),-1) > 0) then {
                        _count = _count + 1;
                    };
                } forEach _deadPlayers;
            } else { // Respawn tickets are disabled - count every dead player
                _count = count _deadPlayers;
            };

            if (_count == 0) exitWith {
                [["There are no dead players or dead players with respawn tickets"], 2, ace_player, 12] call AFUNC(common,displayTextStructured);
            };

            [["Reinforcements:<br/>%1 player(s)", _count], 2, ace_player, 12] call AFUNC(common,displayTextStructured);

            [QGVARMAIN(respawnWaveCalled), [], _deadPlayers] call CFUNC(targetEvent);

            GVAR(availableWaves) = GVAR(availableWaves) - 1;
            publicVariable "GVAR(availableWaves)";
        } else {
            ["Warning", ["No more reinforcement wave ramaining!"]] call BFUNC(showNotification);
        };
    }, {true}] call AFUNC(interact_menu,createAction);

    [player, 1, ["ACE_SelfActions", "Reinforcements"], _menu] call AFUNC(interact_menu,addActionToObject);

    // Check
    _menu = ['Check remaining reinforcement waves', 'Check remaining reinforcement waves', '', {
        [["Remaining reinforcement waves:<br/>%1", GVAR(availableWaves)], 2, ace_player, 12] call AFUNC(common,displayTextStructured);
    }, {true}] call ace_interact_menu_fnc_createAction;

    [player, 1, ["ACE_SelfActions", "Reinforcements"], _menu] call AFUNC(interact_menu,addActionToObject);
};
