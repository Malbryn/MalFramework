#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Starts the spectator mode according to the selected one in the config.

    Arguments:
        -

    Example:
        call MF_common_fnc_startSpectator

    Returns:
        void
*/

if !(hasInterface) exitWith {};

if (GVARMAIN(useACESpectator)) then {
    [true, true, true] call FUNC(initACESpectator);
} else {
    ["Initialize", [player, [], false, true, true, false, true, false, true, true]] call BFUNC(EGSpectator);
};
