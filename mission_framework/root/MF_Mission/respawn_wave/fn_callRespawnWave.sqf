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
 * [] spawm MF_fnc_callRespawnWave
 *
 */

setPlayerRespawnTime 5;

["RespawnCalled"] call BIS_fnc_showNotification;

[{alive player}, {
    setPlayerRespawnTime 999999;
}] call CBA_fnc_waitUntilAndExecute;