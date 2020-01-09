// Exit the spectator voice channel
//[player, false] call TFAR_fnc_forceSpectator;

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
if (!((player getVariable "currentLoadout") isEqualTo objNull)) then {
    [player, [player, "currentLoadout"]] call BIS_fnc_loadInventory;
};

// Start the snows script if enabled
if (MF_var_snowfall_enabled) then {
  [] spawn MF_fnc_startSnowfall;
};
