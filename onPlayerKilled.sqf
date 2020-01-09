// Save the death location
player setVariable ["MF_var_death_pos", getPos player];

// Put the player into the spectator voice channel
//[player, true] call TFAR_fnc_forceSpectator;

"dynamicBlur" ppEffectEnable true;
"dynamicBlur" ppEffectAdjust [0];
"dynamicBlur" ppEffectCommit 0;
"dynamicBlur" ppEffectAdjust [6];
"dynamicBlur" ppEffectCommit 6;

uiSleep 1;
cutText  ["", "BLACK OUT", 5, true];

// Log if friendly fire happened
private _killer = player getVariable ["ace_medical_lastDamageSource", objNull];
private _nameKiller = name _killer;
private _nameKilled = name player;

if (side _killer == playerSide) then {
  format ["Friendly fire: %1 was killed by %2", _nameKilled, _nameKiller] remoteExec ["systemChat", 0]
};

uiSleep 5;

// Init the spectator mode if available, TODO: disable respawn counter when no respawn is available
if (MF_var_respawn_tickets == 0) then {
  setPlayerRespawnTime 999999;
  ["Initialize", [player, [], false, false, true, false, false, false, false, true]] call BIS_fnc_EGSpectator;
} else {
  ["Initialize", [player, [], false, false, true, false, false, false, false, true]] call BIS_fnc_EGSpectator;

  MF_var_respawn_tickets = MF_var_respawn_tickets - 1;
};

// Stop the snow script if enabled
if (MF_var_snowfall_enabled) then {
  missionNameSpace setVariable ["MF_var_snowfall_start", false];
};
