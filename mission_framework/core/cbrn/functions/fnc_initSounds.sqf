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
    private _randomDelay = random [3, 4, 5];

    [{
        if (alive player && (goggles player) in GVAR(protectiveMasks)) then {
            private _randomDelay = random [1.25, 1.5, 2];

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
