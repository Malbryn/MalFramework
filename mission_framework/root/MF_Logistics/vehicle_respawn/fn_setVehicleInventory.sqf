/*
 * Author:
 * Fredrik Eriksson
 *
 * Description:
 * Adds items to the vehicle equipment storage
 *
 * Arguments:
 * _this select 0: OBJECT - Vehicle to add loadout to
 * _this select 1: ARRAY - Array of items/magazines/weapons/backpacks
 *
 * Return Value:
 * void
 *
 * Example:
 * nul = [this, [[["Medikit","Toolkit"], [1, 2]],[],[],[]]] call MF_fnc_setVehicleInventory
 *
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
  sleep 0.1;
  _vehicle addItemCargoGlobal [_x, ((_itemArray select 1) select ((_itemArray select 0) find _x))];
} count (_itemArray select 0);

_magazineArray = _inventoryArray select 1;
{
  sleep 0.1;
  _vehicle addMagazineCargoGlobal [_x, ((_magazineArray select 1) select ((_magazineArray select 0) find _x))];
} count (_magazineArray select 0);

_weaponArray = _inventoryArray select 2;
{
  sleep 0.1;
  _vehicle addWeaponCargoGlobal [_x, ((_weaponArray select 1) select ((_weaponArray select 0) find _x))];
} count (_weaponArray select 0);

_backpackArray = _inventoryArray select 3;
{
  sleep 0.1;
  _vehicle addBackpackCargoGlobal [_x, ((_backpackArray select 1) select ((_backpackArray select 0) find _x))];
} count (_backpackArray select 0);
