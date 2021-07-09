#include "script_component.hpp"

systemChat "--- CLIENT AND SERVER INIT ---";

if (isServer) then {
    setTimeMultiplier GVARMAIN(timeAcceleration);
};

if (hasInterface) then {
    // Enable Global chat during TvTs
    if (GVARMAIN(isTvT)) then {
        0 enableChannel [true, true];
    };

    // Credits section in Diary
    call FUNC(addCredits);
};

call FUNC(initCustomEHs);

enableSaving [false, false];
enableEnvironment [false, true];
enableSentences true;
