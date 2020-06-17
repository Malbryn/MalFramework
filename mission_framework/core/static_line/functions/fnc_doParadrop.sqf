#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Kicks the infantry out of a plane and opens their parachutes simulating a static line paradrop.

    Arguments:
        -

    Example:
        [plane1] call MF_static_line_fnc_doParadrop

    Returns:
        void
*/

if !(hasInterface) exitWith {};

params ["_plane"];

private _cargoList = (crew _plane) select {(assignedVehicleRole _x)#0 isEqualTo "cargo"};

{
    [{  
        _this action ["Eject", (vehicle _this)];
        
        [{
            _this action ["OpenParachute", _this];
        }, _this, _forEachIndex + 1] call CFUNC(waitAndExecute);
    }, _x, _forEachIndex + .2] call CFUNC(waitAndExecute);
} forEach _cargoList;
