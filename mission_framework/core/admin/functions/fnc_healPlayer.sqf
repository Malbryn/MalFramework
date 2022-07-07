#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Heals the currently selected player.
        To be executed from the Admin menu.

    Arguments:
        -

    Example:
        call MF_admin_fnc_healPlayer

    Returns:
        void
*/

if !(hasInterface) exitWith {};

// Get the currently selected player
private _player = lbText [718, lbCurSel 718];

if (_player != "") then {
    // Get the player object
    private _unit = objectFromNetId (lbData [718, lbCurSel 718]);

    [_unit, _unit] call AFUNC(medical_treatment,fullHeal);

    // Log
    [
        COMPONENT_STR,
        "INFO",
        format [
            "%1 has been healed",
            name _unit
        ],
        true
    ] call EFUNC(main,log);
};
