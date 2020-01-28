/*
 * Author:
 * Malbryn
 *
 * Description:
 * Deploys a Rally Point for the squad
 *
 * Arguments:
 * -
 *
 * Return Value:
 * void
 *
 * Example:
 * [] spawn MF_fnc_deployRp
 *
 */

if (!hasInterface) exitWith {};

// Define squad members
private _unitArray = (units group player);
_unitArray deleteAt 0;


// Check if there's any squad member nearby
if !((_unitArray findIf {_x distance player < 15}) > -1) exitWith {
  ["Warning", ["You need one more squad member nearby to be able to deploy a RP"]] call BIS_fnc_showNotification
};


// Check if there's enemy nearby
if !(allUnits findIf {side _x getFriend side player < 0.6 && _x distance player < 50} == -1) exitWith {
  ["Warning", ["Cannot deploy a RP when enemies are nearby"]] call BIS_fnc_showNotification
};


// Play animation (duration: 9 seconds)
player playMove "AinvPknlMstpSnonWrflDr_medic5";


// Display ACE progress bar
[12, [], {
  // Create RP tent and save the coordinates
  RPTent = createVehicle ["Land_TentA_F", player getPos [3, getDir player], [], 0, "CAN_COLLIDE"];
  (leader player) setVariable ["rpPos", getPos player, true];

  // Remove Deploy menu
  [player, 1, ["ACE_SelfActions", "Rally Point", "Deploy Rally Point"]] call ace_interact_menu_fnc_removeActionFromObject;

  // Create Remove menu
  _menu = ['Remove Rally Point', 'Remove Rally Point', '', {
    [] call MF_fnc_removeRp;
  }, {true}] call ace_interact_menu_fnc_createAction;
  [player, 1, ["ACE_SelfActions", "Rally Point"], _menu] call ace_interact_menu_fnc_addActionToObject;
}, {
  // Stop the animation if the progress bar was cancelled
  player switchMove "";
}, "Deploying Rally Point"] call ace_common_fnc_progressBar;