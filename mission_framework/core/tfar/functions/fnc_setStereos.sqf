#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Sets the unit's radios to the assigned stereo channels.

    Arguments:
        -

    Example:
        call MF_tfar_fnc_setStereos

    Returns:
        void
*/

private _srStereo = GETVAR(player,GVAR(srStereo),0);
private _lrStereo = GETVAR(player,GVAR(lrStereo),0);

// Fix group init issue with JIP (#342)
if (didJIP) then {
    // Get values from group unless they're the default value
    if (GETVAR((group player),GVAR(srStereoGroup),0) != 0) then {
        _srStereo = GETVAR((group player),GVAR(srStereoGroup),0);
    };

    if (GETVAR((group player),GVAR(lrStereoGroup),0) != 0) then {
        _lrStereo = GETVAR((group player),GVAR(lrStereoGroup),0);
    };
};

// Set short range
[{call TFUNC(haveSWRadio)}, {
    params ["_srStereo"];

    [(call TFUNC(activeSwRadio)), _srStereo] call TFUNC(setSwStereo);
}, [_srStereo]] call CFUNC(waitUntilAndExecute);

// Set long range
[{call TFUNC(haveLRRadio)}, {
    params ["_lrStereo"];

    [(call TFUNC(activeLrRadio)), _lrStereo] call TFUNC(setLrStereo);
}, [_lrStereo]] call CFUNC(waitUntilAndExecute);
