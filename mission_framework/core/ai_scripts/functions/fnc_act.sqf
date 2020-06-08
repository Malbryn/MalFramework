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

params ["_group", "_building", "_enemy"];
private ["_enemy", "_buildingPos"];

if (!isNull _enemy) exitWith {

    doStop units _group; 
    leader _group playAction selectRandom ["gestureAttack", "gestureGo", "gestureGoB"];

    _buildingPos = ((nearestBuilding _enemy) buildingPos -1) select {_x distance _enemy < 5};
    _buildingPos pushBack getPosATL _enemy;

    {_x doMove selectRandom _buildingPos; _x doWatch _enemy; true} count units _group; 
};

_buildingPos = _building getVariable ["LAMBS_CQB_cleared_" + str (side _group), (_building buildingPos -1) select {lineIntersects [AGLToASL _x, (AGLToASL _x) vectorAdd [0, 0, 10]]}];

{
    // the assault 
    if ((count _buildingPos > 0) && {unitReady _x}) then {
        _x setUnitPos "UP";
        _x forceSpeed 3;
        _x doMove ((_buildingPos select 0) vectorAdd [0.5 - random 1, 0.5 - random 1, 0]);

        if (_x distance (_buildingPos select 0) < 30 || {(leader _group isEqualTo _x) && {random 1 > 0.5}}) then {
            _buildingPos deleteAt 0;
        } else {
            if (lineIntersects [eyePos _x, (eyePos _x) vectorAdd [0, 0, 10]] && {_x distance (_buildingPos select 0) > 45} && {random 1 > 0.6}) then {
                _x setVehiclePosition [getPos _x, [], 3.5];
            };
        };
    } else {

        _x setUnitPos "MIDDLE";

        if (unitReady _x && {!(lineIntersects [eyePos _x, (eyePos _x) vectorAdd [0, 0, 10]])}) then {
            _x doSuppressiveFire _building;
            _x doFollow leader _group;
        };
    };

    true
} count units _group;

_building setVariable ["LAMBS_CQB_cleared_" + str (side _group), _buildingPos];
