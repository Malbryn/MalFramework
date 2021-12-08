#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Checks every AI unit to see if they are hidden while having dynamic simulation enabled.
        See issue: https://github.com/Malbryn/MalFramework/issues/383
        Works in debug mode only.

    Arguments:
        -

    Example:
        call MF_main_fnc_checkUnits

    Returns:
        void
*/

if !(isServer && GVARMAIN(debugMode)) exitWith {};

private _hiddenUnits = [];

{
    if (isObjectHidden _x && (dynamicSimulationEnabled _x || dynamicSimulationEnabled (group _x))) then {
        _hiddenUnits pushBack _x;
    };
} forEach allUnits;

if (count _hiddenUnits != 0) then {
    [COMPONENT_STR, "WARNING", format ["The following units are hidden and have dynamic simulation enabled: %1", _hiddenUnits], true, 0] call FUNC(log);
};
