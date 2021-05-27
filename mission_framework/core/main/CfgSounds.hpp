#include "script_component.hpp"

class CfgSounds {
    sounds[] = {};

    class GVARMAIN(DetectorBeep) {
        name = "detector_beep";
        sound[] = { "\mission_framework\core\cbrn\sound\detector_beep.ogg", 1, 1, 5 };
        titles[] = { 1, "" };
    };
};
