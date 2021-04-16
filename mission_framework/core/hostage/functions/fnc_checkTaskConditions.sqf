#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Checks the conditions of the hostage rescue task.

    Arguments:
        0: SCALAR - ID of the PFH
        1: ARRAY - Array of the hostages linked to this task
        2: STRING - ID of the task
        3: STRING - Marker name for the extraction zone
        4: SCALAR - Number of hostages KIA to fail the task
        5: SCALAR - Number of rescued hostages to complete the task
        6: BOOLEAN - Should the mission end (MissionSuccess) if the task is successful (Optional, default: false)
        7: BOOLEAN - Should the mission end (MissionFailed) if the task is failed (Optional, default: false)

    Example:
        [2, [pow1, pow2], "t2", "mrk_extraction", 3, 2, true] call MF_hostage_fnc_checkTaskConditions

    Returns:
        void
*/

if !(isServer) exitWith {};

params ["_handle", "_hostages", "_taskID", "_extZone", "_limitFail", "_limitSuccess", ["_endSuccess", false], ["_endFail", false]];

// Check the death count
if ({!alive _x} count _hostages >= _limitFail) exitWith {
    [_taskID, "FAILED"] call BFUNC(taskSetState);

    // Stop PFH
    [_handle] call CFUNC(removePerFrameHandler);

    // End the mission if it was enabled
    if (_endFail) then {
        [QEGVAR(end_mission,callMission), ["MissionFail", false, playerSide]] call CFUNC(serverEvent);
    };
};

// If the task is done, we don't check the zone anymore to save performance
// However we still track the death of the hostages
if (_taskID call BFUNC(taskState) == "SUCCEEDED") exitWith {};

// Count the hostages inside the extraction zone
private _count = {
    _x inArea _extZone;
} count _hostages;

// Check the success limit
if (_count >= _limitSuccess) then {
    [_taskID, "SUCCEEDED"] call BFUNC(taskSetState);

    // End the mission if it was enabled
    if (_endSuccess) then {
        [QEGVAR(end_mission,callMission), ["MissionSuccess", true, playerSide]] call CFUNC(serverEvent);
    };
};
