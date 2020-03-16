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

if (hasInterface && (player getvariable "MF_var_is_CO")) then {

	// Respawn category
    private _menu = ['Reinforcements', 'Reinforcements', '\a3\ui_f\data\Map\VehicleIcons\iconParachute_ca.paa', {}, {true}] call ace_interact_menu_fnc_createAction;

    [player, 1, ["ACE_SelfActions"], _menu] call ace_interact_menu_fnc_addActionToObject;


	// Respawn sub-categories
	// Call
	_menu = ['Call reinforcements', 'Call reinforcements', '', {
		if (MF_var_wave_respawn_count > 0) then {
			private _deadPlayers = (allPlayers select {!alive _x});

			private _count = count _deadPlayers;
			if (_count == 0) exitWith { [["There are no dead players"], 2, ace_player, 12] call ace_common_fnc_displayTextStructured; };
			[["Reinforcements:<br/>%1 players", _count], 2, ace_player, 12] call ace_common_fnc_displayTextStructured;

			remoteExec ["MF_fnc_callRespawnWave", _deadPlayers];

			MF_var_wave_respawn_count = MF_var_wave_respawn_count - 1;
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