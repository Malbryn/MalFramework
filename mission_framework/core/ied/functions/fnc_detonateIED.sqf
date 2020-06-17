#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Detonates a previously registered IED.

    Arguments:
        0: STRING - Net ID of the IED object

    Example:
        [str (netId ied1)] call MF_ied_fnc_detonateIED

    Returns:
        void
*/

params ["_id"];

// Get the IED object
private _obj = objectFromNetId _id;

// Detonate it
playSound3D ["z\ace\addons\explosives\Data\Audio\Cellphone_Ring.wss", _obj, false, getPosASL _obj, 5, 1, 50];

[{
    private _ied = "Bo_GBU12_LGB" createVehicle (getPos _this);
    hideObjectGlobal _ied;
    _this setDamage 1;
}, _obj, 2] call CFUNC(waitAndExecute);
