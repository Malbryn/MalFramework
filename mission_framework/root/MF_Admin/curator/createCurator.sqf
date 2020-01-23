/*
 * Author:
 * Commy2 (modified by Malbryn)
 *
 * Description:
 * Creates a curator module
 *
 * Arguments:
 * -
 *
 * Return Value:
 * void
 *
 * Example:
 * [] execVM "mission_framework\root\MF_Admin\curator\createCurator.sqf"
 *
 */

if (isServer) then {
  ["MF_registerCurator", {
    params ["_unit"];

    private _curator = createGroup sideLogic createUnit ["ModuleCurator_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
    [_curator, _unit, true] call ace_zeus_fnc_bi_moduleCurator;
    _unit assignCurator _curator;

	  _curator addCuratorEditableObjects [allPlayers, true];
	  _curator addCuratorEditableObjects [(allMissionObjects "Air"), true];
	  _curator addCuratorEditableObjects [(allMissionObjects "Ship"), true];
	  _curator addCuratorEditableObjects [(allMissionObjects "LandVehicle"), true];
	  _curator addCuratorEditableObjects [(allMissionObjects "Man"), true];

    "Logged-in admin: Registered as Curator." remoteExec ["systemChat", _unit];
  }] call CBA_fnc_addEventHandler;
};
