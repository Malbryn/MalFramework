/*
 * Author:
 * Malbryn
 *
 * Description:
 * Prints out the mission intro text
 *
 * Arguments:
 * -
 *
 * Return Value:
 * void
 *
 * Example:
 * [] execVM "mission_framework\root\MF_Misc\intro_text\runIntro.sqf"
 *
 */

if (hasInterface) then {
    if (didJIP) then {
        [{
            if (MF_var_jip_is_available) then {
                ["JipTeleport"] call BIS_fnc_showNotification;
            } else {
                ["Warning", ["JIP teleport is not available in this mission!"]] call BIS_fnc_showNotification;
            };
        }, [], MF_var_title_delay] call CBA_fnc_waitAndExecute;
    };

    private _intro =
    [
        [MF_var_title, "size='1.5' font='PuristaBold'"],
        ["", "<br/>"],

        [MF_var_date, "size='1.2' font='PuristaMedium'"],
        ["", "<br/>"],

        [MF_var_location, "size='1.2' font='PuristaMedium'"],
        ["", "<br/>"],

        [rank player, "size='1.0' font='PuristaSemiBold'"],
        [" ", "size='1.0' font='PuristaBold'"],
        [toUpper (name player), "size='1.0' font='PuristaSemiBold'"],
        ["", "<br/>"]
    ];

    private _output = [_intro, safezoneX - 0.01, safeZoneY + (1 - 0.125) * safeZoneH, true, "<t align='right' size='1,1' >%1</t>"] spawn BIS_fnc_typeText2;
};