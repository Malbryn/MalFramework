/*
 * Author:
 * Diwako (customised by Malbryn)
 *
 * Description:
 * Initialises the JIP teleport system, adds an ACE self-interaction option to the player
 *
 * Arguments:
 * -
 *
 * Return Value:
 * void
 *
 * Example:
 * [] execVM "mission_framework\root\MF_Logistics\jip\jipCore.sqf"
 *
 */

if (hasInterface) then {

  // Init checks
  [{
    if (MF_var_jip_is_available) then {
      ["JipTeleport"] call BIS_fnc_showNotification;
    } else {
      ["Warning", ["JIP teleport is not available in this mission!"]] call BIS_fnc_showNotification;
    };
  }, [], 20] call CBA_fnc_waitAndExecute;


  // Code executed by the ACE interaction menu
  private _jipActionCode = {
    [] spawn {
      private _target = [] call MF_fnc_chooseTarget;
      private _vicSpot = [_target] call MF_fnc_checkEmptySeats;

      // Check the distance from the squad
      if ((([] call cba_fnc_players) - [player]) findif {_x distance2D player < 100} != -1) exitWith {
        ["Warning", ["JIP TP aborted. You're too close to your squad"]] call BIS_fnc_showNotification;
      };

      // Check if there are other people in the squad
      if !(count units group player > 1) exitWith {
        ["Warning", ["JIP TP aborted. You're the only one in the squad!"]] call BIS_fnc_showNotification;
      };

      // Check if there's anyone alive in the squad
      if !({alive _x} count units group player > 1) exitWith {
        ["Warning", ["JIP TP aborted. No one is alive in your squad!"]] call BIS_fnc_showNotification;
      };

      // Teleport section
      cutText ["You are being teleported back to your squad", "BLACK OUT", 2, true];
      uiSleep 3;
      if (_vicSpot) then {
        player moveInAny vehicle _target;
      } else {
        player setPosATL (_target getPos [3, getDir _target - 180]);
      };
      cutText ["", "BLACK IN", 2, true];

      // Disable JIP teleport after the player was teleported
      MF_var_jip_is_available = false;
      [player, 1, ["ACE_SelfActions", "Teleport to squad"]] call ace_interact_menu_fnc_removeActionFromObject;
    };
  };


  // Create ACE self-interaction option
  player setVariable ["_spawnPos", getPos player];

  private _jipTeleportAction = ["Teleport to squad", "Teleport to squad", "\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\transport_ca.paa", _jipActionCode, {player distance2D (player getvariable ["_spawnPos", [0, 0, 0]]) < 200}] call ace_interact_menu_fnc_createAction;

  [player, 1, ["ACE_SelfActions"], _jipTeleportAction] call ace_interact_menu_fnc_addActionToObject;


  // Remove option after 3 minutes
  [{
    [player, 1, ["ACE_SelfActions","Teleport to squad"]] call ace_interact_menu_fnc_removeActionFromObject;
    ["Warning", ["JIP teleport is no longer available!"]] call BIS_fnc_showNotification;
  }, [], MF_var_jip_timer] call CBA_fnc_waitAndExecute;
};