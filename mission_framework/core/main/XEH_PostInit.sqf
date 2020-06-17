#include "script_component.hpp"

if (isServer) then {
    setTimeMultiplier GVARMAIN(timeAcceleration);
};

call FUNC(initCustomEHs);

enableSaving [false, false];
enableEnvironment [false, true];
enableSentences true;

if (GVARMAIN(isTvT)) then {
    // Enable Global chat during TvTs
    0 enableChannel [true, false];
};
