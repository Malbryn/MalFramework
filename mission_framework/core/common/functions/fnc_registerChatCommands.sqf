#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Registers custom chat commands that can be used in the in-game chat.

    Arguments:
        -

    Example:
        call MF_common_fnc_registerChatCommands

    Returns:
        void
*/

if !(hasInterface) exitWith {};

// Add admin menu (if the admin logs-in after mission init)
["addAdminMenu", {
    call EFUNC(admin,addAdminMenu);
    MSG("INFO","Adding admin menu...");
}, "admin"] call CFUNC(registerChatCommand);

// Add an option to terminate the mission as admin
["terminateMission", {
    [QGVARMAIN(callMission), ["MissionTerminated", false, playerSide]] call CFUNC(serverEvent);
    MSG("INFO","Terminating mission...");
}, "admin"] call CFUNC(registerChatCommand);

// Open the Admin menu
["openAdminMenu", {
    createDialog "MF_AdminMenu";
}, "admin"] call CFUNC(registerChatCommand);
