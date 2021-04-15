#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Removes the platoon HAB if it's nearby.

    Arguments:
        -

    Example:
        call MF_reinsertion_fnc_removeHAB

    Returns:
        void
*/

if !(hasInterface) exitWith {};

// Check if the rally point is deployed
if (isNil {GETMVAR(GVAR(HAB),nil)}) exitWith {
    ["Warning", ["The HAB hasn't been deployed yet"]] call BFUNC(showNotification);
};

// Check if the HAB tent is in range
private _id = GETMVAR(GVAR(HAB),nil);
private _HAB = objectFromNetId _id;

if (player distance _HAB > 10) exitWith {
    ["Warning", ["You are too far from the HAB"]] call BFUNC(showNotification);
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
        switch (side player) do {
            case west : {
                [QGVARMAIN(deleteMarkerSide), ["MF_mrk_HAB_west", west]] call CFUNC(globalEvent);
            };

            case east : {
                [QGVARMAIN(deleteMarkerSide), ["MF_mrk_HAB_east", east]] call CFUNC(globalEvent);
            };

            default {
                [QGVARMAIN(deleteMarkerSide), ["MF_mrk_HAB_ind", independent]] call CFUNC(globalEvent);
            };
        };
    };
}, {
    // Stop the animation if the progress bar was cancelled
    [player, ""] remoteExec ["switchMove", 0];
}, "Removing HAB"] call AFUNC(common,progressBar);
