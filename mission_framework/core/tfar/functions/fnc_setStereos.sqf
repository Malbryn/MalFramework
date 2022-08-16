#include "script_component.hpp"

/*
    Author:
        Malbryn, johnb43

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

// Wait until radios have been received
["TFAR_RadioRequestResponseEvent", {
    _thisArgs params ["_srStereo", "_lrStereo"];

    [_thisType, _thisId] call CFUNC(removeEventHandler);

    // Set short range; Timeout after 5s
    [{call TFUNC(haveSWRadio)}, {
        params ["_srStereo"];

        [(call TFUNC(activeSwRadio)), _srStereo] call TFUNC(setSwStereo);
    }, [_srStereo], 5] call CFUNC(waitUntilAndExecute);

    // Set long range; Timeout after 5s
    [{call TFUNC(haveLRRadio)}, {
        params ["_lrStereo"];

        [(call TFUNC(activeLrRadio)), _lrStereo] call TFUNC(setLrStereo);
    }, [_lrStereo], 5] call CFUNC(waitUntilAndExecute);
}, [_srStereo, _lrStereo]] call CFUNC(addEventHandlerArgs);
