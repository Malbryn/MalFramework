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
            2: Local & Server - log the message on the client where it was called and on the server
            3: Target machine - log the message on target machine, target machine has to be passed
        5: OBJECT - Target machine when location [3] is used (Optional, default: local machine)

    Example:
        [COMPONENT_STR, "INFO", format ["Descriptive message: %1", _value], true, 2] call MF_main_fnc_log
        [COMPONENT_STR, "WARNING", "", true] call EFUNC(main,log);

        Output: 19:00:00 [MF] (Main) INFO: Descriptive message: test

    Returns:
        VOID
*/

params ["_component", "_level", "_msg", ["_syschatEnabled", false], ["_location", 1], ["_target", objNull]];

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

        // Prevent double messages in local multiplayer
        if !(isServer) then {
            [QGVAR(log), [_text, _syschatEnabled]] call CFUNC(localEvent);
        };
    };

    case 3: {
        if (isNull _target) then {
            [COMPONENT_STR, "INFO", "Logging: No target was passed, using local machine instead", false] call EFUNC(main,log);
            [QGVAR(log), [_text, _syschatEnabled]] call CFUNC(localEvent);
        } else {
            [QGVAR(log), [_text, _syschatEnabled], _target] call CFUNC(targetEvent);
        };
    };

    default {
        [QGVAR(log), [_text, _syschatEnabled]] call CFUNC(localEvent);
    };
};
