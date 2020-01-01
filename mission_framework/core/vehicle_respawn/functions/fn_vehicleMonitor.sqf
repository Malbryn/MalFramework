/*
	File:
		fn_vehicleMonitor.sqf

	Author:
		Fredrik Eriksson

	Description:
		Vehicle respawn status monitoring.
*/
if (!isServer) exitWith {};
waitUntil {Sleep 0.5; count TotalVRArray > 0};

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

				_respawnCount = _vehicle getVariable ["VRRespawnCount", 0];
				_respawnLimit = _vehicle getVariable ["VRRespawnLimit", 0];
				if (_respawnCount > _respawnLimit OR {_vehicle getVariable ["VRStop", false]}) exitWith {};

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
					_newVehicle setVariable ["VRRespawnCount", _respawnCount + 1, true];
					_newVehicle setVariable ["VRRespawnLimit", _respawnLimit, true];
				};

				[_newVehicle, _name] remoteExec ["setVehicleVarName", 0, _newVehicle];

				_newVehicle call _init;

				TotalVRArray pushBack [_newVehicle, _vehicleData];
			};
			TotalVRArray set [_forEachIndex, ["DELETE"]];
		};
		Sleep 0.2;
	} forEach TotalVRArray;
	TotalVRArray = TotalVRArray select {!(typeName (_x select 0) == "STRING")};
	Sleep 5;
};
