// Save the death location
player setVariable ["MF_var_death_pos", getPos player];

// Put the player into the spectator voice channel
[player, true] call TFAR_fnc_forceSpectator;

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
  [_nameKilled, _nameKiller] remoteExec ["MF_fnc_friendlyFireMessage", 0];
};

// Init the spectator mode
if (MF_var_respawn_tickets == 0) then {

  setPlayerRespawnTime 999999;

  ["Initialize", [player, [], false, false, true, false, false, false, false, true]] call BIS_fnc_EGSpectator;

  uiSleep 5;
  cutText  ["", "BLACK IN",  3, true];
  "dynamicBlur" ppEffectAdjust [0];
  "dynamicBlur" ppEffectCommit 3;

} else {

  ["Initialize", [player, [], false, false, true, false, false, false, false, true]] call BIS_fnc_EGSpectator;

  uiSleep 5;
  cutText  ["", "BLACK IN",  3, true];
  "dynamicBlur" ppEffectAdjust [0];
  "dynamicBlur" ppEffectCommit 3;

  MF_var_respawn_tickets = MF_var_respawn_tickets - 1;
};

// Stop the snow script if enabled
if (MF_var_snowfall_enabled) then {
  missionNameSpace setVariable ["MF_var_snowfall_start", false];
};
