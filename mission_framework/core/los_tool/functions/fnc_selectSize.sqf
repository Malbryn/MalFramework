#include "script_component.hpp"

/*
    Author:
        BlackHawk

    Description:
        -

    Arguments:
        -

    Example:
        -

    Returns:
        void
*/

[QGVAR(ID2), "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;

GVAR(pointingPos) = [];
GVAR(pointingPosDistance) = 0;

[QGVAR(ID3), "onMapSingleClick", {[GVAR(targetPos), _pos] call FUNC(setSize)}] call BIS_fnc_addStackedEventHandler;

[
    {GVAR(targetSize) != 0},
    {call FUNC(mainFunc)},
    [],
    10,
    {
        [QGVAR(ID3)] call FUNC(terminateEarly);
    }
] call CBA_fnc_WaitUntilAndExecute;
