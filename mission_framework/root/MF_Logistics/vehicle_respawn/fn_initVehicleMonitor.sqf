/*
 * Author:
 * Fredrik Eriksson
 *
 * Description:
 * Vehicle respawn status monitoring
 *
 * Arguments:
 * -
 *
 * Return Value:
 * void
 *
 * Example:
 * [] spawn MF_fnc_initVehicleMonitor
 *
 */

if (!isServer) exitWith {};

waitUntil {
  sleep 0.5;
  count MF_var_TotalVRArray > 0;
};

while {true} do {
	{
		if !(alive (_x select 0)) then {
			_x spawn {
				private ["_newVehicle"];
				params [
					["_vehicle", objNull, [objNull]],
					["_vehicleData", [], [[]]]
				];
				_vehicleData params [
					"_delay",
					"_init",
					"_loadout",
					"_name",
					"_position",
					"_direction",
					"_type",
					"_inventory",
					"_savePaint",
					"_paint",
					"_parts",
					"_deleteWreck",
					"_limitEnabled"
				];

				_respawnCount = _vehicle getVariable ["MF_var_VRRespawnCount", 0];
				_respawnLimit = _vehicle getVariable ["MF_var_VRRespawnLimit", 0];
				if (_respawnCount > _respawnLimit OR {_vehicle getVariable ["MF_var_VRStop", false]}) exitWith {};

				if _deleteWreck then {
					deleteVehicle _vehicle
				} else {
					if (_vehicle distance _position < 100) then {deleteVehicle _vehicle}
				};

				uiSleep (_delay + 0.1);
				_newVehicle = _type createVehicle ASLToAGL [0,0,100];
				_newVehicle setPosASL _position;
				_newVehicle setDir _direction;

				if _loadout then {[_newVehicle, _inventory] call MF_fnc_vehicleLoadout};
				if _savePaint then {[_newVehicle, _paint, _parts] call BIS_fnc_initVehicle};

				if _limitEnabled then {
					_newVehicle setVariable ["MF_var_VRRespawnCount", _respawnCount + 1, true];
					_newVehicle setVariable ["MF_var_VRRespawnLimit", _respawnLimit, true];
				};

				[_newVehicle, _name] remoteExec ["setVehicleVarName", 0, _newVehicle];

				_newVehicle call _init;

				MF_var_TotalVRArray pushBack [_newVehicle, _vehicleData];
			};
			MF_var_TotalVRArray set [_forEachIndex, ["DELETE"]];
		};
		Sleep 0.2;
	} forEach MF_var_TotalVRArray;

	MF_var_TotalVRArray = MF_var_TotalVRArray select {!(typeName (_x select 0) == "STRING")};
	Sleep 5;
};
