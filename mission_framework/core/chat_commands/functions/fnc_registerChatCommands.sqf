#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Register custom chat commands that can be used in the in-game chat

    Arguments:
        -

    Example:
        [] call MF_chat_commands_fnc_registerChatCommands

    Returns:
        void
*/

// Add admin menu (if the admin logs-in after mission init)
["addAdminMenu", {
    [] call EFUNC(admin_menu,addAdminMenu);
    systemChat "[MF INFO] Adding admin menu...";
}, "admin"] call CBA_fnc_registerChatCommand;


// Add an option to terminate the mission as admin
["terminateMission", {
    ["MissionTerminated", false] remoteExec ["MF_fnc_endMission", 2];
    systemChat "[MF INFO] Terminating mission...";
}, "admin"] call CBA_fnc_registerChatCommand;
