#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        blank

    Arguments:
        -

    Example:
        [plane1] spawn MF_static_line_fnc_doParadrop

    Returns:
        void
*/

params ["_plane"];
private ["_cargoList"];

_cargoList = (crew _plane) select {(assignedVehicleRole _x)#0 isEqualTo "cargo"};

{
    [{  
        _this action ["GetOut", (vehicle _this)];
    }, _x, _forEachIndex + .2] call CFUNC(waitAndExecute);
} forEach _cargoList;
