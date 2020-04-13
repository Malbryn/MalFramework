/*
 * Author:
 * Malbryn
 *
 * Description:
 * Creates ACE self-interaction menu for the Grass cutter script
 *
 * Arguments:
 * -
 *
 * Return Value:
 * void
 *
 * Example:
 * [] execVM "mission_framework\root\MF_Player\grass_cutter\addCutterOption.sqf"
 *
 */

if (hasInterface) then {  
    private _menu = ['Cut grass', 'Cut grass', '', {
        [] spawn MF_fnc_cutGrass;
    }, {!visibleMap}] call ace_interact_menu_fnc_createAction;

    [player, 1, ["ACE_SelfActions", "ACE_Equipment"], _menu] call ace_interact_menu_fnc_addActionToObject;
};