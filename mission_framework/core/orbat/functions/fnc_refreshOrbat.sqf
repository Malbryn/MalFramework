#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Refreshes the ORBAT diary record.

    Arguments:
        -

    Example:
        call MF_orbat_fnc_refreshOrbat

    Returns:
        void
*/

if !(hasInterface) exitWith {};

player removeDiarySubject "GearIndex";
[] spawn FUNC(initOrbat);
