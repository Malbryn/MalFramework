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

// Get the currently selected player
private _player = lbText [718, lbCurSel 718];

if (_player != "") then {
    serverCommand format ["#kick %1", _player];
};
