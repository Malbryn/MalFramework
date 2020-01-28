/*
 * Author:
 * Malbryn
 *
 * Description:
 * Prepares the end screen statistics variables
 *
 * Arguments:
 * -
 *
 * Return Value:
 * void
 *
 * Example:
 * [] call MF_fnc_getStats
 *
 */

// Get mission time
[] remoteExec ["MF_fnc_saveMissionTime", 2];

// Get friendly fires
[] remoteExec ["MF_fnc_saveFriendlyFires", 2];
