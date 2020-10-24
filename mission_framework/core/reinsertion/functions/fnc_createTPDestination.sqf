#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Creates the RP menu for the group leader.
        Use the "createTPDestination" EH on the server to sync it with JIP players.
        (Example:
            [
                "MF_reinsertion_createTPDestination",
                ["Kavala City Centre", getMarkerPos "marker_kavala"]
            ] call CBA_fnc_globalEventJIP
        )

    Arguments:
        0: STRING - Name of the destination that appears in the scroll wheel menu
        1: ARRAY - Coordinates of the destination

    Example:
        ["Kavala City Centre", getMarkerPos "marker_kavala"] call MF_reinsertion_fnc_createTPDestination

    Returns:
        BOOLEAN
*/

if !(hasInterface) exitWith {};

params ["_name", "_pos"];

private _tpPoles = [];
private _pole = objNull;

GVAR(TPPoles) apply {
    _pole = call compile _x;
    _tpPoles pushBack _pole;
};

if (count _tpPoles == 0) exitWith {
    MSG("WARNING","(Reinsertion) The teleport pole array is empty");
    false
};

_tpPoles apply {
    if (isNull _x) exitWith {
        MSG_1("ERROR","(Reinsertion) Teleport pole object (%1) does not exist",_x);
    };

    // Add TP action
    _x addAction [format ["Teleport to %1", _name], {
        cutText [format ["You are being teleported to %1", _this#3#0], "BLACK OUT", 2, true];

        [{
            player setPos _this;

            [{
                cutText ["", "BLACK IN", 3, true];
            }, [], 1] call CFUNC(waitAndExecute);
        }, _this#3#1, 2] call CFUNC(waitAndExecute);
    }, [_name, _pos]];
};

true
