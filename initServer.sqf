if (isDedicated) then {
    // Import admin scripts
    #include "mission_framework\root\MF_Admin\fncInit.sqf"
    #include "mission_framework\root\MF_Admin\init.sqf"

    // Import the mission framework settings
    #include "mission_framework\config\config.sqf"

    setTimeMultiplier MF_var_time_acceleration;
    [] call MF_fnc_setViewDistance;
};

// Init end mission statistics
#include "mission_framework\root\MF_Mission\mission_statistics\fncInit.sqf"
#include "mission_framework\root\MF_Mission\mission_statistics\addCivilianKillEH.sqf"
MF_var_stat_ff = ["FRIENDLY FIRE INCIDENTS: "];
MF_var_stat_ck = ["CIVILIAN KILLS: "];

enableSaving [false, false];
enableEnvironment [false, true];
enableSentences true;

// Mission end conditions check loop on server
waitUntil { CBA_missionTime > 1 };

// Check the tasks array
if ((MF_var_end_task_enabled && (count MF_var_tasks == 0)) || (MF_var_end_ex_enabled && (count MF_var_tasks == 0))) then {
    ["[MF WARNING] Task module: The task array is empty. The end conditions will not work properly! Add your tasks to the tasks array."] remoteExec ["systemChat", 0];
    MF_var_end_task_enabled = false;
    MF_var_end_ex_enabled = false;
};

// Register the civilians
if (MF_var_end_civ_cas_enabled) then {
    MF_var_civs = [];

    {
        if ((side _x) == civilian) then {
            MF_var_civs pushBack _x;
        };
    } forEach allUnits;
};

// End mission check loop
MF_EndCheck = [{
    [] call MF_fnc_checkEndConditions;
}, 10] call CBA_fnc_addPerFrameHandler;