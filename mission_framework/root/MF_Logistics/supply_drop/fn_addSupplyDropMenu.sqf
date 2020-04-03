/*
 * Author:
 * Malbryn
 *
 * Description:
 * Creates ACE self-interaction menu for the the CO to be able to call in supply drops
 *
 * Arguments:
 * -
 *
 * Return Value:
 * void
 *
 * Example:
 * [] call MF_fnc_addSupplyDropMenu
 *
 */

missionNamespace setVariable ["MF_drop_available", true];

if (hasInterface && (player getVariable "MF_var_is_CO")) then {
    // Supply drop category
    private _switch = ['Supply drop', 'Supply drop', '\a3\ui_f\data\Map\VehicleIcons\iconParachute_ca.paa', {}, {true}] call ace_interact_menu_fnc_createAction;

    [player, 1, ["ACE_SelfActions"], _switch] call ace_interact_menu_fnc_addActionToObject;


    private _crate = [];
    private _crateName = "";

    {
        // Create a supply drop sub-menu under the Supply drop main category
        _crate = _x select 0;
        _crateName = _x select 1;

        if (_crate getVariable ["MF_sd_available", true]) then {

            private _menu = [_crateName, _crateName, '', {}, {true}] call ace_interact_menu_fnc_createAction;

            [player, 1, ["ACE_SelfActions", "Supply drop"], _menu] call ace_interact_menu_fnc_addActionToObject;


            // Direction control
            _menu = ['Ingress: North', 'Ingress: North', '', {
                // Check if there's an ongoing supply drop already
                if !(missionNamespace getVariable ["MF_drop_available", false]) exitWith {
                    ["Warning", ["Supply drop is on cooldown. Try again in a few minutes."]] call BIS_fnc_showNotification;
                };

                [(_this select 2) select 0, "north", 500, getPos player] remoteExec ["MF_fnc_callSupplyDrop", 2, false];
                systemChat "CROSSROADS: Supply drop is on the way. ETA 1 minute, out.";

                [player, 1, ["ACE_SelfActions", "Supply drop", (_this select 2) select 1]] call ace_interact_menu_fnc_removeActionFromObject;
            }, {true}, {}, _x] call ace_interact_menu_fnc_createAction;

            [player, 1, ["ACE_SelfActions", "Supply drop", _crateName], _menu] call ace_interact_menu_fnc_addActionToObject;


            _menu = ['Ingress: East', 'Ingress: East', '', {
                // Check if there's an ongoing supply drop already
                if !(missionNamespace getVariable ["MF_drop_available", false]) exitWith {
                    ["Warning", ["Supply drop is on cooldown. Try again in a few minutes."]] call BIS_fnc_showNotification;
                };

                [(_this select 2) select 0, "east", 500, getPos player] remoteExec ["MF_fnc_callSupplyDrop", 2, false];
                systemChat "CROSSROADS: Supply drop is on the way. ETA 1 minute, out.";

                [player, 1, ["ACE_SelfActions", "Supply drop", (_this select 2) select 1]] call ace_interact_menu_fnc_removeActionFromObject;
            }, {true}, {}, _x] call ace_interact_menu_fnc_createAction;

            [player, 1, ["ACE_SelfActions", "Supply drop", _crateName], _menu] call ace_interact_menu_fnc_addActionToObject;


            _menu = ['Ingress: South', 'Ingress: South', '', {
                // Check if there's an ongoing supply drop already
                if !(missionNamespace getVariable ["MF_drop_available", false]) exitWith {
                    ["Warning", ["Supply drop is on cooldown. Try again in a few minutes."]] call BIS_fnc_showNotification;
                };

                [(_this select 2) select 0, "south", 500, getPos player] remoteExec ["MF_fnc_callSupplyDrop", 2, false];
                systemChat "CROSSROADS: Supply drop is on the way. ETA 1 minute, out.";

                [player, 1, ["ACE_SelfActions", "Supply drop", (_this select 2) select 1]] call ace_interact_menu_fnc_removeActionFromObject;
            }, {true}, {}, _x] call ace_interact_menu_fnc_createAction;

            [player, 1, ["ACE_SelfActions", "Supply drop", _crateName], _menu] call ace_interact_menu_fnc_addActionToObject;


            _menu = ['Ingress: West', 'Ingress: West', '', {
                // Check if there's an ongoing supply drop already
                if !(missionNamespace getVariable ["MF_drop_available", false]) exitWith {
                    ["Warning", ["Supply drop is on cooldown. Try again in a few minutes."]] call BIS_fnc_showNotification;
                };

                [(_this select 2) select 0, "west", 500, getPos player] remoteExec ["MF_fnc_callSupplyDrop", 2, false];
                systemChat "CROSSROADS: Supply drop is on the way. ETA 1 minute, out.";

                [player, 1, ["ACE_SelfActions", "Supply drop", (_this select 2) select 1]] call ace_interact_menu_fnc_removeActionFromObject;
            }, {true}, {}, _x] call ace_interact_menu_fnc_createAction;

            [player, 1, ["ACE_SelfActions", "Supply drop", _crateName], _menu] call ace_interact_menu_fnc_addActionToObject;
        };
    } forEach MF_var_supply_drop_crates;
};
