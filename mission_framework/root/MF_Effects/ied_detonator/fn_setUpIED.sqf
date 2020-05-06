/*
 * Author:
 * Malbryn
 *
 * Description:
 * Registers an object as an IED and a unit as the detonator of the IED
 *
 * Arguments:
 * _this select 0: OBJECT - Variable name of the IED
 * _this select 1: SCALAR - Activation radius
 * _this select 2: SCALAR - Detonator of the IED (the person carrying the detonator). If the person dies, the IED won't be detonated
 *
 * Return Value:
 * void
 *
 * Example:
 * [ied1, 10, det1] call MF_fnc_setUpIED
 *
 */

params ["_obj", "_radius", "_owner"];

_id = str (netId _obj);

// Create activation trigger
_trigger = createTrigger ["EmptyDetector", getPos _obj, false];
_trigger setTriggerActivation ["ANYPLAYER", "PRESENT", false];
_trigger setTriggerArea [_radius, _radius, 0, false, _radius];
_trigger setTriggerStatements ["this && isServer", format ["if (alive %1) then { [%2] spawn MF_fnc_detonateIED; };", _owner, _id], ""];
