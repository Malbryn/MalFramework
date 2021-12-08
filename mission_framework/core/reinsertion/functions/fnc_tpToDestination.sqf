#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Teleports the player to the selected destination.

    Arguments:
        0: STRING - Name of the destination
        1: ARRAY - Position of the destination

    Example:
        ["Marker's location", getMarkerPos "markerName"] spawn MF_reinsertion_fnc_tpToDestination

    Returns:
        void
*/

if !(hasInterface) exitWith {};

params [["_destination", "UNKNOWN"], ["_position", []]];

// Validate position
if (_position isEqualTo []) exitWith {
    [COMPONENT_STR, "ERROR", format ["Empty position of TP destination (%1)", _destination], true] call EFUNC(main,log);
};

// Confirmation box
private _result = [_destination] call FUNC(confirmTP);

if !(_result) exitWith {};

// Teleporting player
cutText [format ["You are being teleported to %1", _destination], "BLACK OUT", 2, true];

[{
    player setPos _this;

    [{
        cutText ["", "BLACK IN", 3, true];
    }, [], 1] call CFUNC(waitAndExecute);
}, _position, 2] call CFUNC(waitAndExecute);
