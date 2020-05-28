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

params ["_displayID"];

GVAR(running) = false;

if (!isNil QGVAR(mouseMovingEH_ID)) then {
    (findDisplay GVAR(IDD) displayCtrl 51) ctrlRemoveEventHandler ["mouseMoving", GVAR(mouseMovingEH_ID)];
    GVAR(mouseMovingEH_ID) = nil;
};
if (!isNil QGVAR(drawEH_ID)) then {
    (findDisplay GVAR(IDD) displayCtrl 51) ctrlRemoveEventHandler ["Draw", GVAR(drawEH_ID)];
    GVAR(drawEH_ID) = nil;
};

if (!isNil QGVAR(keyDownEH_ID)) then {
    (findDisplay GVAR(keyDownEH_ID)) displayRemoveEventHandler ["keyDown", GVAR(keyDownEH_ID)];
    GVAR(keyDownEH_ID) = nil;
};

call FUNC(removeMarkers);

[_displayID, "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
