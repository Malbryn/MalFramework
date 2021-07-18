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

if (GVAR(waveRespawn) == MANUAL) then {
    // Check if the respawn tickets are enabled
    if (GETVAR(player,GVAR(tickets),-1) != 0) then {
        setPlayerRespawnTime 6;

        ["RespawnCalled"] call BFUNC(showNotification);
    } else {
        ["Warning", ["The CO requested reinforcements but you don't have any respawns left."]] call BFUNC(showNotification);
    };
} else {
    ["Info", ["Respawning in 5 seconds..."]] call BFUNC(showNotification);

    setPlayerRespawnTime 6;
};
