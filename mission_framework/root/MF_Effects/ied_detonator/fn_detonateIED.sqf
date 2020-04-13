/*
 * Author:
 * Malbryn
 *
 * Description:
 * Detonates a previously registered IED
 *
 * Arguments:
 * _this select 0: STRING - Net ID of the IED object
 *
 * Return Value:
 * void
 *
 * Example:
 * [str (netId ied1)] call MF_fnc_detonateIED
 *
 */

params ["_id"];

// Get the IED object
_obj = objectFromNetId _id;

// Detonate it
playSound3D ["z\ace\addons\explosives\Data\Audio\Cellphone_Ring.wss", _obj, false, getPosASL _obj, 5, 1, 50];
uisleep 2;
_ied = "Bo_GBU12_LGB" createVehicle (getPos _obj);
_obj setDamage 1;