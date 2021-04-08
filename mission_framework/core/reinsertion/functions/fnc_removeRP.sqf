#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Removes the group's Rally Point if it's nearby.

    Arguments:
        -

    Example:
        call MF_reinsertion_fnc_removeRP

    Returns:
        void
*/

if !(hasInterface) exitWith {};

// Check if the rally point is deployed
if (isNil {GETVAR((group player),GVAR(RPTent),nil)}) exitWith {
    ["Warning", ["The RP hasn't been deployed yet"]] call BFUNC(showNotification);
};

// Check if the RP tent is in range
private _id = GETVAR((group player),GVAR(RPTent),nil);
private _RPTent = objectFromNetId _id;

if (player distance _RPTent > 5) exitWith {
    ["Warning", ["You are too far from the RP"]] call BFUNC(showNotification);
};

// Play animation (duration: 9 seconds)
player playMove "AinvPknlMstpSnonWrflDr_medic5";

// Display ACE progress bar
[12, [], {
    // Remove RP tent and delete the coordinates
    private _id = GETVAR((group player),GVAR(RPTent),nil);
    private _RPTent = objectFromNetId _id;
    deleteVehicle _RPTent;
    SETPVAR((group player),GVAR(RPTent),nil);

    // Send notification to the squad memebers
    private _unitArray = (units group player) - [player];
    ["Info", ["You have picked up the RP"]] call BFUNC(showNotification);
    [QGVARMAIN(notification_2), ["Info", "The RP has been picked up"], _unitArray] call CFUNC(targetEvent);

    // Remove marker
    if GVAR(markRP) then {
        private _marker = GETVAR((group player),GVAR(markerRP),"");

        if (_marker == "") then {
            [COMPONENT_STR, "ERROR", "RP marker is not found", true] call EFUNC(main,log);
        } else {
            deleteMarker _marker;

            SETPVAR((group player),GVAR(markerRP),"");
        };
    };
}, {
    // Stop the animation if the progress bar was cancelled
    [player, ""] remoteExec ["switchMove", 0];
}, "Removing Rally Point"] call AFUNC(common,progressBar);
