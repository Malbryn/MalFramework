#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Adds maintenance (rearm, refual, repair) options to an object.
        It has local effect.

    Arguments:
        0: OBJECT - The object
        1: SCALAR - Mode (0: all, 1: rearm, 2: refuel, 3: repair, 4: rearm+refuel, 5: rearm+repair, 6: refuel+repair)
        2: SCALAR - Max. number of rearms available (Optional, default: -1 (= unlimited))
        3: BOOLEAN - Allow the change of pylons (Optional, default: true)
        4: SCALAR - Rearm detection range (Optional, default: 20)

    Example:
        [this, 1, 3, false, 30] call MF_logistics_fnc_addMaintenanceOptions

    Returns:
        void
*/

params ["_object", "_mode", ["_rearmCount", -1], ["_allowPylons", true], ["_range", 20]];

// Set variables (using object-specific variables instead of global ones)
SETVAR(_object,GVAR(rearmRange),_range);
SETPVAR(_object,GVAR(rearmCount),_rearmCount);

if !(alive _object) exitWith {};

// Rearm
if (_mode in [0, 1, 4, 5]) then {
    SETVAR(_object,ace_rearm_isSupplyVehicle,true);

    // Main actions
    // Rearm
    private _menu = ['Rearm', 'Rearm', '\z\ACE\addons\rearm\ui\icon_rearm_interact.paa', {}, {true}, {
        _this call FUNC(addRearmActions);
    }] call AFUNC(interact_menu,createAction);

    [_object, 0, ["ACE_MainActions"], _menu] call AFUNC(interact_menu,addActionToObject);

    // Check available supplies
    _menu = ['Check rearm points', 'Check rearm points', '\z\ACE\addons\rearm\ui\icon_rearm_interact.paa', {
        private _rearmCount = GETVAR(_this#0,GVAR(rearmCount),0);

        if (_rearmCount == -1) then {
            ["Unlimited rearm points", 2, ace_player, 12] call AFUNC(common,displayTextStructured);
        } else {
            [["Remaining rearm points: %1", _rearmCount], 2, ace_player, 12] call AFUNC(common,displayTextStructured);
        }
    }, {true}] call AFUNC(interact_menu,createAction);

    [_object, 0, ["ACE_MainActions"], _menu] call AFUNC(interact_menu,addActionToObject);
};

// Refuel
if (_mode in [0, 2, 4, 6]) then {
    [_object, 10e5] call AFUNC(refuel,makeSource);
};

// Repair
if (_mode in [0, 3, 5, 6]) then {
    SETVAR(_object,ACE_isRepairFacility,1);
};

// Pylons
if (_allowPylons) then {
    SETVAR(_object,GVAR(allowPylons),true);
};
