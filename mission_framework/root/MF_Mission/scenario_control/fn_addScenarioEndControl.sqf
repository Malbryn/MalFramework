/*
 * Author:
 * Malbryn
 *
 * Description:
 * Creates ACE self-interaction menu for the CO to be able to call tactical withdrawal and end the mission
 *
 * Arguments:
 * -
 *
 * Return Value:
 * void
 *
 * Example:
 * [] call MF_fnc_addScenarioEndControl
 *
 */

if (hasInterface && (player getVariable "MF_var_is_CO")) then {
    // Scenario control category
    private _switch = ['End scenario', 'End scenario', '\a3\ui_f\data\Map\Diary\Icons\taskSucceeded_ca.paa', {}, {true}] call ace_interact_menu_fnc_createAction;

    [player, 1, ["ACE_SelfActions"], _switch] call ace_interact_menu_fnc_addActionToObject;


    // Call tactical withdrawal
    private _switch = ['Tactical withdrawal', 'Tactical withdrawal', '', {

        // Put the tasks into an array
        private _taskList = player call BIS_fnc_tasksUnit;

        // Count the succeeded tasks
        _count = 0;
        {
            private _state = _x call BIS_fnc_taskState;
            if (_state == "SUCCEEDED") then {
                _count = _count + 1;
            };
        } forEach _taskList;

        // Calculate the rate of the successful tasks
        _rate = _count / count _taskList;

        // Call the mission end on the server accordingly
        switch (true) do {
            case (_rate == 1) : {
                ["MissionSuccess", true] remoteExec ["MF_fnc_endMission", 2];
            };
            case ((MF_var_success_rate * 0.01) <= _rate && _rate < 1) : {
                ["WithdrawalWin", true] remoteExec ["MF_fnc_endMission", 2];
            };
            case (0 < _rate && _rate < (MF_var_success_rate * 0.01)) : {
                ["WithdrawalLose", false] remoteExec ["MF_fnc_endMission", 2];
            };
            case (_rate == 0) : {
                ["MissionFail", false] remoteExec ["MF_fnc_endMission", 2];
            };
        };
    }, {true}] call ace_interact_menu_fnc_createAction;

    [player, 1, ["ACE_SelfActions", "End scenario"], _switch] call ace_interact_menu_fnc_addActionToObject;
};
