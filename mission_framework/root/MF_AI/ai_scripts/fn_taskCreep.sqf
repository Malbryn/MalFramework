/*
 * Author:
 * nkenny (modified by Malbryn)
 *
 * Description:
 * Unit creeps up as close as possible before opening fire.
 * Stance is based on distance, speed is always limited and Hold fire for as long as possible.
 *
 * Arguments:
 * _this select 0: GROUP or OBJECT - Group to perform this task
 * _this select 1: SCALAR - Range of the task
 *
 * Return Value:
 * BOOLEAN
 *
 * Example:
 * [this, 300] spawn MF_fnc_taskCreep
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

MF_fnc_creepOrders = {
    // distance
    private _nearDist = leader _group distance2d _target;
    private _inForest = ((selectBestPlaces [getpos leader _group, 2,"(forest + trees)/2", 1, 1]) select 0) select 1;

    // danger mode? go for it! 
    if (behaviour leader _group isEqualTo "COMBAT") exitWith {_group setCombatMode "RED";{_x setUnitpos "MIDDLE";_x domove (getposATL _target);true} count units _group;};

    // vehicle? wait for it
    if (_nearDist < 150 && {vehicle _target isKindOf "Landvehicle"}) exitWith {_group reveal _target;{_x setunitpos "DOWN";true} count units _group;};

    // adjust behaviour
    if (_inForest > 0.9 || _nearDist > 200) then {{_x setUnitpos "UP";true} count units _group};
    if (_inForest < 0.6 || _nearDist < 100) then {{_x setUnitpos "MIDDLE";true} count units _group};
    if (_inForest < 0.4 || _nearDist < 50) then {{_x setUnitpos "DOWN";true} count units _group};
    if (_nearDist < 40) exitWith {_group setCombatMode "RED";_group setbehaviour "STEALTH";};

    // move
    {
        _x doMove (_target getPos [random 10 + _foreachIndex * 5,random 360]);
    } foreach units _group;
};

// init
params ["_group",["_range",500],["_cycle",15]];

// sort grp
if (!local _group) exitWith {};
if (_group isEqualType objNull) then {_group = group _group;};

// orders
_group setbehaviour "AWARE";
_group setFormation "DIAMOND"; 
_group setSpeedMode "LIMITED";
_group setCombatMode "GREEN";
_group enableAttack false;
///{_x forceWalk true;} foreach units _group;  <-- Use this if behaviour set to "STEALTH"

// failsafe!
{
    doStop _x; 
    _x addEventhandler ["FiredNear",{
        params ["_unit"];
        doStop _x;
        _unit setCombatMode "RED";
        _unit suppressFor 4;
        group _unit enableAttack true;
        _unit removeEventHandler ["FiredNear",_thisEventHandler];
        }];
    true
} count units _group; 

// creep loop
while {{alive _x} count units _group > 0} do {

    // performance
    waitUntil {sleep 1; simulationenabled leader _group}; 

    // find
    _target = call MF_fnc_findTarget;

    // act
    if (!isNull _target) then {
        call MF_fnc_creepOrders;
        _cycle = 30;
    } else {
        _cycle = 120;
        _group setCombatMode "GREEN"
    };

    // delay
    sleep _cycle;
};

// end
true