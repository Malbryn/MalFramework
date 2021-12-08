#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Adds the detector controls to the player.

    Arguments:
        -

    Example:
        call MF_cbrn_fnc_addDetectorControls

    Returns:
        void
*/

if !(hasInterface) exitWith {};

// Device parent
private _muteMenuParent = ['Chemical detector', 'Chemical detector', '\a3\ui_f\data\IGUI\Cfg\Actions\RadarOn_ca.paa', {
}, {!visibleMap && "ChemicalDetector_01_watch_F" in (assignedItems player)}] call AFUNC(interact_menu,createAction);

[player, 1, ["ACE_SelfActions", "ACE_Equipment"], _muteMenuParent] call AFUNC(interact_menu,addActionToObject);

// Mute device
private _muteMenu = ['Mute detector', 'Mute detector', '', {
    GVAR(isMuted) = true;
}, {!GVAR(isMuted)}] call AFUNC(interact_menu,createAction);

// Unmute device
private _unmuteMenu = ['Unmute detector', 'Unmute detector', '', {
    GVAR(isMuted) = false;
}, {GVAR(isMuted)}] call AFUNC(interact_menu,createAction);

[player, 1, ["ACE_SelfActions", "ACE_Equipment", "Chemical detector"], _muteMenu] call AFUNC(interact_menu,addActionToObject);
[player, 1, ["ACE_SelfActions", "ACE_Equipment", "Chemical detector"], _unmuteMenu] call AFUNC(interact_menu,addActionToObject);

// Sound alert threshold parent
private _alertMenuParent = ['Set sound alert threshold', 'Set sound alert threshold', '', {
}, {}] call AFUNC(interact_menu,createAction);

[player, 1, ["ACE_SelfActions", "ACE_Equipment", "Chemical detector"], _alertMenuParent] call AFUNC(interact_menu,addActionToObject);

// Low
private _alertMenuLow = ['Low', 'Low', '', {
    GVAR(alertThreshold) = 0;
}, {true}] call AFUNC(interact_menu,createAction);

// Medium
private _alertMenuMedium = ['Medium', 'Medium', '', {
    GVAR(alertThreshold) = 3.33;
}, {true}] call AFUNC(interact_menu,createAction);

// High
private _alertMenuHigh = ['High', 'High', '', {
    GVAR(alertThreshold) = 6.66;
}, {true}] call AFUNC(interact_menu,createAction);

[player, 1, ["ACE_SelfActions", "ACE_Equipment", "Chemical detector", "Set sound alert threshold"], _alertMenuLow] call AFUNC(interact_menu,addActionToObject);
[player, 1, ["ACE_SelfActions", "ACE_Equipment", "Chemical detector", "Set sound alert threshold"], _alertMenuMedium] call AFUNC(interact_menu,addActionToObject);
[player, 1, ["ACE_SelfActions", "ACE_Equipment", "Chemical detector", "Set sound alert threshold"], _alertMenuHigh] call AFUNC(interact_menu,addActionToObject);
