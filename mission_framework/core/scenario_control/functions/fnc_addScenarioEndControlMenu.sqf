#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Create an ACE self-interaction menu for the CO to be able to call tactical withdrawal and end the mission

    Arguments:
        -

    Example:
        call MF_scenario_control_fnc_addScenarioEndControlMenu

    Returns:
        void
*/

if (GETVAR(player,EGVAR(player,isCO),false)) then {
    private ["_menu"];

    // Scenario control category
    _menu = ['End scenario', 'End scenario', '\a3\ui_f\data\Map\Diary\Icons\taskSucceeded_ca.paa', {}, {!visibleMap}] call AFUNC(interact_menu,createAction);
    [player, 1, ["ACE_SelfActions"], _menu] call AFUNC(interact_menu,addActionToObject);

    // Call tactical withdrawal
    _menu = ['Tactical withdrawal', 'Tactical withdrawal', '', {
        private ["_taskList"];

        // Put the tasks into an array
        _taskList = player call BFUNC(tasksUnit);

        // Count the succeeded tasks
        _count = 0;
        {
            private ["_state"];

            _state = _x call BFUNC(taskState);
            if (_state == "SUCCEEDED") then {
                _count = _count + 1;
            };
        } forEach _taskList;

        // Calculate the rate of the successful tasks
        _rate = _count / count _taskList;

        // Call the mission end on the server accordingly
        switch (true) do {
            case (_rate == 1) : {
                [QGVARMAIN(missionEnd), ["MissionSuccess", true]] call CFUNC(serverEvent);
            };
            case ((GVAR(successRate) * 0.01) <= _rate && _rate < 1) : {
                [QGVARMAIN(missionEnd), ["WithdrawalWin", true]] call CFUNC(serverEvent);
            };
            case (0 < _rate && _rate < (GVAR(successRate) * 0.01)) : {
                [QGVARMAIN(missionEnd), ["WithdrawalLose", false]] call CFUNC(serverEvent);
            };
            case (_rate == 0) : {
                [QGVARMAIN(missionEnd), ["MissionFail", false]] call CFUNC(serverEvent);
            };
        };
    }, {true}] call AFUNC(interact_menu,createAction);
    [player, 1, ["ACE_SelfActions", "End scenario"], _menu] call AFUNC(interact_menu,addActionToObject);
};
