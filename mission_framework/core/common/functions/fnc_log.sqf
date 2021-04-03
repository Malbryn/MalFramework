#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Handles the logging of the framework.

    Arguments:
        0: STRING - Name of the module (use COMPONENT_STR macro)
        1: STRING - Log level (ERROR, WARNING, INFO, DEBUG)
        2: STRING - Message
        3: BOOLEAN - If the message is displayed in-game via systemChat (Optional, default: false)
        4: SCALAR - Location of the message (Optional, default: 1)
            0: Global - log the message on every machine
            1: Local - log the message on the machine where it was called
            2: Server - log the message on the client where it was called and on the server

    Example:
        [COMPONENT_STR, "INFO", format ["Descriptive message: %1", _value], true, 2] call MF_common_fnc_log

        Output: 19:00:00 [MF] (Common) INFO: Descriptive message: test

    Returns:
        VOID
*/

params ["_component", "_level", "_msg", ["_syschatEnabled", false], ["_location", 1]];

// Ignore debug messages if debug mode is not on
if (!GVARMAIN(debugMode) && _level == "DEBUG") exitWith {};

// Build message
private _text = format ["(%1) %2: %3", _component, _level, _msg];

// Send message
switch (_location) do {
    case 0: {
        [QGVAR(log), [_text, _syschatEnabled]] call CFUNC(globalEvent);
    };

    case 2: {
        [QGVAR(log), [_text, _syschatEnabled]] call CFUNC(serverEvent);
        [QGVAR(log), [_text, _syschatEnabled]] call CFUNC(localEvent);
    };

    default {
        [QGVAR(log), [_text, _syschatEnabled]] call CFUNC(localEvent);
    };
};
