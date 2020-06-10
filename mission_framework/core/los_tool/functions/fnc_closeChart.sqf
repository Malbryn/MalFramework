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

if (!GVAR(chartDrawn)) exitWith {};

GVAR(profileStartPos) = [];
GVAR(profileEndPos) = [];

(findDisplay GVAR(IDD) displayCtrl 51) ctrlRemoveEventHandler ["mouseMoving", GVAR(profileMouseMovingEH_ID)];
(findDisplay GVAR(IDD) displayCtrl 51) ctrlRemoveEventHandler ["Draw", GVAR(profileDrawEH_ID)];
[QGVAR(profile_ID1), "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;

(findDisplay GVAR(IDD) displayCtrl 51) ctrlMapCursor ["Track", "Track"];

GVAR(chartDrawn) = false;
GVAR(profileRunning) = false;
