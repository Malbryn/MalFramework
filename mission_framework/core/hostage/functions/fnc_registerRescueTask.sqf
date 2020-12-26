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
    private _handle = [{
        params [_handle, _taskID, _extZone, _limitFail, _limitSuccess, _endMission];
        

    }, 3, [_handle, _taskID, _extZone, _limitFail, _limitSuccess, _endMission]] call CFUNC(addPerFrameHandler);
}] call CFUNC(addEventHandler);
