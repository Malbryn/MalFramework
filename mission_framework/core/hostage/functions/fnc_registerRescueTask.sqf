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
        4: BOOLEAN - Run mission end when task is completed? (Optional, default: false)

    Example:
        ["t2", "mrk_extraction", 3, 2, true] call MF_hostage_fnc_registerRescueTask

    Returns:
        void
*/

if !(isServer) exitWith {};

params [["_taskID", ""], ["_extZone", ""], ["_limitFail", -1], ["_limitSuccess", -1], ["_endMission", false]];

// Add a PFH to each task
// Delay the PFH until mission start so every hostage is initialised
[QGVARMAIN(initFramework), {
    _thisArgs params ["_taskID", "_extZone", "_limitFail", "_limitSuccess", "_endMission"];

    // Check stuff
    if !([_taskID] call BFUNC(taskExists)) exitWith {MSG_1("ERROR","(Hostage) Task (%1) does not exist!",_taskID)};
    if (getMarkerType _extZone == "") exitWith {MSG_1("ERROR","(Hostage) Marker (%1) does not exist!",_extZone)};
    if (_limitSuccess > count GVAR(allHostages)) then {
        MSG_2("WARNING","(Hostage) Required number of hostages (set to %1) is higher than the hostage count (%2)",
            _limitSuccess,count GVAR(allHostages)
        );
    };

    // Get the hostages
    private _hostages = GVAR(allHostages) select {GETVAR(_x,GVAR(assignedTask),"") == _taskID};

    // PFH
    private _handle = [{
        _this#0 params ["_hostages", "_taskID", "_extZone", "_limitFail", "_limitSuccess", "_endMission"];
        _this#1 params ["_handle"];

        // Check function
        [_handle, _hostages, _taskID, _extZone, _limitFail, _limitSuccess, _endMission] call FUNC(checkTaskConditions);
    }, 3, [_hostages, _taskID, _extZone, _limitFail, _limitSuccess, _endMission]] call CFUNC(addPerFrameHandler);
}, [_taskID, _extZone, _limitFail, _limitSuccess, _endMission]] call CFUNC(addEventHandlerArgs);
