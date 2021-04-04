#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Registers an object as an IED and assigns it to a unit who will have the "detonator" of the IED

    Arguments:
        0: OBJECT - Variable name of the IED
        1: OBJECT - Detonator of the IED (the person carrying the detonator). If the person dies, the IED won't be detonated.
        2: SCALAR - Activation radius

    Example:
        [ied1, det1, 10] call MF_ied_fnc_setUpIED

    Returns:
        void
*/

params ["_obj", "_owner", "_radius"];

private _id = str (netId _obj);

// Create activation trigger
private _trigger = createTrigger ["EmptyDetector", getPos _obj, false];
_trigger setTriggerActivation ["ANYPLAYER", "PRESENT", false];
_trigger setTriggerArea [_radius, _radius, 0, false, _radius];
_trigger setTriggerStatements ["this && isServer", format ["if (alive %1) then { [%2] call MF_ied_fnc_detonateIED; };", _owner, _id], ""];

[COMPONENT_STR, "DEBUG", format ["IED created [Obj: %1, Owner: %2, Radius: %3]", _obj, _owner, _radius], true] call EFUNC(main,log);
