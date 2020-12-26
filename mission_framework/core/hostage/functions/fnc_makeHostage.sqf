#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Handcuffs an AI unit and registers it as a hostage/POW.

    Arguments:
        0: OBJECT - The AI unit
        1: STRING - The ID of the task

    Example:
        [this, "t1"] call MF_hostage_fnc_makeHostage

    Returns:
        void
*/

params [["_unit", objNull], ["_taskID", ""]];

// Check stuff
if (isNull _unit) exitWith {MSG("ERROR","(Hostage) Unit is not found")};
if (_taskID == "") exitWith {MSG("ERROR","(Hostage) Empty task ID")};

// Handcuff
[_unit, true] call AFUNC(captives,setHandcuffed);

// Animation
_unit switchMove 'Acts_AidlPsitMstpSsurWnonDnon04';

// Register hostage
SETVAR(_unit,GVAR(assignedTask),_taskID);
private _index = GVAR(allHostages) pushBackUnique _unit;

// Log
INFO_2("Unit (%1) is registered as a hostage. Hostage array: %2",_unit,str GVAR(allHostages));

if (_index == -1) then {
    MSG_1("WARNING","(Hostage) Unit (%1) is already a hostage",_unit);
};
