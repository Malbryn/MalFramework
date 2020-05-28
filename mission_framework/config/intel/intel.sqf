/*
    Arguments:
        0: OBJECT - Intel object
        1: SCALAR - ID of the intel

    Examples:
        [this, 1] call MF_intel_fnc_initIntel
        [objName, 2] call MF_intel_fnc_initIntel
 */

EGVAR(intel,intelList) = [
// ID: 0
    [
        "Test title 1",       // Title of the intel
        "Test text 1",        // Intel text
        3,                    // Pick-up duration
        true                  // Delete the object after it was acquired
    ],

// ID: 1
    [
        "Test title 2",
        "Test text 2",
        10,
        false
    ]
];
