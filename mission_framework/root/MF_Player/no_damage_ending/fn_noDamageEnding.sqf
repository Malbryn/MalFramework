MF_eh_fired = player addEventHandler ["Fired", {
	private ["_p"];

	_p = _this select 6;

	deleteVehicle _p;

  if ((_this select 5) call BIS_fnc_isThrowable) then {
    player addMagazine (_this select 5);
	} else {
    player setAmmo [currentWeapon player, (player ammo currentWeapon player) + 1];
	};
}];
