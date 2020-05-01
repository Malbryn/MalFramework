// Import admin scripts
#include "mission_framework\root\MF_Admin\fncInit.sqf"
#include "mission_framework\root\MF_Admin\init.sqf"
#include "mission_framework\root\MF_Admin\admin_menu\registerAdminCommand.sqf"

// Import the mission framework settings
#include "mission_framework\config\config.sqf"

enableSaving [false, false];
enableEnvironment [false, true];
enableSentences true;

[] call MF_fnc_setTeamColour;
[] call MF_fnc_setViewDistance;
[] call MF_fnc_setRespawnTickets;
[] spawn MF_fnc_setChannels;

// Changing the respawn timer if the wave respawn module is active
[{CBA_missionTime > 1}, {
    if (MF_var_wave_respawn_enabled) then {
        setPlayerRespawnTime 999999;
    };
}] call CBA_fnc_WaitUntilAndExecute;
