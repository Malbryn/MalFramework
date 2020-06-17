#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Deploys the Rally Point for the squad.

    Arguments:
        -

    Example:
        call MF_reinsert_fnc_deployRP

    Returns:
        void
*/

if !(hasInterface) exitWith {};

// Check if it is enabled
if !(GVARMAIN(moduleRP)) exitWith {
    ["Warning", ["Squad rally point system is not available in this mission!"]] call BFUNC(showNotification);
};

// Check if the rally point is already deployed
if !(isNil {GETVAR((group player),GVAR(RPTent),nil)}) exitWith {
    ["Warning", ["The RP is already deployed"]] call BFUNC(showNotification);
};

/* CURRENTLY DISABLED
// Define squad members
_unitArray = (units group player) - [player];


// Check if there's any squad member nearby
if !((_unitArray findIf {(_x distance player < 15) && alive _x}) > -1) exitWith {
    ["Warning", ["You need one more squad member nearby to be able to deploy a RP"]] call BFUNC(showNotification);
};
*/

// Check if there's enemy nearby
if !(allUnits findIf {side _x != civilian && side _x getFriend playerSide < 0.6 && _x distance player < 50} == -1) exitWith {
    ["Warning", ["Cannot deploy a RP when enemies are nearby"]] call BFUNC(showNotification);
};

// Play animation (duration: 9 seconds)
player playMove "AinvPknlMstpSnonWrflDr_medic5";

// Display ACE progress bar
[12, [], {
    // Create RP tent and save the netId so other people can remove it as well
    private _RPTent = createVehicle [GVAR(RPTentObject), player getPos [3, getDir player], [], 0, "CAN_COLLIDE"];
    _RPTent setDir (getDir player);
    private _id = netId _RPTent;
    SETPVAR((group player),GVAR(RPTent),_id);

    // Send notification to the squad memebers
    private _unitArray = (units group player) - [player];
    ["Info", ["You have deployed the RP"]] call BFUNC(showNotification);
    [QGVARMAIN(notification_2), ["Info", "Your SL has deployed the RP"], _unitArray] call CFUNC(targetEvent);

}, {
    // Stop the animation if the progress bar was cancelled
    player switchMove "";
}, "Deploying Rally Point"] call AFUNC(common,progressBar);
