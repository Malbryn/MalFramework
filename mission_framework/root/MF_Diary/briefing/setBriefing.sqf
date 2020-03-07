/*
 * Author:
 * Based on Perfks' briefing, edited by Pax'Jarome
 *
 * Description:
 * Displays the briefing for everyone on the map screen
 *
 * Arguments:
 * -
 *
 * Return Value:
 * void
 *
 * Example:
 * [] execVM "mission_framework\root\MF_Diary\briefing\setBriefing.sqf"
 *
 */

if (hasInterface) then {
    #include "briefingMacros.sqf"
    #include "..\..\..\config\briefing\briefing.sqf"

    DISPLAYBRIEFING();
};