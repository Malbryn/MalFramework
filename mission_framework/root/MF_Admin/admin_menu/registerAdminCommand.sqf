/*
 * Author:
 * Malbryn
 *
 * Description:
 * Registers chat commands that can be used by the logged-in admin.
 *
 * Arguments:
 * -
 *
 * Return Value:
 * void
 *
 * Example:
 * [] execVM "mission_framework\root\MF_Admin\admin_menu\registerAdminCommand.sqf"
 *
 */

if (hasInterface) then {
    // Adds admin menu to the self-nteraction options
    // Use this if the admin logs in after mission init
    ["addAdminMenu", {
        [] execVM "mission_framework\root\MF_Admin\init.sqf";
        systemChat "[MF INFO] Adding admin menu...";
    }, "admin"] call CBA_fnc_registerChatCommand;

    // Adds an option to terminate the mission
    // Use this if the admin is dead and the mission breaks
    ["terminateMission", {
        ["MissionTerminated", false] remoteExec ["MF_fnc_endMission", 2];
        systemChat "[MF INFO] Terminating mission...";
    }, "admin"] call CBA_fnc_registerChatCommand;
};