#include "script_component.hpp"

// Enable Global chat during TvTs
if (GVARMAIN(isTvT)) then {
    0 enableChannel [true, true];
};

// Credits section in Diary
call FUNC(addCredits);
