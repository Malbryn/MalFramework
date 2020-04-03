/*
 * Author:
 * Malbryn
 *
 * Description:
 * Respawns the dead players
 *
 * Arguments:
 * -
 *
 * Return Value:
 * void
 *
 * Example:
 * [] spawn MF_fnc_callRespawnWave
 *
 */

// Check if the respawn tickets are enabled
if (MF_var_respawn_tickets != 0) then {

    setPlayerRespawnTime 6;

    ["RespawnCalled"] call BIS_fnc_showNotification;

    [{alive player}, {
        setPlayerRespawnTime 999999;
    }] call CBA_fnc_waitUntilAndExecute;
    
} else {
    ["Warning", ["The CO called for reinforcements but you don't have any respawns left."]] call BIS_fnc_showNotification;
};