#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Creates a ACE self-interaction menu for the the CO to be able to call in supply drops.

    Arguments:
        -

    Example:
        call MF_supply_drop_fnc_addSupplyDropMenu

    Returns:
        void
*/

if !(hasInterface) exitWith {};

SETPMVAR(GVAR(dropAvailable),true);

if (count GVAR(supplyCrates) == 0) exitWith {
    [COMPONENT_STR, "ERROR", "No supply drop crate is defined in the config", true] call EFUNC(main,log);
};

if (GETVAR(player,EGVAR(player,isCO),false)) then {
    // Supply drop category
    private _menu = ['Supply drop', 'Supply drop', '\a3\ui_f\data\Map\VehicleIcons\iconParachute_ca.paa', {}, {!visibleMap && isNull objectParent player}] call AFUNC(interact_menu,createAction);
    
    [player, 1, ["ACE_SelfActions"], _menu] call AFUNC(interact_menu,addActionToObject);

    private _crate = [];
    private _crateName = "";

    GVAR(supplyCrates) apply {
        // Create a supply drop sub-menu under the Supply drop main category
        _crate = _x#0;
        _crateName = _x#1;

        if (GETVAR(_crate,GVAR(crateAvailable),true)) then {

            _menu = [_crateName, _crateName, '', {}, {true}] call AFUNC(interact_menu,createAction);
            
            [player, 1, ["ACE_SelfActions", "Supply drop"], _menu] call AFUNC(interact_menu,addActionToObject);

            // Direction control
            _menu = ['Ingress: North', 'Ingress: North', '', {
                // Check if there's an ongoing supply drop already
                if !(GETMVAR(GVAR(dropAvailable),false)) exitWith {
                    ["Warning", ["Supply drop is on cooldown. Try again in a few minutes."]] call BFUNC(showNotification);
                };

                [QGVAR(supplyDrop), [(_this#2)#0, "north", 500, getPos player]] call CFUNC(serverEvent);
                systemChat "CROSSROADS: Supply drop is on the way. ETA 1 minute, out.";

                [player, 1, ["ACE_SelfActions", "Supply drop", (_this#2)#1]] call AFUNC(interact_menu,removeActionFromObject);
            }, {true}, {}, _x] call AFUNC(interact_menu,createAction);

            [player, 1, ["ACE_SelfActions", "Supply drop", _crateName], _menu] call AFUNC(interact_menu,addActionToObject);


            _menu = ['Ingress: East', 'Ingress: East', '', {
                // Check if there's an ongoing supply drop already
                if !(GETMVAR(GVAR(dropAvailable),false)) exitWith {
                    ["Warning", ["Supply drop is on cooldown. Try again in a few minutes."]] call BFUNC(showNotification);
                };

                [QGVAR(supplyDrop), [(_this#2)#0, "east", 500, getPos player]] call CFUNC(serverEvent);
                systemChat "CROSSROADS: Supply drop is on the way. ETA 1 minute, out.";

                [player, 1, ["ACE_SelfActions", "Supply drop", (_this#2)#1]] call AFUNC(interact_menu,removeActionFromObject);
            }, {true}, {}, _x] call AFUNC(interact_menu,createAction);

            [player, 1, ["ACE_SelfActions", "Supply drop", _crateName], _menu] call AFUNC(interact_menu,addActionToObject);


            _menu = ['Ingress: South', 'Ingress: South', '', {
                // Check if there's an ongoing supply drop already
                if !(GETMVAR(GVAR(dropAvailable),false)) exitWith {
                    ["Warning", ["Supply drop is on cooldown. Try again in a few minutes."]] call BFUNC(showNotification);
                };

                [QGVAR(supplyDrop), [(_this#2)#0, "south", 500, getPos player]] call CFUNC(serverEvent);
                systemChat "CROSSROADS: Supply drop is on the way. ETA 1 minute, out.";

                [player, 1, ["ACE_SelfActions", "Supply drop", (_this#2)#1]] call AFUNC(interact_menu,removeActionFromObject);
            }, {true}, {}, _x] call AFUNC(interact_menu,createAction);

            [player, 1, ["ACE_SelfActions", "Supply drop", _crateName], _menu] call AFUNC(interact_menu,addActionToObject);


            _menu = ['Ingress: West', 'Ingress: West', '', {
                // Check if there's an ongoing supply drop already
                if !(GETMVAR(GVAR(dropAvailable),false)) exitWith {
                    ["Warning", ["Supply drop is on cooldown. Try again in a few minutes."]] call BFUNC(showNotification);
                };

                [QGVAR(supplyDrop), [(_this#2)#0, "west", 500, getPos player]] call CFUNC(serverEvent);
                systemChat "CROSSROADS: Supply drop is on the way. ETA 1 minute, out.";

                [player, 1, ["ACE_SelfActions", "Supply drop", (_this#2)#1]] call AFUNC(interact_menu,removeActionFromObject);
            }, {true}, {}, _x] call AFUNC(interact_menu,createAction);

            [player, 1, ["ACE_SelfActions", "Supply drop", _crateName], _menu] call AFUNC(interact_menu,addActionToObject);
        };
    };
};
