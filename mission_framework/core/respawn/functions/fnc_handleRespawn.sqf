#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Handles the respawn on the client.

    Arguments:
        -

    Example:
        call MF_respawn_fnc_handleRespawn

    Returns:
        void
*/

if !(hasInterface) exitWith {};

// Check if the player's death was registered in the FW as well (not between death and the spectator screen)
// Also exit if the outro screen is running
if !(GETVAR(player,GVAR(isDead),false) || EGVAR(end_mission,outroIsRunning)) exitWith {
    [COMPONENT_STR, "INFO", format ["Handling respawn cancelled: player is dead or the outro is running"], false] call EFUNC(main,log);
};

if (GVAR(waveRespawn) == MANUAL) then {
    // Check if the respawn tickets are enabled
    if (GETVAR(player,GVAR(playerTickets),-1) != 0) then {
        setPlayerRespawnTime 6;

        ["RespawnCalled"] call BFUNC(showNotification);
    } else {
        ["Warning", ["The CO requested reinforcements but you don't have any respawns left."]] call BFUNC(showNotification);
    };
} else {
    ["Info", ["Respawning in 5 seconds..."]] call BFUNC(showNotification);

    setPlayerRespawnTime 6;
};
