#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Create ACE self-interaction menu for the the game masters to control the scenario end

    Arguments:
        -

    Example:
        call MF_force_end_fnc_addAdminScenarioEndControlMenu

    Returns:
        void
*/

private ["_menu"];

if !(IS_ADMIN_LOGGED || getPlayerUID player == GETPAVAR(GVARMAIN(missionMaker),"")) exitWith {};


// Scenario control category
_menu = ['Scenario Flow', 'Scenario Flow', '', {}, {true}] call AFUNC(interact_menu,createAction);
[player, 1, ["ACE_SelfActions", "Admin Menu"], _menu] call AFUNC(interact_menu,addActionToObject);


// Mission Success
_menu = ['Mission Success', 'Mission Success', '', {
    [QGVARMAIN(missionEnd), ["MissionSuccess", true]] call CFUNC(serverEvent);
}, {true}] call AFUNC(interact_menu,createAction);

[player, 1, ["ACE_SelfActions", "Admin Menu", "Scenario Flow"], _menu] call AFUNC(interact_menu,addActionToObject);


// Mission Fail
_menu = ['Mission Fail', 'Mission Fail', '', {
    [QGVARMAIN(missionEnd), ["MissionFail", false]] call CFUNC(serverEvent);
}, {true}] call AFUNC(interact_menu,createAction);

[player, 1, ["ACE_SelfActions", "Admin Menu", "Scenario Flow"], _menu] call AFUNC(interact_menu,addActionToObject);


// Mission Terminated
_menu = ['Terminate Mission', 'Terminate Mission', '', {
    [QGVARMAIN(missionEnd), ["MissionTerminated", false]] call CFUNC(serverEvent);
}, {true}] call AFUNC(interact_menu,createAction);


[player, 1, ["ACE_SelfActions", "Admin Menu", "Scenario Flow"], _menu] call AFUNC(interact_menu,addActionToObject);
[player, 1, ["ACE_SelfActions", "Scenario flow"], _menu] call AFUNC(interact_menu,addActionToObject);
