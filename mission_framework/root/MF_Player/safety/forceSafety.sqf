/*
 * Author:
 * Malbryn
 *
 * Description:
 * Puts on safety on the unit's weapon
 *
 * Arguments:
 * _this select 0: OBJECT - Unit which should be safety enabled (Optional, default: player)
 *
 * Return Value:
 * void
 *
 * Example:
 * [] execVM "mission_framework\core\safety\forceSafety.sqf"
 *
 */

//params [["_unit", player]];

if (hasInterface) then {
   [] spawn {
     params [["_unit", player]];
     sleep 0.01;

     if (currentWeapon _unit != "") then {
       [_unit, currentWeapon _unit, currentMuzzle _unit] call ace_safemode_fnc_lockSafety;
     };
  };
};
