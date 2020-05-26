#define MINUTES *60  // DO NOT REMOVE

// Ambient fly-by
GVARMAIN(moduleFlyby) = true;

// IED
GVARMAIN(moduleIED) = true;

// JIP
GVARMAIN(moduleJIP) = true;
GVARMAIN(JIPTimer) = 3 MINUTES;

// Mortar fire
GVARMAIN(moduleMortar) = true;

// Snowfall
GVARMAIN(moduleSnowfall) = true;
EGVAR(snowfall,maxDensity) = 50;
