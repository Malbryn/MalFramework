#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Adds an EH to the playerlist listbox control.

    Arguments:
        -

    Example:
        call MF_admin_fnc_addPlayerInfoEH

    Returns:
        void
*/

if !(hasInterface) exitWith {};

// Exit if the dialog is not visible
if (isNull findDisplay 799) exitWith {};

((findDisplay 799) displayCtrl 718) ctrlAddEventHandler ["LBSelChanged", {
    _text = "";

    // Get the currently selected player
    private _player = lbText [718, lbCurSel 718];

    if (_player != "") then {
        private _unit = objectFromNetId (lbData [718, lbCurSel 718]);

        // Get side
        private _unitSide = _unit call BFUNC(objectSide);
        private _sideColour = [1, 1, 1, 1];

        switch (_unitSide) do {
            case west: {_sideColour = [0, 0.3, 0.6, 1]};
            case east: {_sideColour = [0.9, 0, 0, 1]};
            case independent: {_sideColour = [0, 0.5, 0, 1]};
            case civilian: {_sideColour = [0.5, 0, 0.5, 1]};
            default {_sideColour = [0.7, 0.6, 0, 1]};
        };

        // Get group name
        private _groupName = groupId (group _unit);

        // Get unit description
        private _unitDesc = [_unit] call EFUNC(common,getUnitDescription);

        // Get unit's status
        private _unitStatus = ["Dead", "Alive"] select alive _unit;

        ctrlSetText [721, format ["[%1] %2\n%3", _unitStatus, _groupName, _unitDesc]];
        ((findDisplay 799) displayCtrl 721) ctrlSetTextColor _sideColour;
    };
}];
