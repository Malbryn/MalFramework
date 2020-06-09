#include "..\script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Send a notification to the logged-in admin and mission creator when FF happens.
        Save the incident in the end mission stats.

    Arguments:
        0: STRING - Name of the player who was killed
        1: STRING - Name of the player who was the killer

    Example:
        ["player1", "player2"] call MF_friendly_fire_fnc_friendlyFireMessage

    Returns:
        void
*/

params ["_killed", "_killer"];
private ["_time", "_text"];

// Notifying game masters
if (hasInterface && (IS_ADMIN_LOGGED || getPlayerUID player == GETPAVAR(GVARMAIN(missionMaker),""))) then {
    MSG_2("WARNING","%1 was killed by %2",_killed,_killer);
};


// End mission stats
if (isServer) then{
    _time = [CBA_missionTime] call BFUNC(secondsToString);
    _text = format ["%1  -  %2 was killed by %3 <br/>", _time, _killed, _killer];
    PUSH(EGVAR(mission_stats,friendlyFires),_text);
};
