#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Creates a teleport destination (one-way teleport).
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
    [COMPONENT_STR, "WARNING", "The teleport pole array is empty", true] call EFUNC(main,log);
    false
};

_tpPoles apply {
    if (isNull _x) exitWith {
        [COMPONENT_STR, "WARNING", format ["Teleport pole object (%1) does not exist", _x], true] call EFUNC(main,log);
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
    }, [_name, _pos], 1, true, true, "", "true", 12];
};

true
