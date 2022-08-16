#include "script_component.hpp"

/*
    Author:
        Malbryn, johnb43

    Description:
        Cuts the grass around the player.

    Arguments:
        -

    Example:
        call MF_grass_cutter_fnc_cutGrass

    Returns:
        void
*/

if !(hasInterface) exitWith {};

// Required tool
if (GVAR(requireEntrenchingTool) && {!("ACE_EntrenchingTool" in (items player))}) exitWith {
    ["You need an entrenching tool<br/>to perform this action", 2, ace_player, 12] call AFUNC(common,displayTextStructured);
};

// Animation (duration: 9 seconds)
player playMove "AinvPknlMstpSnonWrflDr_medic5";

// ACE progress bar
[12, [], {
    createVehicle ["Land_ClutterCutter_medium_F", position player, [], 0, "CAN_COLLIDE"];
}, {
    // Stop the animation if the progress bar was cancelled
    [player, ""] remoteExec ["switchMove", 0];
}, "Cutting grass"] call AFUNC(common,progressBar);
