#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Teleports the player to the currently selected player's location.
        To be executed from the Admin menu.

    Arguments:
        -

    Example:
        call MF_admin_fnc_teleportToPlayer

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
    private _vicSpot = [_unit] call EFUNC(common,checkEmptySeat);
    
    if (vehicle _unit != _unit && _vicSpot) then {
        player moveInAny vehicle _unit;
    } else {
        player setPosATL (_unit getPos [2, getDir _unit]);
    };

    [
        COMPONENT_STR,
        "INFO",
        format [
            "You have teleported to %1",
            name _unit
        ],
        true
    ] call EFUNC(main,log);
};
