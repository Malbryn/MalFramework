#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Brings the currently selected player to the player's location.
        To be executed from the Admin menu.

    Arguments:
        -

    Example:
        call MF_admin_fnc_bringPlayer

    Returns:
        void
*/

if !(hasInterface) exitWith {};

// Get the currently selected player
private _player = lbText [718, lbCurSel 718];

if (_player != "") then {
    // Get the player object
    private _unit = objectFromNetId (lbData [718, lbCurSel 718]);
    
    // Check if the player is in vehicle
    private _vicSpot = [player] call EFUNC(common,checkEmptySeat);
    
    if (vehicle player != player && _vicSpot) then {
        _unit moveInAny vehicle player;
    } else {
        _unit setPosATL (player getPos [2, getDir player]);
    };

    // Log
    [
        COMPONENT_STR,
        "INFO",
        format [
            "%1 has been teleported to your location",
            name _unit
        ],
        true
    ] call EFUNC(main,log);
};
