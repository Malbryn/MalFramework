#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Registers a task as a rescue type of task.

    Arguments:
        0: STRING - ID of the task
        1: STRING - Marker name for the extraction zone
        2: SCALAR - Number of hostages KIA to fail the task
        3: SCALAR - Number of rescued hostages to complete the task
        4: BOOLEAN - Should the mission end (MissionSuccess) if the task is successful (Optional, default: false)
        5: BOOLEAN - Should the mission end (MissionFailed) if the task is failed (Optional, default: false)

    Example:
        ["t2", "mrk_extraction", 3, 2, true] call MF_hostage_fnc_registerRescueTask

    Returns:
        void
*/

if !(isServer) exitWith {};

params [["_taskID", ""], ["_extZone", ""], ["_limitFail", -1], ["_limitSuccess", -1], ["_endSuccess", false], ["_endFail", false]];

// Add a PFH to each task
// Delay the PFH until mission start so every hostage is initialised
[QGVARMAIN(initFramework), {
    _thisArgs params ["_taskID", "_extZone", "_limitFail", "_limitSuccess", "_endSuccess", "_endFail"];

    // Check stuff
    if (getMarkerType _extZone == "") then {
        [COMPONENT_STR, "WARNING", format ["Marker (%1) does not exist", _extZone], false, 0] call EFUNC(main,log);
    };

    if !([_taskID] call BFUNC(taskExists)) then {
        [COMPONENT_STR, "DEBUG", format ["Task (%1) does not exist", _taskID], true, 0] call EFUNC(main,log);
    };

    if (_limitSuccess > count GVAR(allHostages)) then {
        [COMPONENT_STR, "WARNING", format [
            "Required number of hostages (set to %1) is higher than the hostage count (current: %2)", _limitSuccess, count GVAR(allHostages)
        ], true, 0] call EFUNC(main,log);
    };

    // Get the hostages
    private _hostages = GVAR(allHostages) select {GETVAR(_x,GVAR(assignedTask),"") == _taskID};

    // PFH
    private _handle = [{
        _this#0 params ["_hostages", "_taskID", "_extZone", "_limitFail", "_limitSuccess", "_endSuccess", "_endFail"];
        _this#1 params ["_handle"];

        // Check function
        [_handle, _hostages, _taskID, _extZone, _limitFail, _limitSuccess, _endSuccess, _endFail] call FUNC(checkTaskConditions);
    }, 3, [_hostages, _taskID, _extZone, _limitFail, _limitSuccess, _endSuccess, _endFail]] call CFUNC(addPerFrameHandler);
}, [_taskID, _extZone, _limitFail, _limitSuccess, _endSuccess, _endFail]] call CFUNC(addEventHandlerArgs);
