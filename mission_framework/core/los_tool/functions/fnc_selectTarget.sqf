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

[QGVAR(ID1), "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;

private _marker = "";
if (GVAR(firstGeneration)) then {
    _marker = createMarkerLocal [QGVAR(source), GVAR(sourcePos)];
    _marker setMarkerShapeLocal "ICON";
    _marker setMarkerTypeLocal "hd_dot";
    _marker setMarkerColorLocal "ColorBlue";
    _marker setMarkerTextLocal "Observer";
}
else {
    _marker = GVAR(markers) select 0;
};

_marker setMarkerPosLocal GVAR(sourcePos);
_marker setMarkerAlphaLocal 0.3;
GVAR(markers) set [0, _marker];


[QGVAR(ID2), "onMapSingleClick", {_pos call FUNC(setTarget)}] call BIS_fnc_addStackedEventHandler;

[
    {(count GVAR(targetPos)) != 0}, 
    FUNC(selectSize),
    [],
    10,
    {
        [QGVAR(ID2)] call FUNC(terminateEarly);
    }
] call CBA_fnc_WaitUntilAndExecute;
