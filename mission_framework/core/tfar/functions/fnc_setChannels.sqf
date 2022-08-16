#include "script_component.hpp"

/*
    Author:
        Malbryn, johnb43

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

// Wait until radios have been received
["TFAR_RadioRequestResponseEvent", {
    _thisArgs params ["_srChannel", "_lrChannel"];

    [_thisType, _thisId] call CFUNC(removeEventHandler);

    // Set short range; Timeout after 5s
    [{call TFUNC(haveSWRadio)}, {
        params ["_srChannel"];

        // TFAR uses 0-based channels!
        [(call TFUNC(activeSwRadio)), _srChannel - 1] call TFUNC(setSwChannel);
    }, [_srChannel], 5] call CFUNC(waitUntilAndExecute);

    // Set long range; Timeout after 5s
    [{call TFUNC(haveLRRadio)}, {
        params ["_lrChannel"];

        // TFAR uses 0-based channels!
        [(call TFUNC(activeLrRadio)), _lrChannel - 1] call TFUNC(setLrChannel);
    }, [_lrChannel], 5] call CFUNC(waitUntilAndExecute);
}, [_srChannel, _lrChannel]] call CFUNC(addEventHandlerArgs);
