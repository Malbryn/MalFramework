#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Starts the mask sounds.

    Arguments:
        -

    Example:
        call MF_cbrn_fnc_initSounds

    Returns:
        void
*/

if !(hasInterface) exitWith {};

[{alive player && (goggles player) in GVAR(protectiveMasks)}, {
    private _fatigue = GETMVAR(ace_advanced_fatigue_anReserve,2300);
    private _randomDelay = [random [3, 3.5, 4], random [1, 1.25, 1.5]] select (_fatigue < 750);
    
    [{
        if (alive player && (goggles player) in GVAR(protectiveMasks)) then {
            private _fatigue = GETVAR(player,ace_advanced_fatigue_anReserve,2300);
            private _randomDelay = [random [1.25, 1.5, 2], random [1, 1.1, 1.2]] select (_fatigue < 750);

            playSound format ["MF_BreathIn%1", ceil (random 3)];

            [{
                if (alive player && (goggles player) in GVAR(protectiveMasks)) then {
                    playSound format ["MF_BreathOut%1", ceil (random 3)];
                };

                call FUNC(initSounds);
            }, [], _randomDelay] call CFUNC(waitAndExecute);
        } else {
            call FUNC(initSounds);
        };
    }, [], _randomDelay] call CFUNC(waitAndExecute);
}] call CFUNC(waitUntilAndExecute);
