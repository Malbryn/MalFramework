#include "..\core\main\script_macros.hpp"  // DO NOT REMOVE

/* -------------------------------- MISSION PARAMETERS -------------------------------- */

// Debug mode
GVARMAIN(debugMode) = true;  // Debug mode for mission/framework development (turn it off before deploying the mission)

// Mission type
GVARMAIN(isTvT) = false;  // If the mission is a TvT mission

// End condition - Time limit
GVARMAIN(moduleTimeLimit) = false;  // Coop & TvT
EGVAR(end_conditions,timeLimit) = 60 MINUTES;  // Mission time limit in seconds
EGVAR(end_conditions,favouredSide) = 1;  // TvT: Favoured side (0: None, 1: BLUFOR, 2: REDFOR, 3: Side with more players)
EGVAR(end_conditions,notificationTime) = 10 MINUTES;  // Send a notification to each player X seconds before the time limit (-1: disabled)
EGVAR(end_conditions,timeLimitCheckEnabled) = true;  // Enable time limit check for players
EGVAR(end_conditions,stagingEnabled) = false;  // Coop: Don't start the mission timer until the players leave the staging area
EGVAR(end_conditions,stagingAreaMarker) = "mrk_staging";  // Coop: Marker for the staging area

// End condition - Player casualty limit
GVARMAIN(modulePlayerCasualties) = false;  // Coop & TvT
EGVAR(end_conditions,playerCasLimit) = 75;  // Coop: Percentage of the max. allowed player casualty
EGVAR(end_conditions,bluforCasLimit) = 75;  // TvT: Percentage of the max. allowed player casualty for the BLUFOR side
EGVAR(end_conditions,redforCasLimit) = 75;  // TvT: Percentage of the max. allowed player casualty for the REDFOR side

// End condition - Civilian casualty limit
GVARMAIN(moduleCivilianCasualties) = false;  // Coop & TvT
EGVAR(end_conditions,civilianCasLimit) = 50;  // Percentage of the max. allowed civilian casualty

// End condition - Side respawn tickets
GVARMAIN(moduleRespawnTickets) = false;  // TvT
GVARMAIN(respawnTicketsBlufor) = 2;  // Respawn tickets for BLUFOR (-1: disabled)
GVARMAIN(respawnTicketsRedfor) = -1;  // Respawn tickets for REDFOR (-1: disabled)

// End condition - Task limit
GVARMAIN(moduleTaskLimit) = false;  // Coop
EGVAR(end_conditions,taskLimit) = 2;  // Minimum number of completed tasks

// End condition - Extraction
GVARMAIN(moduleExtraction) = false;  // Coop
EGVAR(end_conditions,extMarker) = "mrk_ext";  // Name of the extraction marker
EGVAR(end_conditions,extTask) = "";  // Extraction task that will be automatically completed (empty string disables this functionality)
EGVAR(end_conditions,playerThreshold) = 50;  // Percentage of the alive players that have to be in the extraction zone

// Task threshold (used by Time limit, Extraction and Tactical Withdrawal)
GVARMAIN(taskThreshold) = 66;  // Percentage of the tasks that have to be completed

// Respawn
GVARMAIN(moduleRespawn) = true;  // Coop & TvT
EGVAR(respawn,timer) = 30;  // Respawn timer in seconds
EGVAR(respawn,tickets) = -1;  // Individual respawn tickets (-1: tickets disabled)
EGVAR(respawn,waveRespawn) = AUTO;  // Players will respawn in waves (OFF, AUTO: run automatically, MANUAL: requested by CO)
EGVAR(respawn,availableWaves) = 1;  // Number of available respawn waves (MANUAL respawn waves only)
EGVAR(respawn,removePlayerCorpses) = true;  // Remove the players' corpses upon respawn

// View distances
GVARMAIN(playerViewDistance) = 1500;  // Player view distance
GVARMAIN(serverViewDistance) = 1500;  // Server view distance (= AI view distance)

// Time acceleration
GVARMAIN(timeAcceleration) = 1;  // Value between 0.1 and 120

// ACE spectator
GVARMAIN(useACESpectator) = true;  // Use the ACE spectator camera instead of the vanilla one (for dead players)

// AI skills
EGVAR(ai_skills,skillSet) = [
    0.5,  // General (Higher = Better)
    0.5,  // Commanding (Higher = Better)
    0.5,  // Courage (Higher = Better)
    0.5,  // Aiming Accuracy (Higher = Better)
    0.5,  // Aiming Shake (Higher = Less)
    0.5,  // Aiming Speed (Higher = Faster)
    0.5,  // Reload Speed (Higher = Faster)
    0.5,  // Spotting Distance (Higher = Further)
    0.5   // Spotting Time (Higher = Faster)
];


/* --------------------------------- OPTIONAL MODULES --------------------------------- */

// ACRE
GVARMAIN(moduleACRE) = false;  // Coop & TvT
EGVAR(acre,useBabel) = false;  // TvT


// Admin menu
EGVAR(admin,enableArsenal) = true;  // Coop
EGVAR(admin,enableCurator) = true;  // Coop


// AI Spawner
GVARMAIN(moduleAISpawner) = false;  // Coop & TvT


// Ambient fly-by
GVARMAIN(moduleFlyby) = false;  // Coop


// AO limit
GVARMAIN(moduleAOLimit) = false;  // Coop & TvT
EGVAR(ao_limit,timerLand) = 10;  // Timer for any land based vehicle/unit (-1: disabled)
EGVAR(ao_limit,timerAir) = -1;  // Timer for any air vehicle (-1: disabled)
EGVAR(ao_limit,aoMarkerAll) = "mrk_aoLimitAll";  // AO limit marker for every player
EGVAR(ao_limit,aoMarkerBlufor) = "mrk_aoLimitBlufor";  // AO limit marker for BLUFOR players
EGVAR(ao_limit,aoMarkerRedfor) = "mrk_aoLimitRedfor";  // AO limit marker for REDFOR players


// Briefing
GVARMAIN(moduleBriefing) = false;  // Coop & TvT


// CBRN
GVARMAIN(moduleCBRN) = false;  // Coop & TvT
EGVAR(cbrn,timeLimit) = 30;  // The time limit in seconds after which the player (with insufficient protection) starts taking damage
EGVAR(cbrn,protectiveMasks) = ["G_AirPurifyingRespirator_02_black_F"];  // Masks that provide protection (LVL 1)
EGVAR(cbrn,protectiveUniforms) = ["U_C_CBRN_Suit_01_Blue_F"];  // Uniforms that provide protection (LVL 2)
EGVAR(cbrn,protectiveBackpack) = ["B_CombinationUnitRespirator_01_F"];  // Backpacks (= breathing apparatus) that provide protection (LVL 3)
EGVAR(cbrn,protectiveVehicles) = ["B_APC_Wheeled_01_cannon_F"];  // Vehicles that provide protection (LVL 3)


// Countdown
GVARMAIN(moduleCountdown) = false;  // Coop & TvT


// Custom channel
GVARMAIN(moduleCustomChannel) = false;  // Coop & TvT
EGVAR(custom_channel,channelName) = "JTAC channel";  // Name of the channel
EGVAR(custom_channel,channelColour) = [0.8, 0, 0.5, 1];  // Colour of the channel (RGBA format, default: FK pink)


// Gear
EGVAR(gear,saveGearInArsenal) = false;  // Should the player's gear be saved if an arsenal is available (Coop & TvT)
EGVAR(gear,enableBackpackLock) = false;  // Enable backpack lock (Coop & TvT)
EGVAR(gear,enableAlternativeLoadout) = false;  // Enable alternative loadouts (Coop & TvT)
EGVAR(gear,loadoutHash) = [  // Key-value pairs (STRING - ARRAY OF STRINGS) for the alternative loadouts (Coop & TvT)
    ["SL", ["SL-2", "SL-3"]],
    ["AR", ["AR-2"]]
];


// Grass cutter
GVARMAIN(moduleGrassCutter) = false;  // Coop & TvT


// Hostage
GVARMAIN(moduleHostage) = false;  // Coop & TvT


// IED
GVARMAIN(moduleIED) = false;  // Coop


// Intel
GVARMAIN(moduleIntel) = false;  // Coop


// Intro text
GVARMAIN(moduleIntroText) = false;  // Coop & TvT
EGVAR(intro_text,title) = "TEST TITLE";  // Title
EGVAR(intro_text,date) = "TEST DATE";  // Date
EGVAR(intro_text,location) = "TEST LOCATION";  // Location
EGVAR(intro_text,delay) = 15;  // Delay after loading in


// JIP
GVARMAIN(moduleJIP) = true;  // Coop & TvT
EGVAR(jip,jipTimer) = 3 MINUTES;  // For how long the TP is available after joining the mission


// Killcam
GVARMAIN(moduleKillcam) = false;  // Coop & TvT


// Logistics
GVARMAIN(moduleLogistics) = false;  // Coop & TvT


// LOS Tool
GVARMAIN(moduleLOSTool) = false;  // Coop & TvT


// Map cover
GVARMAIN(moduleMapCover) = false;  // Coop & TvT
EGVAR(map_cover,aoMarker) = "mrk_ao";  // Name of the AO marker
EGVAR(map_cover,colour) = "Color4_FD_F";  // Colour of the covered area


// Marker side
GVARMAIN(moduleMarkerSide) = false;  // TvT
EGVAR(marker_side,markersBlufor) = ["mrk_blufor"];  // BLUFOR markers
EGVAR(marker_side,markersRedfor) = ["mrk_redfor"];  // REDFOR markers


// Mortar fire
GVARMAIN(moduleMortar) = false;  // Coop


// ORBAT
GVARMAIN(moduleOrbat) = false;  // Coop & TvT


// Reinsertion
GVARMAIN(moduleHAB) = false;  // Coop
GVARMAIN(moduleHALO) = false;  // Coop & TvT
GVARMAIN(moduleMRV) = false;  // Coop & TvT
GVARMAIN(moduleRP) = false;  // Coop & TvT
GVARMAIN(moduleTP) = false;  // Coop & TvT
EGVAR(reinsertion,RPPickUp) = false;  // If the player is required to pick up the previous RP
EGVAR(reinsertion,markRP) = true;  // Mark the RP location on map
EGVAR(reinsertion,RPObject) = "Land_TentA_F";  // Object used as the squad rally point
EGVAR(reinsertion,markHAB) = true;  // Mark the HAB location on map
EGVAR(reinsertion,HABObject) = "Land_HBarrierTower_F";  // Object used as the platoon HAB
EGVAR(reinsertion,allowTPFromHAB) = true;  // If TP to squad RP is allowed from the platoon HAB
EGVAR(reinsertion,TPPoles) = ["MF_tpPole_1"];  // Teleport pole object(s)


// Retreat
GVARMAIN(moduleRetreat) = false;  // Coop & TvT


// Safety start
GVARMAIN(moduleSafetyStart) = false;  // Coop & TvT


// Setup timer
GVARMAIN(moduleSetupTimer) = false;  // Coop & TvT
EGVAR(setup_timer,markerBlufor) = "mrk_setupBlufor";  // Setup area for the BLUFOR side
EGVAR(setup_timer,timerBlufor) = 60;  // Setup timer for the BLUFOR side
EGVAR(setup_timer,markerRedfor) = "mrk_setupRedfor";  // Setup area for the REDFOR side
EGVAR(setup_timer,timerRedfor) = 60;  // Setup timer for the REDFOR side


// Snowfall
GVARMAIN(moduleSnowfall) = false;  // Coop & TvT
EGVAR(snowfall,maxDensity) = 50;  // Intensity of the snowfall


// Supply drop
GVARMAIN(moduleSupplyDrop) = false;  // Coop
EGVAR(supply_drop,supplyDropPlane) = "B_T_VTOL_01_vehicle_F";  // Plane or helicopter used for the supply drop
EGVAR(supply_drop,useFlare) = false;  // Use flares to mark the crate instead of smokes (night ops)


// TFAR
GVARMAIN(moduleTFAR) = false;  // Coop & TvT


// Unit tracking
GVARMAIN(moduleUnitTracking) = false;  // Coop
EGVAR(unit_tracking,refreshInterval) = 1;  // Refresh rate in seconds (min. value = 1)


// Vehicle respawn
GVARMAIN(moduleVehicleRespawn) = false;  // Coop & TvT
