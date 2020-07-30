#include "script_component.hpp"

// Channel labels - DEFAULT
GVAR(channelLabelsDefault) = [
    [1, 69,       "PLT NET 1"],
    [2, 69.1,     "PLT NET 2"],
    [3, 69.2,     "PLT NET 3"],
    [4, 68,         "CAS NET"],
    [5, 67,      "ARMOUR NET"],
    [6, 66,   "ARTILLERY NET"],
    [7, 65,         "AIR NET"],
    [8, 64,      "CONVOY NET"]
];

// Channel labels - BLUFOR
GVAR(channelLabelsBlufor) = [
    [1, 69,       "PLT NET 1"],
    [2, 69.1,     "PLT NET 2"],
    [3, 69.2,     "PLT NET 3"],
    [4, 68,         "CAS NET"],
    [5, 67,      "ARMOUR NET"],
    [6, 66,   "ARTILLERY NET"],
    [7, 65,         "AIR NET"],
    [8, 64,      "CONVOY NET"]
];

// Channel labels - REDFOR
GVAR(channelLabelsRedfor) = [
    [1, 69,       "PLT NET 1"],
    [2, 69.1,     "PLT NET 2"],
    [3, 69.2,     "PLT NET 3"],
    [4, 68,         "CAS NET"],
    [5, 67,      "ARMOUR NET"],
    [6, 66,   "ARTILLERY NET"],
    [7, 65,         "AIR NET"],
    [8, 64,      "CONVOY NET"]
];

// Babel - Blufor language
GVAR(langBlufor) = ["en", "English"];

// Babel - Redfor language
GVAR(langRedfor) = ["ru", "Russian"];

// Babel - Speaking languages
GVAR(bluforSpeaksRedfor) = true;
GVAR(redforSpeaksBlufor) = false;
