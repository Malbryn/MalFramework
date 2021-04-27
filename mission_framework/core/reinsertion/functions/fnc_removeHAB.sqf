#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Removes the platoon HAB.

    Arguments:
        -

    Example:
        call MF_reinsertion_fnc_removeHAB

    Returns:
        void
*/

if !(hasInterface) exitWith {};

private _id = GETMVAR(GVAR(HAB),nil);

// Check if the rally point is deployed
if (isNil "_id") exitWith {
    ["Warning", ["The HAB hasn't been deployed yet"]] call BFUNC(showNotification);
};

// Play animation (duration: 9 seconds)
player playMove "AinvPknlMstpSnonWrflDr_medic5";

// Display ACE progress bar
[12, [], {
    // Remove the HAB and delete the coordinates
    private _id = GETMVAR(GVAR(HAB),nil);
    private _HAB = objectFromNetId _id;
    deleteVehicle _HAB;
    SETPMVAR(GVAR(HAB),nil);

    // Remove marker
    if GVAR(markHAB) then {
        deleteMarker "MF_mrk_HAB";
    };
}, {
    // Stop the animation if the progress bar was cancelled
    [player, ""] remoteExec ["switchMove", 0];
}, "Removing HAB"] call AFUNC(common,progressBar);
