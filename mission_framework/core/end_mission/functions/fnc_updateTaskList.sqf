#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Updates the task list in the End Screen.

    Arguments:
        -

    Example:
        call MF_end_mission_fnc_updateTaskList

    Returns:
        void
*/

if !(hasInterface) exitWith {};

// Exit if the dialog is not visible
if (isNull findDisplay 899) exitWith {};

disableSerialization;

private _taskList = player call BFUNC(tasksUnit);
private _ctrl = (findDisplay 899) displayCtrl 810;

_taskList apply {
    private _task = _x call BFUNC(taskDescription);
    private _taskName = (_task#1) joinString "";

    private _index = lbAdd [810, _taskName];

    // Get task type icon
    private _type = _x call BFUNC(taskType);
    private _typeIcon = getText (configfile >> "CfgTaskTypes" >> _type >> "icon");

    _ctrl lbSetPicture [_index, _typeIcon];
    _ctrl lbSetPictureColor [_index, [0.902, 0.902, 0.902, 1]];
    _ctrl lbSetPictureColorSelected [_index, [0.902, 0.902, 0.902, 1]];

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
    _ctrl lbSetPictureRightColor [_index, [0.902, 0.902, 0.902, 1]];
    _ctrl lbSetPictureRightColorSelected [_index, [0.902, 0.902, 0.902, 1]];
};
