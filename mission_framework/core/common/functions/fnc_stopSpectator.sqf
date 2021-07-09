#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Stops the spectator mode according to the selected one in the config.

    Arguments:
        -

    Example:
        call MF_common_fnc_stopSpectator

    Returns:
        void
*/

if !(hasInterface) exitWith {};

if (GVARMAIN(useACESpectator)) then {
    [false] call FUNC(initACESpectator);
} else {
    ["Terminate"] call BFUNC(EGSpectator);
};
