#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Sets the unit's radios to the assigned channels.

    Arguments:
        -

    Example:
        call MF_tfar_fnc_setChannels

    Returns:
        void
*/

private _srChannel = GETVAR(player,GVAR(srChannel),1);
private _lrChannel = GETVAR(player,GVAR(lrChannel),1);

// Fix group init issue with JIP (#342)
if (didJIP) then {
    // Get values from group unless they're the default value
    if (GETVAR((group player),GVAR(srChannelGroup),1) != 1) then {
        _srChannel = GETVAR((group player),GVAR(srChannelGroup),1);
    };

    if (GETVAR((group player),GVAR(lrChannelGroup),1) != 1) then {
        _lrChannel = GETVAR((group player),GVAR(lrChannelGroup),1);
    };
};

// Set short range
[{call TFUNC(haveSWRadio)}, {
    params ["_srChannel"];

    // TFAR uses 0-based channels!
    [(call TFUNC(activeSwRadio)), _srChannel - 1] call TFUNC(setSwChannel);
}, [_srChannel]] call CFUNC(waitUntilAndExecute);

// Set long range
[{call TFUNC(haveLRRadio)}, {
    params ["_lrChannel"];

    // TFAR uses 0-based channels!
    [(call TFUNC(activeLrRadio)), _lrChannel - 1] call TFUNC(setLrChannel);
}, [_lrChannel]] call CFUNC(waitUntilAndExecute);
