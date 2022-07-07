#include "..\script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Displays a message about a friendly-fire incident to the game masters.
        Saves the incident in the end mission stats.

    Arguments:
        0: STRING - Name of the player who was killed
        1: STRING - Name of the player who was the killer

    Example:
        ["player1", "player2"] call MF_admin_fnc_handleFriendlyFire

    Returns:
        void
*/

params [
    ["_killed", "", [""]],
    ["_killer", "", [""]]
];

// End mission stats
private _time = [CBA_missionTime] call BFUNC(secondsToString);
private _text = format ["%1  %2 (by %3)", _time, _killed, _killer];

PUSH(EGVAR(end_mission,friendlyFires),_text);

// Notify if the player is a game master
if (isServer || {call FUNC(isGameMaster)}) then {
    [
        COMPONENT_STR,
        "INFO",
        format [
            "%1 was killed by %2",
            _killed, _killer
        ],
        true
    ] call EFUNC(main,log);
};
