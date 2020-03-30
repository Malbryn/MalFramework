/*
 * Author:
 * Malbryn
 *
 * Description:
 * Sets up the player's radios
 *
 * Arguments:
 * -
 *
 * Return Value:
 * void
 *
 * Example:
 * [] execVM "mission_framework\root\MF_Player\tfar_setup\init.sqf"
 *
 */

if (hasInterface) then {
	[{[] call TFAR_fnc_haveSWRadio}, {
		private _channels = player getVariable ["MF_radio_channels", []];
		private _srCh = _channels select 0;
		private _lrCh = _channels select 1;

		if (0 <= _srCh && _srCh <= 8) then {
			[(call TFAR_fnc_activeSwRadio), _srCh] call TFAR_fnc_setSwChannel;
		};

		if (0 <= _srCh && _srCh <= 8) then {
			[(call TFAR_fnc_activeLrRadio), _lrCh] call TFAR_fnc_setLrChannel;
		};
	}] call CBA_fnc_waitUntilAndExecute;
};