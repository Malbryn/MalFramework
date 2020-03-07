/*
 * Author:
 * nkenny (modified by Malbryn)
 *
 * Description:
 * Slower more deliberate tracking and attacking script, spawns flares to coordinate
 *
 * Arguments:
 * _this select 0: GROUP or OBJECT - Group to perform this task
 * _this select 1: SCALAR - Range of the task
 *
 * Return Value:
 * BOOLEAN
 *
 * Example:
 * [this, 300] spawn MF_fnc_taskHunt
 *
 */

MF_fnc_findTarget = {
    _newDist = _range; 
    _all = (switchableUnits + playableUnits - entities "HeadlessClient_F");
    _all = _all select {side _x != civilian && {side _x != side _group}};
    _target = objNull;
    {
        _distance = (leader _group) distance2d _x;
        if (_distance < _newDist && {getpos _x select 2 < 200}) then {_target = _x;_newDist = _distance;};
        true
    } count _all; 
    _target
};

MF_fnc_flare = {
    _shootflare = "F_20mm_Red" createvehicle ((leader _group) ModelToWorld [0,0,200]);
    _shootflare setVelocity [0,0,-10];
};

MF_fnc_suppress = {
    {
        _x doSuppressiveFire ((getposASL _target) vectorAdd [random 2,random 2,0.5 + random 3]);
        true
    } count units _group;
};


// init
params ["_group",["_range",500],["_cycle",60 + random 30]];

// sort grp
if (!local _group) exitWith {};
if (_group isEqualType objNull) then {_group = group _group;};

// orders
_group setbehaviour "SAFE";
_group setSpeedMode "LIMITED";

// Hunting loop
while {{alive _x} count units _group > 0} do {

    // performance
    waitUntil {sleep 1;simulationenabled leader _group};

    // settings 
    _combat = behaviour leader _group isEqualTo "COMBAT";
    _onFoot = (isNull objectParent (leader _group));

    // find
    _target = call MF_fnc_findTarget;

    // orders
    if (!isNull _target) then {
        _group move (_target getPos [random 100,random 360]);
        _group setFormDir (leader _group getDir _target);
        _group setSpeedMode "NORMAL";
        _group enableGunLights "forceOn"; 
        _group enableIRLasers true;
        
        // flare
        if (!_combat && {_onFoot} && {random 1 > 0.8}) then {[] call MF_fnc_flare;};
        
        // suppress building BUILDING SUPPRESSION!
        if (_combat && {(nearestBuilding _target distance2d _target < 25)}) then {[] call MF_fnc_suppress;};
    };

    // WAIT FOR IT!
    sleep _cycle;
};