#include "script_component.hpp"

#include "..\admin\dialog\MF_AdminMenu.hpp"
#include "..\end_mission\dialog\MF_EndScreen.hpp"

class RscTitles {
    class Default {
        idd = -1;
        fadein = 0;
        fadeout = 0;
        duration = 0;
    };

    #include "..\ao_limit\dialog\RscAOLimit.hpp"
    #include "..\countdown\dialog\RscCountdown.hpp"
    #include "..\setup_timer\dialog\RscSetupTimer.hpp"
    #include "..\cbrn\dialog\RscMaskOverlay.hpp"
};
