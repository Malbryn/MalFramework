/*
	File:
		fn_vehicleLoadout.sqf

	Author:
		Fredrik Eriksson

	Description:
		Vehicle loadout.

	Parameters:
		0 : OBJECT
				- Vehicle to add loadout to.
		1 : ARRAY
				- Array of items/magazines/weapons/backpacks.

	Example:
		nul = [this, [[["Medikit","Toolkit"], [1, 2]],[],[],[]]] call MF_fnc_vehicleLoadout
*/
if (!isServer) exitWith {};
private ["_itemArray", "_magazineArray", "_weaponArray", "_backpackArray"];
params [
	["_vehicle", objNull, [objNull]],
	["_inventoryArray", [], [[]]]
];

clearItemCargoGlobal _vehicle;
clearMagazineCargoGlobal _vehicle;
clearWeaponCargoGlobal _vehicle;
clearBackpackCargoGlobal _vehicle;

_itemArray = _inventoryArray select 0;
{
	Sleep 0.1;
	_vehicle addItemCargoGlobal [_x, ((_itemArray select 1) select ((_itemArray select 0) find _x))];
} count (_itemArray select 0);

_magazineArray = _inventoryArray select 1;
{
	Sleep 0.1;
	_vehicle addMagazineCargoGlobal [_x, ((_magazineArray select 1) select ((_magazineArray select 0) find _x))];
} count (_magazineArray select 0);

_weaponArray = _inventoryArray select 2;
{
	Sleep 0.1;
	_vehicle addWeaponCargoGlobal [_x, ((_weaponArray select 1) select ((_weaponArray select 0) find _x))];
} count (_weaponArray select 0);

_backpackArray = _inventoryArray select 3;
{
	Sleep 0.1;
	_vehicle addBackpackCargoGlobal [_x, ((_backpackArray select 1) select ((_backpackArray select 0) find _x))];
} count (_backpackArray select 0);
