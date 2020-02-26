/*
 * Author:
 * nkenny (modified by Malbryn)
 *
 * Description:
 * Group identifies buildings, clears them methodically, marks building safe,
 * moves to next building and repeats until no buildings left
 *
 * Arguments:
 * _this select 0: GROUP or OBJECT - Group to perform this task
 * _this select 1: SCALAR - Range of the task
 *
 * Return Value:
 * BOOLEAN
 *
 * Example:
 * [this, 100] spawn MF_fnc_taskCQB
 *
 */

// functions ---

// find buildings
MF_fnc_find = {
    _building = nearestobjects [(leader _group),["house","strategic","ruins"],_range,true];
    _building = _building select {count (_x buildingPos -1) > 0};
    _building = _building select {count (_x getVariable ["LAMBS_CQB_cleared_" + str (side _group),[0,0]]) > 0}; 
    if (count _building > 0) exitWith {_building select 0};
    ObjNull
};

// check for enemies
MF_fnc_enemy = {
    private _pos = if (isNull _building) then {getpos leader _group} else {getpos _building};
    _enemy = (leader _group) findNearestEnemy _pos;
    if (isNull _enemy || {_pos distance2d _enemy < 25}) exitWith {_enemy};
    leader _group doSuppressiveFire _enemy;
    ObjNull
};

// compile actions
MF_fnc_act = {
    // deal with close enemy
    if (!isNull _enemy) exitWith {

        // posture
        doStop units _group; 
        leader _group playAction selectRandom ["gestureAttack","gestureGo","gestureGoB"];
        
        // location 
        _buildingPos = ((nearestBuilding _enemy) buildingPos -1) select {_x distance _enemy < 5};
        _buildingPos pushBack getPosATL _enemy;
        
        // act
        {_x doMove selectRandom _buildingPos;_x doWatch _enemy;true} count units _group; 
    };

    // clear and check buildings
    _buildingPos = _building getVariable ["LAMBS_CQB_cleared_" + str (side _group),(_building buildingPos -1) select {lineIntersects [AGLToASL _x, (AGLToASL _x) vectorAdd [0,0,10]]}];
    {
        // the assault 
        if ((count _buildingPos > 0) && {unitReady _x}) then {
            _x setUnitPos "UP";
            _x doMove ((_buildingPos select 0) vectorAdd [0.5 - random 1,0.5 - random 1,0]);

            // clean list 
            if (_x distance (_buildingPos select 0) < 30 || {(leader _group isEqualTo _x) && {random 1 > 0.5}}) then {
                _buildingPos deleteAt 0;
            } else {
                // teleport debug (unit sometimes gets stuck due to Arma buildings )
                if (lineIntersects [eyePos _x, (eyePos _x) vectorAdd [0,0,10]] && {_x distance (_buildingPos select 0) > 45} && {random 1 > 0.6}) then {
                _x setVehiclePosition [getPos _x, [], 3.5];
                };
            };
        } else {

            // visualisation -- unit is either busy or too far to be effective 
            _x setUnitPos "MIDDLE";

            // unit is ready and outside -- try suppressive fire 
            if (unitReady _x && {!(lineIntersects [eyePos _x, (eyePos _x) vectorAdd [0,0,10]])}) then {
                _x doSuppressiveFire _building;
                _x doFollow leader _group;
            };
        };
    true
    } count units _group;

    // update variable
    _building setVariable ["LAMBS_CQB_cleared_" + str (side _group),_buildingPos];
};

// functions end ---

// init
params ["_group",["_range",50],["_cycle",21]];

// sort grp
if (!local _group) exitWith {};
if (_group isEqualType objNull) then {_group = group _group;};

// orders
_group setSpeedMode "FULL";
_group setFormation "FILE";
_group enableAttack false;
_group allowFleeing 0;
{
    _x disableAI "AUTOCOMBAT";
    _x disableAI "SUPPRESSION";
    _x enableIRLasers true;
} foreach units _group;

// loop
while {{alive _x} count units _group > 0} do {
    // performance
    waitUntil {sleep 1; simulationenabled leader _group}; 

    // find building
    _building = call MF_fnc_find;

    // find enemy
    _enemy = call MF_fnc_enemy; 

    // act! 
    if (isNull _building && {isNull _enemy}) exitWith {}; 
    call MF_fnc_act; 

    // wait
    sleep _cycle; 
};

// end
true