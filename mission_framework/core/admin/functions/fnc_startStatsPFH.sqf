#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Start the PFH that monitors the stats in the admin menu.

    Arguments:
        -

    Example:
        call MF_admin_fnc_startStatsPFH

    Returns:
        void
*/

if !(hasInterface) exitWith {};

// Exit if the dialog is not visible
if (isNull findDisplay 799) exitWith {};

// Stop PFH's - in case they were running already
[GVAR(timeStatsPFH)] call CFUNC(removePerFrameHandler);
[GVAR(otherStatsPFH)] call CFUNC(removePerFrameHandler);

// Time stats (updates every second)
GVAR(timeStatsPFH) = [{
    // Mission progress
    private _missionTime = [CBA_missionTime] call EFUNC(common,getTimeStamp);

    if (GVARMAIN(moduleTimeLimit)) then {
        private _timeLimit = [EGVAR(end_conditions,timeLimit)] call EFUNC(common,getTimeStamp);
        private _missionProgress = format ["%1 / %2", _missionTime, _timeLimit];
        ctrlSetText [714, _missionProgress];
        call FUNC(updateProgressBar);
    } else {
        private _missionProgress = format ["%1 / --:--:--", _missionTime];
        ctrlSetText [714, _missionProgress];
    };

    // System time
    private _systemTime = [] call EFUNC(common,getSystemTime);
    ctrlSetText [715, _systemTime];

    // Server uptime
    private _uptime = [serverTime] call EFUNC(common,getTimeStamp);
    ctrlSetText [716, _uptime];
}, 1] call CFUNC(addPerFrameHandler);

// Other stats (updates every 3 seconds)
GVAR(otherStatsPFH) = [{
    // Server FPS (Current)
    ctrlSetText [700, str GVAR(serverFPS)];

    // Server FPS (Min)
    ctrlSetText [701, str GVAR(serverFPSMin)];

    // Current admin
    private _admin = call FUNC(getCurrentAdmin);
    ctrlSetText [702, _admin];

    // View distance (Server)
    ctrlSetText [703, str GVARMAIN(playerViewDistance)];

    // View distance (Player)
    ctrlSetText [704, str GVARMAIN(serverViewDistance)];

    // Unit count (All)
    private _units = count allUnits;
    ctrlSetText [705, str _units];

    // Unit count (BLUFOR)
    private _unitsBlufor = west countSide allUnits;
    ctrlSetText [706, str _unitsBlufor];

    // Unit count (REDFOR)
    private _unitsRedfor = east countSide allUnits;
    ctrlSetText [707, str _unitsRedfor];

    // Unit count (GREENFOR)
    private _unitsGreenfor = resistance countSide allUnits;
    ctrlSetText [708, str _unitsGreenfor];

    // Unit count (CIVFOR)
    private _unitsCivfor = civilian countSide allUnits;
    ctrlSetText [709, str _unitsCivfor];

    // Object count
    private _objects = (count allMissionObjects "All") - _units;
    ctrlSetText [710, str _objects];

    // Dead units
    private _unitsDead = count allDeadMen;
    ctrlSetText [711, str _unitsDead];
}, 3] call CFUNC(addPerFrameHandler);
