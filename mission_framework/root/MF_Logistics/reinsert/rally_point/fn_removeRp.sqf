/*
 * Author:
 * Malbryn
 *
 * Description:
 * Removes the group's Rally Point if it's nearby
 *
 * Arguments:
 * -
 *
 * Return Value:
 * void
 *
 * Example:
 * [] spawn MF_fnc_removeRp
 *
 */

 // Check if the RP tent is in range
 if (player distance RPTent > 5) exitWith {
  ["Warning", ["You are too far from the RP"]] call BIS_fnc_showNotification
};


// Play animation (duration: 9 seconds)
player playMove "AinvPknlMstpSnonWrflDr_medic5";


// Display ACE progress bar
[12, [], {
  // Create RP tent and save the coordinates
  deleteVehicle RPTent;
  (leader player) setVariable ["rpPos", nil, true];

  // Remove Remove menu
  [player, 1, ["ACE_SelfActions", "Rally Point", "Remove Rally Point"]] call ace_interact_menu_fnc_removeActionFromObject;

  // Create Deploy menu
  _menu = ['Deploy Rally Point', 'Deploy Rally Point', '', {
    [] call MF_fnc_deployRp;
  }, {true}] call ace_interact_menu_fnc_createAction;
  [player, 1, ["ACE_SelfActions", "Rally Point"], _menu] call ace_interact_menu_fnc_addActionToObject;
}, {}, "Removing Rally Point"] call ace_common_fnc_progressBar;