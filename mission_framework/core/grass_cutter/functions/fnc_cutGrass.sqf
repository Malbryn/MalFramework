#include "script_component.hpp"

/*
    Author:
        Malbryn

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
private _tool = "ACE_EntrenchingTool";

if !(_tool in (items player)) exitWith {
    ["You need an entreching tool<br/>to perform this action", 2, ace_player, 12] call AFUNC(common,displayTextStructured);
};
  
// Animation (duration: 9 seconds)
player playMove "AinvPknlMstpSnonWrflDr_medic5";

// ACE progress bar
[12, [], {
    private _grassCutter = createVehicle ["Land_ClutterCutter_medium_F", position player, [], 0, "CAN_COLLIDE"];
}, {
    // Stop the animation if the progress bar was cancelled
    player switchMove "";
}, "Cutting grass"] call AFUNC(common,progressBar);
