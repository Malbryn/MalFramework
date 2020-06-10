#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Remove the group's Rally Point if it's nearby

    Arguments:
        -

    Example:
        call MF_reinsert_fnc_removeRP

    Returns:
        void
*/

private ["_RPTent", "_id"];

// Check if the rally point is deployed
if (isNil {GETVAR((group player),GVAR(RPTent),nil)}) exitWith {
    ["Warning", ["The RP hasn't been deployed yet"]] call BFUNC(showNotification);
};


// Check if the RP tent is in range
_id = GETVAR((group player),GVAR(RPTent),nil);
_RPTent = objectFromNetId _id;

if (player distance _RPTent > 5) exitWith {
    ["Warning", ["You are too far from the RP"]] call BFUNC(showNotification);
};


// Play animation (duration: 9 seconds)
player playMove "AinvPknlMstpSnonWrflDr_medic5";


// Display ACE progress bar
[12, [], {
    private ["_RPTent", "_id", "_unitArray"];

    // Remove RP tent and save the coordinates
    _id = GETVAR((group player),GVAR(RPTent),nil);
    _RPTent = objectFromNetId _id;
    deleteVehicle _RPTent;
    SETPVAR((group player),GVAR(RPTent),nil);

    // Send notification to the squad memebers
    _unitArray = (units group player) - [player];
    ["Info", ["You have picked up the RP"]] call BFUNC(showNotification);
    [QGVARMAIN(notification_2), ["Info", "Your SL has picked up the RP"], _unitArray] call CFUNC(targetEvent);
}, {
    // Stop the animation if the progress bar was cancelled
    player switchMove "";
}, "Removing Rally Point"] call ace_common_fnc_progressBar;
