#include "script_component.hpp"

if (isServer) then {
    // Terminate the end condition checking loop if there's no condition defined
    if !(GVARMAIN(moduleTimeLimit) || GVARMAIN(modulePlayerCasualties) || GVARMAIN(moduleTaskLimit) ||
    GVARMAIN(moduleExtraction) || GVARMAIN(moduleCivilianCasualties)) exitWith {};

    [QGVARMAIN(initFramework), {
        call FUNC(registerCivilians);

        // Check the tasks array
        if ((GVARMAIN(moduleTaskLimit) && (count GVAR(tasks) == 0)) ||
        (GVARMAIN(moduleExtraction) && (count GVAR(tasks) == 0))) then {
            [QGVARMAIN(systemMessage), ["WARNING", "(End conditions) The task array is empty. Add the tasks to the tasks array."]] call CFUNC(globalEvent);
            GVARMAIN(moduleTaskLimit) = false;
            GVARMAIN(moduleExtraction) = false;
        };

        // Add per frame handler
        // Adding some delay so the side values are set properly
        [{
            if (GVARMAIN(isTvT)) then {
                GVAR(endConditionCheck) = [{
                    call FUNC(checkEndConditionsTvT);
                }, 3] call CFUNC(addPerFrameHandler);
            } else {
                GVAR(endConditionCheck) = [{
                    call FUNC(checkEndConditionsCoop);
                }, 10] call CFUNC(addPerFrameHandler);
            };
        }, [], 5] call CFUNC(waitAndExecute);
    }] call CFUNC(addEventHandler);
};
