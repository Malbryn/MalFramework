/*
 * Author:
 * Malbryn
 *
 * Description:
 * Cuts the grass around the player
 *
 * Arguments:
 * -
 *
 * Return Value:
 * void
 *
 * Example:
 * [] call MF_fnc_cutGrass
 *
 */

// Required tool
_tool = "ACE_EntrenchingTool";

if !(_tool in (items player)) exitWith {["You need an entreching tool<br/>to perform this action", 2, ace_player, 12] call ace_common_fnc_displayTextStructured};
  
// Animation (duration: 9 seconds)
player playMove "AinvPknlMstpSnonWrflDr_medic5";

// ACE progress bar
[12, [], {
  _grassCutter = createVehicle ["Land_ClutterCutter_medium_F", position player, [], 0, "CAN_COLLIDE"];
}, {
  // Stop the animation if the progress bar was cancelled
  player switchMove "";
}, "Cutting grass"] call ace_common_fnc_progressBar;
