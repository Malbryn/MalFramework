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
 * [] execVM "mission_framework\root\MF_Player\safety\forceSafety.sqf"
 *
 */

//params [["_unit", player]];

if (hasInterface) then {
    [] spawn {
        params [["_unit", player]];
        sleep 0.01;

        /*
        if (currentWeapon _unit != "") then {
            [_unit, currentWeapon _unit, currentMuzzle _unit] call ace_safemode_fnc_lockSafety;
        };
        */

        // Putting the weapon on the back instead of safety
        // Players tend to forget about the safety it seems
        player action ["SWITCHWEAPON", player, player, -1];
    };
};
