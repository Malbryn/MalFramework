#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Creates an ACE self-interaction menu for the CO to be able to call tactical withdrawal and end the mission.

    Arguments:
        -

    Example:
        call MF_scenario_control_fnc_addScenarioEndControlMenu

    Returns:
        void
*/

if !(hasInterface) exitWith {};

if (GETVAR(player,EGVAR(player,isCO),false)) then {
    // Scenario control category
    private _menu = ['End scenario', 'End scenario', '\a3\ui_f\data\Map\Diary\Icons\taskSucceeded_ca.paa', {}, {!visibleMap}] call AFUNC(interact_menu,createAction);
    [player, 1, ["ACE_SelfActions"], _menu] call AFUNC(interact_menu,addActionToObject);

    // Call tactical withdrawal
    _menu = ['Tactical withdrawal', 'Tactical withdrawal', '', {
        // Call the mission end on the server
        if !(GVARMAIN(isTvT)) then {
            // Put the tasks into an array
            private _taskList = player call BFUNC(tasksUnit);

            // Count the succeeded tasks
            private _count = 0;
            _taskList apply {
                private _state = _x call BFUNC(taskState);
                if (_state == "SUCCEEDED") then {
                    _count = _count + 1;
                };
            };

            // Calculate the rate of the successful tasks
            private _rate = _count / count _taskList;

            switch (true) do {
                case (_rate == 1) : {
                    [QGVARMAIN(callMission), ["MissionSuccess", true]] call CFUNC(serverEvent);
                };
                case ((GVAR(successRate) * 0.01) <= _rate && _rate < 1) : {
                    [QGVARMAIN(callMission), ["WithdrawalWin", true]] call CFUNC(serverEvent);
                };
                case (0 < _rate && _rate < (GVAR(successRate) * 0.01)) : {
                    [QGVARMAIN(callMission), ["WithdrawalLose", false]] call CFUNC(serverEvent);
                };
                case (_rate == 0) : {
                    [QGVARMAIN(callMission), ["MissionFail", false]] call CFUNC(serverEvent);
                };
            };
        } else {
            if (playerSide == west) then {
                [QGVARMAIN(callMission), ["WithdrawalRedfor", true, east]] call CFUNC(serverEvent);
            } else {
                [QGVARMAIN(callMission), ["WithdrawalBlufor", true, west]] call CFUNC(serverEvent);
            };
        };
    }, {true}] call AFUNC(interact_menu,createAction);
    [player, 1, ["ACE_SelfActions", "End scenario"], _menu] call AFUNC(interact_menu,addActionToObject);
};
