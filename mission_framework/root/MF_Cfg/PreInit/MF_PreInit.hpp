class MF_PreInit {
	init = "
	MF_fnc_initPlayer = compile preprocessFileLineNumbers 'mission_framework\root\MF_Player\init_player\fn_initPlayer.sqf';
	MF_fnc_assignCO = compile preprocessFileLineNumbers 'mission_framework\root\MF_Player\init_player\fn_assign.sqf';
	MF_fnc_setGear = compile preprocessFileLineNumbers 'mission_framework\root\MF_Player\gear\fn_setGear.sqf';
	MF_fnc_addRPMenu = compile preprocessFileLineNumbers 'mission_framework\root\MF_Logistics\reinsert\rally_point\fn_addRpMenu.sqf';
	";
};