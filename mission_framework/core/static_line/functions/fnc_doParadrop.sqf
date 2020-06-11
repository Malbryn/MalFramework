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
    _x action ["GetOut", vehicle _x];
    sleep 0.5;
} forEach _cargoList;
