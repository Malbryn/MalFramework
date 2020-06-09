#include "script_component.hpp"

call FUNC(initCustomEHs);

enableSaving [false, false];
enableEnvironment [false, true];
enableSentences true;

if (isServer) then {
    setTimeMultiplier GVARMAIN(timeAcceleration);
};
