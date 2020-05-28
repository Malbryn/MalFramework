#include "..\core\main\script_macros.hpp"  // DO NOT REMOVE

/* -------------------------------- MISSION PARAMETERS -------------------------------- */
/* ------------------------- DON'T REMOVE OR COMMENT OUT THESE ------------------------ */

GVARMAIN(playerViewDistance) = 2000;
GVARMAIN(serverViewDistance) = 2000;


/* --------------------------------- OPTIONAL MODULES --------------------------------- */

// Ambient fly-by
GVARMAIN(moduleFlyby) = true;


// IED
GVARMAIN(moduleIED) = true;


// Intel
GVARMAIN(moduleIntel) = true;


// JIP
GVARMAIN(moduleJIP) = true;
EGVAR(jip,JIPTimer) = 3 MINUTES;


// Mortar fire
GVARMAIN(moduleMortar) = true;


// ORBAT
GVARMAIN(moduleOrbat) = true;


// Reinsert
GVARMAIN(moduleHALO) = true;

GVARMAIN(moduleMRV) = true;

GVARMAIN(moduleRP) = true;
EGVAR(reinsert,RPTentObject) = "Land_TentA_F";


// Snowfall
GVARMAIN(moduleSnowfall) = false;
EGVAR(snowfall,maxDensity) = 50;


// Supply drop
GVARMAIN(moduleSupplyDrop) = true;
EGVAR(supply_drop,supplyDropPlane) = "B_T_VTOL_01_vehicle_F";


// Vehicle respawn
GVARMAIN(moduleVehicleRespawn) = true;
