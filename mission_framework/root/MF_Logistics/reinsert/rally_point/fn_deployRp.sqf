/*
 * Author:
 * Malbryn
 *
 * Description:
 * Deploys a Rally Point for the squad
 *
 * Arguments:
 * -
 *
 * Return Value:
 * void
 *
 * Example:
 * [] spawn MF_fnc_deployRp
 *
 */

if (!hasInterface) exitWith {};

// Check if it is enabled
if (!MF_var_use_rp) exitWith {
    ["Warning", ["Squad rally point system is not available in this mission!"]] call BIS_fnc_showNotification;
};


// Check if the rally point is already deployed
if !(isNil {(group player) getVariable "RPTent"}) exitWith {
    ["Warning", ["The RP is already deployed"]] call BIS_fnc_showNotification;
};


// Define squad members
private _unitArray = (units group player) - [player];


// Check if there's any squad member nearby
if !((_unitArray findIf {(_x distance player < 15) && alive _x}) > -1) exitWith {
    ["Warning", ["You need one more squad member nearby to be able to deploy a RP"]] call BIS_fnc_showNotification;
};


// Check if there's enemy nearby
if !(allUnits findIf {side _x getFriend side player < 0.6 && _x distance player < 50} == -1) exitWith {
    ["Warning", ["Cannot deploy a RP when enemies are nearby"]] call BIS_fnc_showNotification;
};


// Play animation (duration: 9 seconds)
player playMove "AinvPknlMstpSnonWrflDr_medic5";


// Display ACE progress bar
[12, [], {
    // Create RP tent and save the netId so other people can remove it as well
    private _RPTent = createVehicle [MF_var_rp_tent, player getPos [3, getDir player], [], 0, "CAN_COLLIDE"];
    private _id = netId _RPTent;
    (group player) setVariable ["RPTent", _id, true];

    // Send notification to the squad memebers
    private _unitArray = (units group player) - [player];
    ["Info", ["You have deployed the RP"]] call BIS_fnc_showNotification;
    ["Info", ["Your SL has deployed the RP"]] remoteExec ["BIS_fnc_showNotification", _unitArray];
}, {
    // Stop the animation if the progress bar was cancelled
    player switchMove "";
}, "Deploying Rally Point"] call ace_common_fnc_progressBar;