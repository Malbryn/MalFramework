/*
 * Author:
 * Malbryn
 *
 * Description:
 * Removes the group's Rally Point if it's nearby
 *
 * Arguments:
 * -
 *
 * Return Value:
 * void
 *
 * Example:
 * [] spawn MF_fnc_removeRp
 *
 */

// Check if the rally point is deployed
if (isNil { (group player) getVariable "RPTent" }) exitWith {
    ["Warning", ["The RP hasn't been deployed yet"]] call BIS_fnc_showNotification
};


// Check if the RP tent is in range
private _id = (group player) getVariable ["RPTent", nil];
private _RPTent = objectFromNetId _id;
 if (player distance _RPTent > 5) exitWith {
    ["Warning", ["You are too far from the RP"]] call BIS_fnc_showNotification
};


// Play animation (duration: 9 seconds)
player playMove "AinvPknlMstpSnonWrflDr_medic5";


// Display ACE progress bar
[12, [], {
    // Remove RP tent and save the coordinates
    private _id = (group player) getVariable ["RPTent", nil];
    private _RPTent = objectFromNetId _id;
    deleteVehicle _RPTent;
    (group player) setVariable ["RPTent", nil, true];

    // Send notification to the squad memebers
    private _unitArray = (units group player) - [player];
    ["Info", ["You have picked up the RP"]] call BIS_fnc_showNotification;
    ["Info", ["Your SL has picked up the RP"]] remoteExec ["BIS_fnc_showNotification", _unitArray];
}, {
    // Stop the animation if the progress bar was cancelled
    player switchMove "";
}, "Removing Rally Point"] call ace_common_fnc_progressBar;