#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Creates an ACE self-interaction menu to control the snowfall script.

    Arguments:
        -

    Example:
        call MF_snowfall_fnc_addSnowMenu

    Returns:
        void
*/

if !(hasInterface) exitWith {};

// Snow script category
private _menu = ['Snow Script', 'Snow Script', '\a3\ui_f\data\IGUI\Cfg\Cursors\unitHealer_ca.paa', {}, {!visibleMap}] call AFUNC(interact_menu,createAction);

[player, 1, ["ACE_SelfActions"], _menu] call AFUNC(interact_menu,addActionToObject);

// Turn snow script on
_menu = ['Snow Script - On', 'Snow Script - On', '', {
    call FUNC(startSnowfall);
    GVAR(enabled) = true;
    [COMPONENT_STR, "INFO", "Snow script is ON", true] call EFUNC(main,log);
}, {true}] call AFUNC(interact_menu,createAction);

[player, 1, ["ACE_SelfActions", "Snow Script"], _menu] call AFUNC(interact_menu,addActionToObject);

// Turn snow script off
_menu = ['Snow Script - Off', 'Snow Script - Off', '', {
    [GVAR(snowfallPFH)] call CFUNC(removePerFrameHandler);
    GVAR(enabled) = false;
    [COMPONENT_STR, "INFO", "Snow script is OFF", true] call EFUNC(main,log);
}, {true}] call AFUNC(interact_menu,createAction);

[player, 1, ["ACE_SelfActions", "Snow Script"], _menu] call AFUNC(interact_menu,addActionToObject);
