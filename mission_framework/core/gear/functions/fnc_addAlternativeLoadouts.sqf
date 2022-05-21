#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Adds the option to change the loadout and take an the alternative one.

    Arguments:
        0: OBJECT - The object that provides this option

    Example:
        [this] call MF_gear_fnc_addAlternativeLoadouts

    Returns:
        void
*/

if !(hasInterface) exitWith {};

params [
    ["_obj", objNull, [objNull]]
];

if (isNull _obj) exitWith {
    [
        COMPONENT_STR,
        "ERROR",
        "Cannot add alternative loadouts because the target object doesn't exist",
        true,
        1
    ] call EFUNC(main,log);
};

[QGVARMAIN(initFramework), {
    _thisArgs params ["_obj"];
    
    private _loadouts = GVAR(loadoutHashParsed);
    private _available = [GETVAR(player,GVAR(currentRole),"")];

    _available append (_loadouts get _available#0);

    // Add parent menu
    private _parentMenu = ['Loadout', 'Loadout', '', {}, {}] call AFUNC(interact_menu,createAction);
    [_obj, 0, ["ACE_MainActions"], _parentMenu] call AFUNC(interact_menu,addActionToObject);

    // Add child menus
    private _childMenu;

    {
        // Add the default loadout (the key)
        _childMenu = [_x, _x, '', {
            [player, _this#2#0] call FUNC(setGear);
        }, {_this#2#0 in _this#2#1}, {}, [_x, _available]] call AFUNC(interact_menu,createAction);

        [_obj, 0, ["ACE_MainActions", "Loadout"], _childMenu] call AFUNC(interact_menu,addActionToObject);

        // Add the alternative ones (the values array)
        {
            _childMenu = [_x, _x, '', {
                [player, _this#2#0] call FUNC(setGear);
            }, {_this#2#0 in _this#2#1}, {}, [_x, _available]] call AFUNC(interact_menu,createAction);

            [_obj, 0, ["ACE_MainActions", "Loadout"], _childMenu] call AFUNC(interact_menu,addActionToObject);
        } forEach _y;
    } forEach _loadouts;
}, [_obj]] call CFUNC(addEventHandlerArgs);
