#include "script_component.hpp"

/*
    Author:
        Malbryn, johnb43

    Description:
        Removes the unit's radios (TFAR and ACRE).

    Arguments:
        1: OBJECT - The unit

    Example:
        [player] call MF_common_fnc_removeRadios

    Returns:
        void
*/

params [["_unit", objNull]];

// TFAR
if (GVARMAIN(moduleTFAR)) then {
    (_unit call TFUNC(getRadioItems)) apply {
        _unit removeItems _x;
        _unit unlinkItem _x;
    };
};

// ACRE
if ("ItemRadio" in (assignedItems _unit)) then {
    _unit unlinkItem "ItemRadio";

    if (GVARMAIN(moduleACRE)) then {
        _unit linkItem "ItemRadioAcreFlagged";
    };
};
