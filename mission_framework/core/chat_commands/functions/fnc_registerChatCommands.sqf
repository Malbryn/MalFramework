#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Register custom chat commands that can be used in the in-game chat

    Arguments:
        -

    Example:
        call MF_chat_commands_fnc_registerChatCommands

    Returns:
        void
*/

// Add admin menu (if the admin logs-in after mission init)
["addAdminMenu", {
    call EFUNC(admin_menu,addAdminMenu);
    MSG("INFO","Adding admin menu...");
}, "admin"] call CFUNC(registerChatCommand);


// Add an option to terminate the mission as admin
["terminateMission", {
    // TODO: Rewrite this
    ["MissionTerminated", false] remoteExec ["MF_fnc_endMission", 2];
    MSG("INFO","Terminating mission...");
}, "admin"] call CFUNC(registerChatCommand);
