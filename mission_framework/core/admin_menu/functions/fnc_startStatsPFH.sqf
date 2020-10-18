#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Start the PFH that monitors the stats in the admin menu.

    Arguments:
        -

    Example:
        call MF_admin_menu_fnc_startStatsPFH

    Returns:
        void
*/

if !(hasInterface) exitWith {};

// Time stats (updates every second)
GVAR(timeStatsPFH) = [{
    // Mission time
    private _missionTime = [CBA_missionTime] call EFUNC(common,getTimeStamp);
    ctrlSetText [702, _missionTime];

    // Mission progress
    private _timeLimit = [EGVAR(end_conditions,timeLimit)] call EFUNC(common,getTimeStamp);
    private _missionProgress = format ["%1 / %2", _missionTime, _timeLimit];
    ctrlSetText [714, _missionProgress];
    call FUNC(updateProgressBar);

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
    ctrlSetText [700, str EGVAR(performance,serverFPS)];

    // Server FPS (Min)
    ctrlSetText [701, str EGVAR(performance,serverFPSMin)];

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
    private _objects = count allMissionObjects "All";
    ctrlSetText [710, str _objects];

    // Dead units
    private _unitsDead = count allDeadMen;
    ctrlSetText [711, str _unitsDead];
}, 3] call CFUNC(addPerFrameHandler);
