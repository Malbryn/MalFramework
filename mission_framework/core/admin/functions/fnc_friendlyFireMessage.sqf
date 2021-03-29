#include "..\script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Sends a notification to the game masters when FF happens.
        Saves the incident in the end mission stats.

    Arguments:
        0: STRING - Name of the player who was killed
        1: STRING - Name of the player who was the killer

    Example:
        ["player1", "player2"] call MF_admin_fnc_friendlyFireMessage

    Returns:
        void
*/

params ["_killed", "_killer"];

// Notifying game masters
if (hasInterface) then {
    // End mission stats
    private _time = [CBA_missionTime] call BFUNC(secondsToString);
    private _text = format ["%1 - %2 was killed by %3", _time, _killed, _killer];

    PUSH(EGVAR(end_mission,friendlyFires),_text);

    // Notify game masters
    if (IS_ADMIN_LOGGED || getPlayerUID player == GETPAVAR(GVARMAIN(missionMaker),"")) then {
        MSG_2("WARNING","(Admin) %1 was killed by %2",_killed,_killer);
    };
};
