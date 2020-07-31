#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Deploys the HAB for the platoon.

    Arguments:
        -

    Example:
        call MF_reinsertion_fnc_deployHAB

    Returns:
        void
*/

if !(hasInterface) exitWith {};

// Check if it is enabled
if !(GVARMAIN(moduleHAB)) exitWith {
    ["Warning", ["HAB system is not available in this mission!"]] call BFUNC(showNotification);
};

// Check if the HAB is already deployed
if !(isNil {GETMVAR(GVAR(HAB),nil)}) exitWith {
    ["Warning", ["The HAB is already deployed"]] call BFUNC(showNotification);
};

// Check if there's enemy nearby
if !(allUnits findIf {side _x != civilian && side _x getFriend playerSide < 0.6 && _x distance player < 50} == -1) exitWith {
    ["Warning", ["Cannot deploy a HAB when enemies are nearby"]] call BFUNC(showNotification);
};

// Play animation (duration: 9 seconds)
player playMove "AinvPknlMstpSnonWrflDr_medic5";

// Display ACE progress bar
[12, [], {
    // Create RP tent and save the netId so other people can remove it as well
    private _HAB = createVehicle [GVAR(HABObject), player getPos [8, getDir player], [], 0, "CAN_COLLIDE"];
    _HAB setDir (getDir player);
    private _id = netId _HAB;
    SETPMVAR(GVAR(HAB),_id);

    // Mark on map
    if GVAR(markHAB) then {
        switch (side player) do {
            case west : {
                private _marker = createMarker ["MF_mrk_HAB_west", _HAB];
                "MF_mrk_HAB_west" setMarkerType "b_hq";
                "MF_mrk_HAB_west" setMarkerColor "ColorWEST";
                "MF_mrk_HAB_west" setMarkerText "HAB";

                [QGVARMAIN(deleteMarkerSide), ["MF_mrk_HAB_west", east]] call CFUNC(globalEvent);
            };

            case east : {
                private _marker = createMarker ["MF_mrk_HAB_east", _HAB];
                "MF_mrk_HAB_east" setMarkerType "o_hq";
                "MF_mrk_HAB_east" setMarkerColor "ColorEAST";
                "MF_mrk_HAB_east" setMarkerText "HAB";

                [QGVARMAIN(deleteMarkerSide), ["MF_mrk_HAB_east", west]] call CFUNC(globalEvent);
            };

            default {
                private _marker = createMarker ["MF_mrk_HAB_ind", _HAB];
                "MF_mrk_HAB_ind" setMarkerType "n_hq";
                "MF_mrk_HAB_ind" setMarkerColor "ColorGUER";
                "MF_mrk_HAB_ind" setMarkerText "HAB";
            };
        };
    };
}, {
    // Stop the animation if the progress bar was cancelled
    [player, ""] remoteExec ["switchMove", 0];
}, "Building HAB"] call AFUNC(common,progressBar);
