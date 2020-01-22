/*
 * Author:
 * Malbryn
 *
 * Description:
 * Refreshes the ORBAT diary record by removing the diary record and re-running the script
 *
 * Arguments:
 * -
 *
 * Return Value:
 * void
 *
 * Example:
 * [] call MF_fnc_refreshOrbat
 *
 */

if (!hasInterface) exitWith {};

player removeDiarySubject "GearIndex";
[] spawn MF_fnc_setOrbat;
