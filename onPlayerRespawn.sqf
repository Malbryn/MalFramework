// Screen effects
cutText  ["", "BLACK FADED", 5, true];
uiSleep 1;
cutText  ["", "BLACK IN", 5, true];

"dynamicBlur" ppEffectEnable true;
"dynamicBlur" ppEffectAdjust [6];
"dynamicBlur" ppEffectCommit 0;
"dynamicBlur" ppEffectAdjust [0.0];
"dynamicBlur" ppEffectCommit 3;

// Close the spectator mode
["Terminate"] call BIS_fnc_EGSpectator;

// Exit the spectator voice channel
[player, false] call TFAR_fnc_forceSpectator;

// Load the player's loadout
private _loadout = player getVariable "MF_var_current_loadout";
[player, _loadout] call MF_fnc_setGear;

// Start the snow script if enabled
if (MF_var_snowfall_enabled) then {
    missionNameSpace setVariable ["MF_var_snowfall_start", true];
    [] spawn MF_fnc_startSnowfall;
};

// Remaining respawn tickets
if (MF_var_respawn_tickets == -1) exitWith {};

MF_var_respawn_tickets = MF_var_respawn_tickets - 1;

[format ["Respawns available:<br/>%1", MF_var_respawn_tickets], 2, ace_player, 12] call ace_common_fnc_displayTextStructured;
