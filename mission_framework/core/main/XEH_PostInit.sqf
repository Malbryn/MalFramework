#include "script_component.hpp"

call FUNC(initCustomEHs);

enableSaving [false, false];
enableEnvironment [false, true];
enableSentences true;

if (GVARMAIN(isTvT)) then {
    0 enableChannel [true, false];
};

if (isServer) then {
    setTimeMultiplier GVARMAIN(timeAcceleration);
};
