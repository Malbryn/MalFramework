/*
 * Author:
 * Malbryn
 *
 * Description:
 * Creates ACE self-interaction menu for the the CO to be able to call in supply drops
 *
 * Arguments:
 * -
 *
 * Return Value:
 * void
 *
 * Example:
 * [] execVM "mission_framework\root\MF_Logistics\supply_drop\addSupplyDropMenu.sqf"
 *
 */

if (hasInterface) then {

  if ((player getVariable "MF_var_is_CO")) then {

    _id = clientOwner;

    // Supply drop category
    private _switch = ['Supply drop', 'Supply drop', '\a3\ui_f\data\Map\VehicleIcons\iconParachute_ca.paa', {}, {true}] call ace_interact_menu_fnc_createAction;

    [player, 1, ["ACE_SelfActions"], _switch] call ace_interact_menu_fnc_addActionToObject;


    _crate = [];
    _crateName = "";

    {
      // Create a supply drop sub-menu under the Supply drop main category
      _crate = _x select 0;
      _crateName = _x select 1;

      _menu = [_crateName, _crateName, '', {}, {true}] call ace_interact_menu_fnc_createAction;

      [player, 1, ["ACE_SelfActions", "Supply drop"], _menu] call ace_interact_menu_fnc_addActionToObject;


      // Direction control
      _menu = ['Ingress: North', 'Ingress: North', '', {
        [(_this select 2) select 0, "north", 500, getPos player, _id] remoteExec ["MF_fnc_callSupplyDrop", 2, false];
        systemChat "HQ: Supply drop is on the way. ETA 1 minute, out.";

        [player, 1, ["ACE_SelfActions", "Supply drop", (_this select 2) select 1]] call ace_interact_menu_fnc_removeActionFromObject;
      }, {true}, {}, _x] call ace_interact_menu_fnc_createAction;

      [player, 1, ["ACE_SelfActions", "Supply drop", _crateName], _menu] call ace_interact_menu_fnc_addActionToObject;


      _menu = ['Ingress: East', 'Ingress: East', '', {
        [(_this select 2) select 0, "east", 500, getPos player, _id] remoteExec ["MF_fnc_callSupplyDrop", 2, false];
        systemChat "HQ: Supply drop is on the way. ETA 1 minute, out.";

        [player, 1, ["ACE_SelfActions", "Supply drop", (_this select 2) select 1]] call ace_interact_menu_fnc_removeActionFromObject;
      }, {true}, {}, _x] call ace_interact_menu_fnc_createAction;

      [player, 1, ["ACE_SelfActions", "Supply drop", _crateName], _menu] call ace_interact_menu_fnc_addActionToObject;


      _menu = ['Ingress: South', 'Ingress: South', '', {
        [(_this select 2) select 0, "south", 500, getPos player, _id] remoteExec ["MF_fnc_callSupplyDrop", 2, false];
        systemChat "HQ: Supply drop is on the way. ETA 1 minute, out.";

        [player, 1, ["ACE_SelfActions", "Supply drop", (_this select 2) select 1]] call ace_interact_menu_fnc_removeActionFromObject;
      }, {true}, {}, _x] call ace_interact_menu_fnc_createAction;

      [player, 1, ["ACE_SelfActions", "Supply drop", _crateName], _menu] call ace_interact_menu_fnc_addActionToObject;


      _menu = ['Ingress: West', 'Ingress: West', '', {
        [(_this select 2) select 0, "west", 500, getPos player, _id] remoteExec ["MF_fnc_callSupplyDrop", 2, false];
        systemChat "HQ: Supply drop is on the way. ETA 1 minute, out.";

        [player, 1, ["ACE_SelfActions", "Supply drop", (_this select 2) select 1]] call ace_interact_menu_fnc_removeActionFromObject;
      }, {true}, {}, _x] call ace_interact_menu_fnc_createAction;

      [player, 1, ["ACE_SelfActions", "Supply drop", _crateName], _menu] call ace_interact_menu_fnc_addActionToObject;

    } forEach MF_var_supply_drop_crates;
  };
};
