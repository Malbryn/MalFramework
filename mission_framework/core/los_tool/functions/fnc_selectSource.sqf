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

[QGVAR(ID1), "onMapSingleClick", {_pos call FUNC(setSource)}] call BIS_fnc_addStackedEventHandler;

[
    {(count GVAR(sourcePos)) != 0}, 
    FUNC(selectTarget),
    [],
    10,
    {
        [QGVAR(ID1)] call FUNC(terminateEarly);
    }
] call CBA_fnc_WaitUntilAndExecute;
