/*
 * Author:
 * Malbryn
 *
 * Description:
 * Creates ACE self-interaction menu for the the CO to be able to call reinforcements
 *
 * Arguments:
 * -
 *
 * Return Value:
 * void
 *
 * Example:
 * [] call MF_fnc_addCallRespawnMenu
 *
 */

if (hasInterface && player getvariable "MF_var_is_CO" && MF_var_wave_respawn_enabled) then {

    // Respawn category
    private _menu = ['Reinforcements', 'Reinforcements', '\a3\ui_f\data\IGUI\Cfg\simpleTasks\types\meet_ca.paa', {}, {!visibleMap}] call ace_interact_menu_fnc_createAction;

    [player, 1, ["ACE_SelfActions"], _menu] call ace_interact_menu_fnc_addActionToObject;


    // Respawn sub-categories
    // Call
    _menu = ['Call reinforcements', 'Call reinforcements', '', {
        if (MF_var_wave_respawn_count > 0) then {
            private _deadPlayers = (allPlayers select {!alive _x});
            private _count = 0;

            // Check if the player has respawn tickets left
            if (player getVariable "MF_tickets" != -1) then { // Respawn tickets are enabled - count players with remaining tickets only
                {
                    if (_x getVariable "MF_tickets" > 0) then {
                        _count = _count + 1;
                    };
                } forEach _deadPlayers;
            } else { // Respawn tickets are disabled - count every dead player
                _count = count _deadPlayers;
            };

            if (_count == 0) exitWith { [["There are no dead players (or players with respawn tickets)"], 2, ace_player, 12] call ace_common_fnc_displayTextStructured; };
            [["Reinforcements:<br/>%1 player(s)", _count], 2, ace_player, 12] call ace_common_fnc_displayTextStructured;

            remoteExec ["MF_fnc_callRespawnWave", _deadPlayers];

            MF_var_wave_respawn_count = MF_var_wave_respawn_count - 1;
            publicVariable "MF_var_wave_respawn_count";
        } else {
            ["Warning", ["No more reinforcement wave ramaining!"]] call BIS_fnc_showNotification;
        };
    }, {true}] call ace_interact_menu_fnc_createAction;

    [player, 1, ["ACE_SelfActions", "Reinforcements"], _menu] call ace_interact_menu_fnc_addActionToObject;


    // Check
    _menu = ['Check remaining reinforcement waves', 'Check remaining reinforcement waves', '', {
        [["Remaining reinforcement waves:<br/>%1", MF_var_wave_respawn_count], 2, ace_player, 12] call ace_common_fnc_displayTextStructured;
    }, {true}] call ace_interact_menu_fnc_createAction;

    [player, 1, ["ACE_SelfActions", "Reinforcements"], _menu] call ace_interact_menu_fnc_addActionToObject;
};
