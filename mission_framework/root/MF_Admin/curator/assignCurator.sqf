/*
 * Author:
 * Commy2
 *
 * Description:
 * Assigns curator to the logged in admin
 *
 * Arguments:
 * -
 *
 * Return Value:
 * void
 *
 * Example:
 * [] execVM "mission_framework\root\MF_Admin\curator\assignCurator.sqf"
 *
 */

if (hasInterface) then {
    0 spawn {
        waitUntil {!isNull player && CBA_missionTime > 1};

        if (serverCommandAvailable "#logout" || getPlayerUID player == parsingNamespace getVariable "MISSION_MAKER") then {
            ["MF_registerCurator", player] call CBA_fnc_serverEvent;
        };
    };
};
