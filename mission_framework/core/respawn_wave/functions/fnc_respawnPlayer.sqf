#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Respawn the dead players

    Arguments:
        -

    Example:
        call MF_respawn_wave_fnc_callRespawnWave

    Returns:
        void
*/

// Check if the respawn tickets are enabled
if (GETVAR(player,EGVAR(respawn_tickets,amount),-1) != 0) then {

    setPlayerRespawnTime 6;

    ["RespawnCalled"] call BFUNC(showNotification);

    [{alive player}, {
        setPlayerRespawnTime 999999;
    }] call CFUNC(waitUntilAndExecute);
} else {
    ["Warning", ["The CO requested reinforcements but you don't have any respawns left."]] call BFUNC(showNotification);
};
