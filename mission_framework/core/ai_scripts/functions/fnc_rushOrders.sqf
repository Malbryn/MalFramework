#include "script_component.hpp"

/*
    Author:
        nkenny (modified by Malbryn)

    Description:
        -

    Arguments:
        -

    Example:
        -

    Returns:
        -
*/

params ["_group", "_target"];

if ((leader _group distance2d _target < 220) && {vehicle _target isKindOf "Air"}) exitWith {
    {
        _x commandSuppressiveFire getposASL _target;
        true
    } count units _group;
};

if ((leader _group distance2d _target < 80) && {vehicle _target isKindOf "Tank"}) exitWith {
    {
        if (secondaryWeapon _x != "") then {
            _x setUnitpos "Middle";
            _x selectWeapon (secondaryweapon _x);
        } else {
            _x setunitpos "DOWN";
            _x commandSuppressiveFire getposASL _target;
        };

        true
    } count units _group;

    _group enableGunLights "forceOff";
};

{
    _x setunitpos "UP";
    _x domove (getposATL _target);
    true
} count units _group;

_group enableGunLights "forceOn";
