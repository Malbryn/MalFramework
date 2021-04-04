#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Logs a message in the RPT log and displays it in-game (if the option is enabled).

    Arguments:
        0: STRING - The message
        1: BOOLEAN - If the message should be displayed in-game via systemChat

    Example:
        ["Descriptive message", true] call MF_main_fnc_writeRPT

    Returns:
        VOID
*/

params ["_msg", "_syschatEnabled"];

private _text = format ["[MF] %1", _msg];

[_text] call CFUNC(log);

// System chat
if (hasInterface && _syschatEnabled) then {
    systemChat _text;
};
