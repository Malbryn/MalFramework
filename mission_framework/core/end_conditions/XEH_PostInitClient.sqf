#include "script_component.hpp"

// Add time limit check menu
if (GVAR(timeLimitCheckEnabled)) then {
    call FUNC(addTimeLimitCheckMenu);
};
