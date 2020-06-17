#include "script_component.hpp"

/*
    Author:
        AZCoder (originally by JW)

    Description:
        Creates a fog particle source.

    Arguments:
        0: OBJECT - Unit to position the effect

    Example:
        [player] call MF_snowfall_fnc_fogEffect

    Returns:
        OBJECT
*/

if !(hasInterface) exitWith {};

params ["_unit"];

private _pos = position (vehicle _unit);
private _fog = "#particlesource" createVehicleLocal _pos;
_fog setParticleParams [
    ["\Ca\Data\ParticleEffects\Universal\universal.p3d" , 16, 12, 13, 0], "", "Billboard", 1, 10,
    [0, 0, -6], [0, 0, 0], 1, 1.275, 1, 0,
    [7,6], [[1, 1, 1, 0], [1, 1, 1, 0.04], [1, 1, 1, 0]], [1000], 1, 0, "", "", _obj
];
_fog setParticleRandom [3, [55, 55, 0.2], [0, 0, -0.1], 2, 0.45, [0, 0, 0, 0.1], 0, 0];
_fog setParticleCircle [0.001, [0, 0, -0.12]];
_fog setDropInterval 0.001;

_fog
