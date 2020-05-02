/*
 * Author:
 * Malbryn
 *
 * Description:
 * Sets the player's team colour
 *
 * Arguments:
 * -
 *
 * Return Value:
 * void
 *
 * Example:
 * [] call MF_fnc_setTeamColour
 *
 */

if (hasInterface) then {
    private _teamColour = player getVariable ["MF_var_tc", "MAIN"];

    if (_teamColour != "MAIN") then {
        player assignTeam _teamColour;
    };
};
