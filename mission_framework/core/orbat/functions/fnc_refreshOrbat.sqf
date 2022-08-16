#include "script_component.hpp"

/*
    Author:
        Malbryn, johnb43

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

// Make sure old OBRAT has been removed before
[{
    !(player diarySubjectExists "GearIndex");
}, {
    // Make a new entry
    call FUNC(initOrbat);

    // Wait until new entry exists, then select it
    [{
        player diarySubjectExists "GearIndex";
    }, {
        player selectDiarySubject "GearIndex";

        // Add the EH to detect the ORBAT being clicked
        call FUNC(addSelectionDetection);
    }] call CFUNC(waitUntilAndExecute);
}] call CFUNC(waitUntilAndExecute);
