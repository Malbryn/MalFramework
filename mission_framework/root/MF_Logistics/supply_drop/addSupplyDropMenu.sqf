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

if (!hasInterface) exitWith {};

//if ((player getVariable "MF_var_is_CO")) then {

  // Supply drop category
  private _switch = ['Supply drop', 'Supply drop', '', {}, {true}] call ace_interact_menu_fnc_createAction;

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
    [(_this select 2) select 0, "north", 500] spawn MF_fnc_callSupplyDrop;
  }, {true}, {}, _x] call ace_interact_menu_fnc_createAction;

  [player, 1, ["ACE_SelfActions", "Supply drop", _crateName], _menu] call ace_interact_menu_fnc_addActionToObject;


  _menu = ['Ingress: East', 'Ingress: East', '', {
    [(_this select 2) select 0, "east", 500] spawn MF_fnc_callSupplyDrop;
  }, {true}, {}, _x] call ace_interact_menu_fnc_createAction;

  [player, 1, ["ACE_SelfActions", "Supply drop", _crateName], _menu] call ace_interact_menu_fnc_addActionToObject;


  _menu = ['Ingress: South', 'Ingress: South', '', {
    [(_this select 2) select 0, "south", 500] spawn MF_fnc_callSupplyDrop;
  }, {true}, {}, _x] call ace_interact_menu_fnc_createAction;

  [player, 1, ["ACE_SelfActions", "Supply drop", _crateName], _menu] call ace_interact_menu_fnc_addActionToObject;


  _menu = ['Ingress: West', 'Ingress: West', '', {
    [(_this select 2) select 0, "west", 500] spawn MF_fnc_callSupplyDrop;
  }, {true}, {}, _x] call ace_interact_menu_fnc_createAction;

  [player, 1, ["ACE_SelfActions", "Supply drop", _crateName], _menu] call ace_interact_menu_fnc_addActionToObject;

} forEach MF_var_supply_drop_crates;