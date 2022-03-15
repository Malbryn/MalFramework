#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Registers a unit as a hostage/POW and optionally makes them handcuffed.

    Arguments:
        0: OBJECT - The AI unit
        1: STRING - The ID of the task
        2: BOOLEAN - Make unit handcuffed (Optional, default: true)

    Example:
        [this, "t1", false] call MF_hostage_fnc_makeHostage

    Returns:
        void
*/

params [["_unit", objNull], ["_taskID", ""], ["_isHandcuffed", true]];

// Check stuff
if (isNull _unit) exitWith {[COMPONENT_STR, "ERROR", "Unit is not found", true] call EFUNC(main,log)};
if (_taskID == "") exitWith {[COMPONENT_STR, "ERROR", "Task ID is empty", true] call EFUNC(main,log)};

// Apply handcuffs
if (_isHandcuffed) then {
    [_unit, true] call AFUNC(captives,setHandcuffed);
};

// Register hostage
SETVAR(_unit,GVAR(assignedTask),_taskID);
private _index = GVAR(allHostages) pushBackUnique _unit;

// Log
[COMPONENT_STR, "DEBUG", format [
    "Unit (%1) is registered as a hostage. Hostage array: %2", _unit, str GVAR(allHostages)
]] call EFUNC(main,log);

if (_index == -1) then {
    [COMPONENT_STR, "WARNING", format ["Unit (%1) is already a hostage", _unit], true] call EFUNC(main,log);
};
