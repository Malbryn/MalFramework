#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Updates the task list in the Admin Menu.

    Arguments:
        -

    Example:
        call MF_admin_fnc_updateTaskList

    Returns:
        void
*/

if !(hasInterface) exitWith {};

// Exit if the dialog is not visible
if (isNull findDisplay 799) exitWith {};

disableSerialization;

private _taskList = player call BFUNC(tasksUnit);
private _ctrl = (findDisplay 799) displayCtrl 712;

// Clear it first
lbClear 712;

_taskList apply {
    private _task = _x call BFUNC(taskDescription);
    private _taskName = (_task#1) joinString "";

    private _index = lbAdd [712, _taskName];

    // Get task type icon
    private _type = _x call BFUNC(taskType);
    private _typeIcon = getText (configfile >> "CfgTaskTypes" >> _type >> "icon");

    _ctrl lbSetPicture [_index, _typeIcon];

    // Get task state icon
    private _state = _x call BFUNC(taskState);

    private _stateIcon = switch (_state) do {
        case "ASSIGNED": {"taskAssigned_ca"};
        case "SUCCEEDED": {"taskSucceeded_ca"};
        case "FAILED": {"taskFailed_ca"};
        case "CANCELED": {"taskCanceled_ca"};
        default {"taskCreated_ca"};
    };

    _ctrl lbSetPictureRight [_index, format ["A3\ui_f\data\Map\Diary\Icons\%1.paa", _stateIcon]];

    // Task state colour
    private _state = _x call BFUNC(taskState);

    private _colour = switch (_state) do {
        case "ASSIGNED": {TASKCOLOUR_ASSIGNED};
        case "SUCCEEDED": {TASKCOLOUR_SUCCEEDED};
        case "FAILED": {TASKCOLOUR_FAILED};
        case "CANCELED": {TASKCOLOUR_CANCELLED};
        default {TASKCOLOUR_CREATED};
    };

    lbSetColor [712, _index, _colour];
    lbSetSelectColor [712, _index, _colour];

    _ctrl lbSetPictureColor [_index, _colour];
    _ctrl lbSetPictureColorSelected [_index, _colour];
    _ctrl lbSetPictureRightColor [_index, _colour];
    _ctrl lbSetPictureRightColorSelected [_index, _colour];

    // Attach the task ID to the row
    lbSetData [712, _index, _x];
};
