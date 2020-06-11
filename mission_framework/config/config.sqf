#include "..\core\main\script_macros.hpp"  // DO NOT REMOVE

/* -------------------------------- MISSION PARAMETERS -------------------------------- */
/* ------------------------- DON'T REMOVE OR COMMENT OUT THESE ------------------------ */

GVARMAIN(isTvT) = true;

GVARMAIN(moduleTimeLimit) = false;
EGVAR(end_conditions,timeLimit) = 60 MINUTES;

GVARMAIN(moduleFriendlyCasualties) = false;
EGVAR(end_conditions,friendlyCasLimit) = 75;

GVARMAIN(moduleCivilianCasualties) = false;
EGVAR(end_conditions,civilianCasLimit) = 50;

GVARMAIN(moduleTaskLimit) = true;
EGVAR(end_conditions,taskLimit) = 2;

GVARMAIN(moduleExtraction) = false;
EGVAR(end_conditions,extMarker) = "mrk_ext";
EGVAR(end_conditions,playerThreshold) = 50;
EGVAR(end_conditions,taskThreshold) = 66;

GVARMAIN(respawnTimer) = 30;
GVARMAIN(respawnTickets) = 0;

GVARMAIN(removePlayerCorpses) = true;

GVARMAIN(playerViewDistance) = 2000;
GVARMAIN(serverViewDistance) = 2000;

GVARMAIN(timeAcceleration) = 1;

EGVAR(ai_skills,skillSet) = [
    0.5,	// General (Higher = Better)
    0.5,	// Commanding (Higher = Better)
    0.5,	// Courage (Higher = Better)
    0.5,	// Aiming Accuracy (Higher = Better)
    0.5,	// Aiming Shake (Higher = Less)
    0.5,	// Aiming Speed (Higher = Faster)
    0.5,	// Reload Speed (Higher = Faster)
    0.5,	// Spotting Distance (Higher = Further)
    0.5		// Spotting Time (Higher = Faster)
];


/* --------------------------------- OPTIONAL MODULES --------------------------------- */

// Ambient fly-by
GVARMAIN(moduleFlyby) = true;


// Arsenal
GVARMAIN(moduleArsenal) = true;


// Briefing
GVARMAIN(moduleBriefing) = true;


// Cover map
GVARMAIN(moduleCoverMap) = false;
EGVAR(cover_map,aoMarker) = "ao";
EGVAR(cover_map,colour) = "Color4_FD_F";


// Curator
GVARMAIN(moduleCurator) = true;


// Grass cutter
GVARMAIN(moduleGrassCutter) = true;


// IED
GVARMAIN(moduleIED) = true;


// Intel
GVARMAIN(moduleIntel) = true;


// Intro text
GVARMAIN(moduleIntroText) = true;
EGVAR(intro_text,title) = "TEST TITLE";
EGVAR(intro_text,date) = "TEST DATE";
EGVAR(intro_text,location) = "TEST LOCATION";
EGVAR(intro_text,delay) = 20;


// JIP
GVARMAIN(moduleJIP) = true;
EGVAR(jip,JIPTimer) = 3 MINUTES;


// Killcam
GVARMAIN(moduleKillcam) = true;


// Kill tracker
GVARMAIN(moduleKillTracker) = true;


// LOS Tool
GVARMAIN(moduleLOSTool) = true;


// Marker side
GVARMAIN(moduleMarkerSide) = true;
EGVAR(marker_side,markersBlufor) = ["mrk_blufor"];
EGVAR(marker_side,markersRedfor) = ["mrk_redfor"];


// Mortar fire
GVARMAIN(moduleMortar) = true;


// No damage ending
GVARMAIN(moduleDisableDamage) = true;


// ORBAT
GVARMAIN(moduleOrbat) = true;


// Reinsert
GVARMAIN(moduleHALO) = true;
GVARMAIN(moduleMRV) = true;
GVARMAIN(moduleRP) = true;
EGVAR(reinsert,RPTentObject) = "Land_TentA_F";


// Safety start
GVARMAIN(moduleSafetyStart) = true;


// Scenario control
GVARMAIN(moduleScenarioControl) = true;
EGVAR(scenario_control,successRate) = 50;


// Snowfall
GVARMAIN(moduleSnowfall) = false;
EGVAR(snowfall,maxDensity) = 50;


// Static line paradrop
GVARMAIN(moduleStaticLine) = true;


// Supply drop
GVARMAIN(moduleSupplyDrop) = true;
EGVAR(supply_drop,supplyDropPlane) = "B_T_VTOL_01_vehicle_F";
EGVAR(supply_drop,useFlare) = true;


// Task control
GVARMAIN(moduleTaskControl) = true;


// TFAR
GVARMAIN(moduleTFAR) = true;


// Time limit check
GVARMAIN(moduleTimeLimitCheck) = true;


// Vehicle respawn
GVARMAIN(moduleVehicleRespawn) = true;


// Wave respawn
GVARMAIN(moduleWaveRespawn) = false;
EGVAR(respawn_wave,availableWaves) = 3;
