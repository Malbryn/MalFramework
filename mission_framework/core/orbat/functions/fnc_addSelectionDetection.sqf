#include "script_component.hpp"

/*
    Author:
        johnb43

    Description:
        Adds an eventhandler that detects when the ORBAT tab was selected.

    Arguments:
        -

    Example:
        call MF_orbat_fnc_addSelectionDetection

    Returns:
        void
*/

((uiNamespace getVariable "RscDiary") displayCtrl 1001) ctrlAddEventHandler ["LBSelChanged", {
    params ["_control", "_selectedIndex"];

    if ((_control lnbText [_selectedIndex, 0]) isEqualTo "ORBAT") then {
        // Remove EH to avoid ending in an infinite loop
        _control ctrlRemoveEventHandler [_thisEvent, _thisEventHandler];

        call FUNC(refreshOrbat);
    };
}];
