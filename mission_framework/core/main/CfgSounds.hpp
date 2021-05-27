#include "script_component.hpp"

class CfgSounds {
    sounds[] = {};

    class GVARMAIN(DetectorBeep) {
        name = "detector_beep";
        sound[] = { "\mission_framework\core\cbrn\sound\detector_beep.ogg", 2, 1, 5 };
        titles[] = { 1, "" };
    };

    class GVARMAIN(BreathIn1) {
        name = "breath_in_1";
        sound[] = { "\mission_framework\core\cbrn\sound\breath_in_1.ogg", 5, 1, 5 };
        titles[] = { 1, "" };
    };

    class GVARMAIN(BreathIn2) {
        name = "breath_in_2";
        sound[] = { "\mission_framework\core\cbrn\sound\breath_in_2.ogg", 5, 1, 5 };
        titles[] = { 1, "" };
    };

    class GVARMAIN(BreathIn3) {
        name = "breath_in_3";
        sound[] = { "\mission_framework\core\cbrn\sound\breath_in_3.ogg", 5, 1, 5 };
        titles[] = { 1, "" };
    };

    class GVARMAIN(BreathIn4) {
        name = "breath_in_4";
        sound[] = { "\mission_framework\core\cbrn\sound\breath_in_4.ogg", 5, 1, 5 };
        titles[] = { 1, "" };
    };
    
    class GVARMAIN(BreathOut1) {
        name = "breath_out_1";
        sound[] = { "\mission_framework\core\cbrn\sound\breath_out_1.ogg", 10, 1, 5 };
        titles[] = { 1, "" };
    };

    class GVARMAIN(BreathOut2) {
        name = "breath_out_2";
        sound[] = { "\mission_framework\core\cbrn\sound\breath_out_2.ogg", 10, 1, 5 };
        titles[] = { 1, "" };
    };

    class GVARMAIN(BreathOut3) {
        name = "breath_out_3";
        sound[] = { "\mission_framework\core\cbrn\sound\breath_out_3.ogg", 10, 1, 5 };
        titles[] = { 1, "" };
    };

    class GVARMAIN(BreathOut4) {
        name = "breath_out_4";
        sound[] = { "\mission_framework\core\cbrn\sound\breath_out_4.ogg", 10, 1, 5 };
        titles[] = { 1, "" };
    };

};
