#include "script_component.hpp"

if (isServer) then {
    call FUNC(eventEntityKilled);
};

call FUNC(initKillTracker);
