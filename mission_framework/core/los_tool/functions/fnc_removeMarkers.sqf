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

if (GVAR(generating) || GVAR(running)) exitWith {};

GVAR(firstGeneration) = true;

if (!isNull (findDisplay GVAR(IDD)) && !isNil QGVAR(drawEH_ID)) then {
    (findDisplay GVAR(IDD) displayCtrl 51) ctrlRemoveEventHandler ["Draw", GVAR(drawEH_ID)];
};

if ((count GVAR(markers)) != 0) then {
    {
        deleteMarkerLocal _x;
    } forEach GVAR(markers);
};
GVAR(markers) resize 0;
