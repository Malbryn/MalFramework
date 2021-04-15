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
    [COMPONENT_STR, "INFO", "Adding admin menu...", true] call EFUNC(main,log);
}, "admin"] call CFUNC(registerChatCommand);

// Add an option to terminate the mission as admin
["terminateMission", {
    [QEGVAR(end_mission,callMission), ["MissionTerminated", false, playerSide]] call CFUNC(serverEvent);
    [COMPONENT_STR, "INFO", "Terminating mission...", true] call EFUNC(main,log);
}, "admin"] call CFUNC(registerChatCommand);

// Open the Admin menu
["openAdminMenu", {
    createDialog "MF_AdminMenu";
}, "admin"] call CFUNC(registerChatCommand);
