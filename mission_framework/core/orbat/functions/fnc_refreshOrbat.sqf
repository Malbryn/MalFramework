#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Refresh the ORBAT diary record

    Arguments:
        -

    Example:
        call MF_orbat_fnc_refreshOrbat

    Returns:
        void
*/

player removeDiarySubject "GearIndex";
[] spawn FUNC(setOrbat);
