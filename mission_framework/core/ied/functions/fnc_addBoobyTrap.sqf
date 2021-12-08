#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Adds a booby trap to a target vehicle which will explode once the engine is turned on.

    Arguments:
        0: OBJECT - The target vehicle
        1: SCALAR - Delay between engine on and detonation in seconds (Optional, default: 1)

    Example:
        [this, 2] call MF_ied_fnc_addBoobyTrap

    Returns:
        void
*/

params ["_vehicle", ["_delay", 1]];

[_vehicle, "Engine", {
    _thisArgs params ["_vehicle", "_delay"];

    // Play sound
    playSound3D ["A3\Missions_F_Oldman\Data\sound\beep.ogg", _vehicle, false, getPosASL _vehicle, 5, 1, 50];

    [{
        params ["_vehicle"];

        playSound3D ["A3\Missions_F_Oldman\Data\sound\beep.ogg", _vehicle, false, getPosASL _vehicle, 5, 1, 50];
    }, [_vehicle], 0.18] call CFUNC(waitAndExecute);

    // Detonate
    [{
        params ["_vehicle", "_thisID"];

        if (alive _vehicle) then {
            private _ied = "Bo_GBU12_LGB" createVehicle (getPos _vehicle);
            hideObjectGlobal _ied;
            _vehicle setDamage 1;

            _vehicle removeEventHandler ["Engine", _thisID];
        };
    }, [_vehicle, _thisID], _delay] call CFUNC(waitAndExecute);
}, [_vehicle, _delay]] call CFUNC(addBISEventHandler);
    