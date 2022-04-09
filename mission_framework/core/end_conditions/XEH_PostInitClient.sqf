#include "script_component.hpp"

// Add time limit check menu
if (GVARMAIN(moduleTimeLimit) && GVAR(timeLimitCheckEnabled)) then {
    call FUNC(addTimeLimitCheckMenu);
};
