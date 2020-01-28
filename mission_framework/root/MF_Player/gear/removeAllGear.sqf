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
 * [player] execVM "mission_framework\root\MF_Player\gear\removeAllGear.sqf"
 *
 */

params ["_unit"];

removeHeadgear _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeAllWeapons _unit;
removeAllAssignedItems _unit;

// Blacklist the stupid goggles
_goggleBlacklist = ["G_AirPurifyingRespirator_02_black_F", "G_AirPurifyingRespirator_02_olive_F", "G_AirPurifyingRespirator_02_sand_F", "G_AirPurifyingRespirator_01_F", "G_Blindfold_01_black_F", "G_Blindfold_01_white_F", "G_RegulatorMask_F", "G_Respirator_blue_F", "G_Respirator_white_F", "G_Respirator_yellow_F", "G_Balaclava_TI_blk_F"];
_goggles = goggles _unit;

if (_goggles in _goggleBlacklist) then {
  removeGoggles _unit;
};
