/*
 * Author:
 * Malbryn
 *
 * Description:
 * Removes all of tge unit's current gear
 *
 * Arguments:
 * _this select 0: OBJECT - Unit
 *
 * Return Value:
 * void
 *
 * Example:
 * [this] execVM "mission_framework\root\MF_Player\gear\removeAllGear.sqf"
 *
 */

params ["_unit"];

removeHeadgear _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeAllWeapons _unit;
removeAllAssignedItems _unit;
removeGoggles _unit;
