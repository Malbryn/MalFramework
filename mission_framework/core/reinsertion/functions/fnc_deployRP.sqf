#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Deploys the Rally Point for the squad.

    Arguments:
        -

    Example:
        call MF_reinsertion_fnc_deployRP

    Returns:
        void
*/

if !(hasInterface) exitWith {};

// Check if it is enabled
if !(GVARMAIN(moduleRP)) exitWith {
    ["Warning", ["Squad rally point system is not available in this mission!"]] call BFUNC(showNotification);
};

// Check if the rally point is already deployed
if (GVAR(RPPickUp) && !(isNil {GETVAR((group player),GVAR(RPTent),nil)})) exitWith {
    ["Warning", ["The RP is already deployed"]] call BFUNC(showNotification);
};

// Check if there's enemy nearby
if !(allUnits findIf {side _x != civilian && side _x getFriend playerSide < 0.6 && _x distance player < 50} == -1) exitWith {
    ["Warning", ["Cannot deploy a RP when enemies are nearby"]] call BFUNC(showNotification);
};

// Play animation (duration: 9 seconds)
player playMove "AinvPknlMstpSnonWrflDr_medic5";

// Display ACE progress bar
[12, [], {
    if !(GVAR(RPPickUp)) then {
        // Remove the previous RP tent and delete the coordinates
        private _id = GETVAR((group player),GVAR(RPTent),nil);
        private _RPTent = objectFromNetId _id;
        
        deleteVehicle _RPTent;
        SETPVAR((group player),GVAR(RPTent),nil);

        // Remove previous marker
        if GVAR(markRP) then {
            private _marker = GETVAR((group player),GVAR(markerRP),"");

            if (_marker != "") then {
                deleteMarker _marker;
                SETPVAR((group player),GVAR(markerRP),"");
            };
        };
    };

    // Create RP tent and save the netId so other people can access it too
    private _RPTent = createVehicle [GVAR(RPObject), player getPos [3, getDir player], [], 0, "CAN_COLLIDE"];
    _RPTent setDir (getDir player);
    private _id = netId _RPTent;
    SETPVAR((group player),GVAR(RPTent),_id);

    // Send notification to the squad memebers
    ["Info", ["You have deployed the RP"]] call BFUNC(showNotification);

    private _unitArray = (units group player) - [player];
    [QGVARMAIN(notification_2), ["Info", "The RP has been deployed"], _unitArray] call CFUNC(targetEvent);

    // Mark on map
    if GVAR(markRP) then {
        // Create a unique marker name
        private _markerName = format ["MF_%1", groupId (group player)];
        private _marker = createMarker [_markerName, getPos player, 3];

        _markerName setMarkerType "mil_box";
        _markerName setMarkerColor "ColorOrange";
        _markerName setMarkerText "RP";

        // Save as group var
        SETPVAR((group player),GVAR(markerRP),_markerName);
    };

    // Add remove option
    private _menu = ['Remove Rally Point', 'Remove Rally Point', '', {
        call FUNC(removeRP);
    }, {[_this#0] call FUNC(canRemoveRP)}] call AFUNC(interact_menu,createAction);

    [_RPTent, 0, ["ACE_MainActions"], _menu] call AFUNC(interact_menu,addActionToObject);
}, {
    // Stop the animation if the progress bar was cancelled
    [player, ""] remoteExec ["switchMove", 0];
}, "Deploying Rally Point"] call AFUNC(common,progressBar);
