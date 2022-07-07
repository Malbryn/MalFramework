#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Registers custom chat commands that can be used in the in-game chat.

    Arguments:
        -

    Example:
        call MF_admin_fnc_initChatCommands

    Returns:
        void
*/

if !(hasInterface) exitWith {};

// Terminate the mission
["terminateMission", {
    [QEGVAR(end_mission,callMission), ["MissionTerminated", false, playerSide]] call CFUNC(serverEvent);
    [COMPONENT_STR, "INFO", "Terminating mission...", true] call EFUNC(main,log);
}, "admin"] call CFUNC(registerChatCommand);

// Open the Admin menu
["openAdminMenu", {
    createDialog "MF_AdminMenu";
}, "admin"] call CFUNC(registerChatCommand);
