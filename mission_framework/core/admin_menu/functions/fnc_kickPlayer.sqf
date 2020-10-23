#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Kicks the currently slected player from the server.
        To be executed from the Admin menu.

    Arguments:
        -

    Example:
        call MF_admin_menu_fnc_kickPlayer

    Returns:
        void
*/

if !(hasInterface) exitWith {};

if !(IS_ADMIN_LOGGED) exitWith {
    MSG("INFO","You're not a logged in admin");
};

[] spawn {
    // Get the currently selected player
    private _player = lbText [718, lbCurSel 718];

    if (_player != "") then {
        private _confirm = [
            format ["Are you sure you want to kick %1?", _player], 
            "Confirm action",
            true,
            true,
            findDisplay 799
        ] call BFUNC(guiMessage);

        if (_confirm) then {
            "" serverCommand format ["#kick %1", _player];

            // Delete form the player list
            [{!isNull findDisplay 799}, {
                lbDelete [718, lbCurSel 718];
            }] call CFUNC(waitUntilAndExecute);
        };
    };
};
