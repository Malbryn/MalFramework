/*
    Intel Creator tool can be found here:
    https://malbryn.github.io/MalFramework/intel_creator.html

    Arguments:
        0: OBJECT - Intel object
        1: SCALAR - ID of the intel

    Examples:
        // In the init field of the object
        [this, 1] call MF_intel_fnc_initIntel

        // In an external script
        [objName, 2] call MF_intel_fnc_initIntel
 */

EGVAR(intel,intelList) = [
// ID: 0
    [
        "Test title 1",  // Title of the intel
        "Test text 1",   // Intel text
        3,               // Pick-up duration
        true,            // Delete the object after it was acquired
        true             // Share the intel globally
    ],

// ID: 1
    [
        "Test title 2",
        "Test text 2",
        10,
        false,
        false
    ]
];
