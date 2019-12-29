params ["_unit", "_gear"];

// Set the loadout
_unit setUnitLoadout _gear;

// Save the current loadout
private _loadout = [player, [player, "MF_var_currentLoadout"]] call BIS_fnc_saveInventory;
player setVariable ["MF_var_currentLoadout", _loadout];
