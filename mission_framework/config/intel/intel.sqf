/*
 * Arguments:
 * _this select 0: OBJECT - Intel object
 * _this select 1: SCALAR - ID of the intel
 *
 * Example:
 * [this, 1] execVM "mission_framework\root\MF_Diary\intel\fn_initIntel.sqf"
 *
 */

MF_var_intel_list = [

// ID: 0
    [
        "Test title 1",       // Title of the intel
        "Test text 1",        // Intel text
        3,                  // Pick-up duration
        true                // Delete object after it was acquired
    ],


// ID: 1
    [
        "Test title 2",
        "Test text 2", 
        10,
        false
    ]

];