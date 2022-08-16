#include "script_component.hpp"

/*
    Author:
       DreadPirate (modified by Malbryn)

    Description:
        Saves vehicle data.

    Arguments:
        0: OBJECT - Unit

    Example:
        [aiUnit] call MF_ai_spawner_fnc_saveVehicle

    Returns:
        ARRAY
*/

if !(isServer) exitWith {};

params ["_unit"];

private _vehicleData = [];
private _vehicle = vehicle _unit;

_vehicleData pushBack (typeOf _vehicle);
_vehicleData pushBack (getPos _vehicle);
_vehicleData pushBack (getDir _vehicle);
_vehicleData pushBack (locked _vehicle);
_vehicleData pushBack (itemCargo _vehicle);
_vehicleData pushBack (magazineCargo _vehicle);
_vehicleData pushBack (weaponCargo _vehicle);
_vehicleData pushBack (backpackCargo _vehicle);
_vehicleData pushBack (getPylonMagazines _vehicle);
_vehicleData pushBack (getObjectMaterials _vehicle);
_vehicleData pushBack (getObjectTextures _vehicle);

private _thisAnimationNames = animationNames _vehicle;
private _thisAnimationPhases = [];

{
    _thisAnimationPhases pushBack (_vehicle animationPhase _x);
} forEach _thisAnimationNames;

_vehicleData pushBack (_thisAnimationNames);
_vehicleData pushBack (_thisAnimationPhases);
_vehicleData pushBack vehicleVarName _vehicle;

private _crewData = [];

{
    _crewData pushBack ([_x] call FUNC(saveCrewMember));
} forEach (fullCrew _vehicle);

_vehicleData pushBack _crewData;

_vehicleData;
