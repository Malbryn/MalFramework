/*
 * Author:
 * Malbryn
 *
 * Description:
 * Creates ACE self-interaction menu for the the logged-in admin to control the scenario end
 *
 * Arguments:
 * -
 *
 * Return Value:
 * void
 *
 * Example:
 * [] execVM "mission_framework\root\MF_Admin\admin_scenario_control\addAdminScenarioEndControl.sqf"
 *
 */

if (hasInterface && (serverCommandAvailable "#logout" || getPlayerUID player == parsingNamespace getVariable "MISSION_MAKER")) then {
    // Scenario control category
    private _switch = ['Scenario Flow', 'Scenario Flow', '', {}, {true}] call ace_interact_menu_fnc_createAction;

    [player, 1, ["ACE_SelfActions", "Admin Menu"], _switch] call ace_interact_menu_fnc_addActionToObject;


    // Mission Success
    private _switch = ['Mission Success', 'Mission Success', '', {
        ["MissionSuccess", true] remoteExec ["MF_fnc_endMission", 2];
    }, {true}] call ace_interact_menu_fnc_createAction;

    [player, 1, ["ACE_SelfActions", "Admin Menu", "Scenario Flow"], _switch] call ace_interact_menu_fnc_addActionToObject;


    // Mission Fail
    private _switch = ['Mission Fail', 'Mission Fail', '', {
        ["MissionFail", false] remoteExec ["MF_fnc_endMission", 2];
    }, {true}] call ace_interact_menu_fnc_createAction;

    [player, 1, ["ACE_SelfActions", "Admin Menu", "Scenario Flow"], _switch] call ace_interact_menu_fnc_addActionToObject;


    // Mission Terminated
    private _switch = ['Terminate Mission', 'Terminate Mission', '', {
        ["MissionTerminated", false] remoteExec ["MF_fnc_endMission", 2];
    }, {true}] call ace_interact_menu_fnc_createAction;
    

    [player, 1, ["ACE_SelfActions", "Admin Menu", "Scenario Flow"], _switch] call ace_interact_menu_fnc_addActionToObject;
    [player, 1, ["ACE_SelfActions", "Scenario flow"], _switch] call ace_interact_menu_fnc_addActionToObject;
};