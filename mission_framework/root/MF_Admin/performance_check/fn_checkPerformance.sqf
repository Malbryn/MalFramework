/*
 * Author:
 * Malbryn
 *
 * Description:
 * Checks the performance of the server and the mission
 *
 * Arguments:
 * -
 *
 * Return Value:
 * void
 *
 * Example:
 * [] spawn MF_fnc_checkPerformance
 *
 */

if (!hasInterface) exitWith {};

_serverFps = MF_var_server_fps;
_serverMinFps = MF_var_server_fps_min;
_serverTime = ceil (serverTime / 60);
_missionTime = ceil (CBA_missionTime / 60);
_date = date;

_units = count allUnits;
_players = playersNumber playerSide;
_unitsBlufor = west countSide allUnits;
_unitsRedfor = east countSide allUnits;
_unitsGreenfor = resistance countSide allUnits;
_unitsCivfor = civilian countSide allUnits;
_unitsDead = count allDeadMen;

_objects = count allMissionObjects "All";
_objectsVehicles = count vehicles;

_viewDistancePlayer = MF_var_view_distance_player;
_viewDistanceServer = MF_var_view_distance_server;


[["--- PERFORMANCE ---<br/>
  SERVER:<br/>
    Server FPS: %1<br/>
	Minimum server FPS: %2<br/>
	Server uptime: %3 minutes<br/>
	Mission time: %4 minutes<br/>
	Date: %5<br/>
  <br/>
  UNITS:<br/>
    All units: %6<br/>
	Players: %7<br/>
	Units (BLUFOR): %8<br/>
	Units (REDFOR): %9<br/>
	Units (INDFOR): %10<br/>
	Units (CIVFOR): %11<br/>
	Dead units: %12<br/>
  <br/>
  OBJECTS:<br/>
    Objects: %13<br/>
	Vehicles: %14<br/>
  <br/>
  VIEW DISTANCES:<br/>
    Player: %15<br/>
	AI: %16
",
_serverFps, _serverMinFps, _serverTime, _missionTime, _date,
_units, _players, _unitsBlufor, _unitsRedfor, _unitsGreenfor, _unitsCivfor, _unitsDead,
_objects, _objectsVehicles, _viewDistancePlayer, _viewDistanceServer
], 10, ace_player, 12] call ace_common_fnc_displayTextStructured;