if (hasInterface) then {
	private _viewDistance = player getVariable ["MF_var_vd", -1];

	if (_viewDistance == -1) then {
		// Default view distance in config.sqf
		_viewDistance = MF_var_view_distance_player;
		setViewDistance _viewDistance;
	} else {
		// Custom view distance defined in unit init
		setViewDistance _viewDistance;
	};
};

if (isDedicated) then {
	setViewDistance MF_var_view_distance_server;
};