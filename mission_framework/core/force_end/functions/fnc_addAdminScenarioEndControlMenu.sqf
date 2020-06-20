#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Creates an ACE self-interaction menu for the the game masters to control the scenario end.

    Arguments:
        -

    Example:
        call MF_force_end_fnc_addAdminScenarioEndControlMenu

    Returns:
        void
*/

if !(hasInterface) exitWith {};

if !(IS_ADMIN_LOGGED || getPlayerUID player == GETPAVAR(GVARMAIN(missionMaker),"")) exitWith {};

// Scenario control category
private _menu = ['End Mission', 'End Mission', '', {}, {true}] call AFUNC(interact_menu,createAction);

[player, 1, ["ACE_SelfActions", "Admin Menu"], _menu] call AFUNC(interact_menu,addActionToObject);

if !(GVARMAIN(isTvT)) then {
    // Mission Success
    _menu = ['Mission Success', 'Mission Success', '', {
        [QGVARMAIN(callMission), ["MissionSuccess", true, playerSide]] call CFUNC(serverEvent);
    }, {true}] call AFUNC(interact_menu,createAction);

    [player, 1, ["ACE_SelfActions", "Admin Menu", "End Mission"], _menu] call AFUNC(interact_menu,addActionToObject);

    // Mission Fail
    _menu = ['Mission Fail', 'Mission Fail', '', {
        [QGVARMAIN(callMission), ["MissionFail", false, playerSide]] call CFUNC(serverEvent);
    }, {true}] call AFUNC(interact_menu,createAction);

    [player, 1, ["ACE_SelfActions", "Admin Menu", "End Mission"], _menu] call AFUNC(interact_menu,addActionToObject);
};

// Mission Terminated
_menu = ['Terminate Mission', 'Terminate Mission', '', {
    [QGVARMAIN(callMission), ["MissionTerminated", false, playerSide]] call CFUNC(serverEvent);
}, {true}] call AFUNC(interact_menu,createAction);

[player, 1, ["ACE_SelfActions", "Admin Menu", "End Mission"], _menu] call AFUNC(interact_menu,addActionToObject);
