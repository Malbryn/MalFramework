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
 * [this] call MF_fnc_setMrv
 *
 */

params ["_vehicle"];

missionNamespace setVariable [MF_var_mrv, _vehicle];
publicVariable "MF_var_mrv";