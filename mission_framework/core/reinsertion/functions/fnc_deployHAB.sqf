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
    ["Warning", ["HAB reinsertion is not available in this mission"]] call BFUNC(showNotification);
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
    // Create HAB and save the netId so other people can access it
    private _HAB = createVehicle [GVAR(HABObject), player getPos [8, getDir player], [], 0, "CAN_COLLIDE"];
    _HAB setDir (getDir player);
    private _id = netId _HAB;
    SETPMVAR(GVAR(HAB),_id);

    // Add TP to RP option
    if (GVARMAIN(moduleRP) && GVAR(allowTPFromHAB)) then {
        [QGVAR(addTPToRPOption), [_HAB], QGVAR(HABID)] call CFUNC(globalEventJIP);
        [QGVAR(HABID), _HAB] call CFUNC(removeGlobalEventJIP); // Remove JIP ID when the object is deleted
    };

    // Mark on map
    if GVAR(markHAB) then {
        private _marker = createMarker ["MF_mrk_HAB", _HAB];
        "MF_mrk_HAB" setMarkerText "HAB";

        switch (side player) do {
            case west : {
                "MF_mrk_HAB" setMarkerType "b_hq";
                "MF_mrk_HAB" setMarkerColor "ColorWEST";
            };

            case east : {
                "MF_mrk_HAB" setMarkerType "o_hq";
                "MF_mrk_HAB" setMarkerColor "ColorEAST";
            };

            default {
                "MF_mrk_HAB" setMarkerType "n_hq";
                "MF_mrk_HAB" setMarkerColor "ColorGUER";
            };
        };
    };

    // Add remove option
    private _menu = ['Remove HAB', 'Remove HAB', '', {
        call FUNC(removeHAB);
    }, {[_this#0] call FUNC(canRemoveHAB)}] call AFUNC(interact_menu,createAction);

    [_HAB, 0, ["ACE_MainActions"], _menu] call AFUNC(interact_menu,addActionToObject);

}, {
    // Stop the animation if the progress bar was cancelled
    [player, ""] remoteExec ["switchMove", 0];
}, "Building HAB"] call AFUNC(common,progressBar);
