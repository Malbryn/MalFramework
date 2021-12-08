#include "script_component.hpp"

class CfgSounds {
    sounds[] = {};

    class GVARMAIN(DetectorBeep) {
        name = "detector_beep";
        sound[] = { "\mission_framework\core\cbrn\sound\detector_beep.ogg", 1, 1, 5 };
        titles[] = { 1, "" };
    };

    class GVARMAIN(BreathIn1) {
        name = "breath_in_1";
        sound[] = { "\mission_framework\core\cbrn\sound\breath_in_1.ogg", 2, 1, 5 };
        titles[] = { 1, "" };
    };

    class GVARMAIN(BreathIn2) {
        name = "breath_in_2";
        sound[] = { "\mission_framework\core\cbrn\sound\breath_in_2.ogg", 2, 1, 5 };
        titles[] = { 1, "" };
    };

    class GVARMAIN(BreathIn3) {
        name = "breath_in_3";
        sound[] = { "\mission_framework\core\cbrn\sound\breath_in_3.ogg", 2, 1, 5 };
        titles[] = { 1, "" };
    };
    
    class GVARMAIN(BreathOut1) {
        name = "breath_out_1";
        sound[] = { "\mission_framework\core\cbrn\sound\breath_out_1.ogg", 6, 1, 5 };
        titles[] = { 1, "" };
    };

    class GVARMAIN(BreathOut2) {
        name = "breath_out_2";
        sound[] = { "\mission_framework\core\cbrn\sound\breath_out_2.ogg", 6, 1, 5 };
        titles[] = { 1, "" };
    };

    class GVARMAIN(BreathOut3) {
        name = "breath_out_3";
        sound[] = { "\mission_framework\core\cbrn\sound\breath_out_3.ogg", 6, 1, 5 };
        titles[] = { 1, "" };
    };
};
