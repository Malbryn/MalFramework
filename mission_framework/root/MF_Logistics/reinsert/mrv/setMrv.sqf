/*
 * Author:
 * Malbryn
 *
 * Description:
 * Sets a vehicle as a Mobile Respawn Vehicle
 * Players get the ability to TP into this vehicle after they respawn
 *
 * Arguments:
 * _this select 0: OBJECT - Vehicle that should become a MRV
 *
 * Return Value:
 * void
 *
 * Example:
 * [this] execVM "mission_framework\root\MF_Logistics\reinsert\mrv\setMrv.sqf"
 *
 */

params ["_vehicle"];

missionNamespace setVariable ["MF_var_mrv", _vehicle, true];
publicVariable "MF_var_mrv";
