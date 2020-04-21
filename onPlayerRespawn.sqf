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

// Load the player's loadout
private _loadout = player getVariable "MF_var_current_loadout";
[player, _loadout] call MF_fnc_setGear;

// Set the radios
[] spawn MF_fnc_setChannels;

// Remaining respawn tickets
if (player getVariable "MF_tickets" == -1) exitWith {};

private _amount = (player getVariable "MF_tickets") - 1;
[player, _amount] call MF_fnc_setRespawnTickets;

[format ["Respawns available:<br/>%1", _amount], 2, ace_player, 12] call ace_common_fnc_displayTextStructured;


// Snow effect
if (MF_var_snowfall_enabled) then {
    [] spawn MF_fnc_startSnowfall;
};
