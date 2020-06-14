// The UID of the mission maker (to access the admin menu and debug console during the mission)
#define UID "76561198066551781"  // Malbryn's UID

// VCOM AI
#define VCOMAI  // Comment out this line if VCOM is not used in the mission

// Mission parameters
class Header {
    gameType =  TDM;  // Game type (use Coop for PvE, TDM for TvT)
    minPlayers =  1;  // Minimum number of players
    maxPlayers = 12;  // Maximum number of players
};

// Mission selection screen
briefingName = "[CO-XX] Operation Name";  // Mission name on the mission selection screen where XX = max. player number (please keep this naming convention)
overviewText = "mission_info";  // Mission info on the mission selection screen (e.g. mission assets, factions, time limit etc.)

// Loading screen settings
onLoadName = "operation_name";  // Name of the operation on the loading screen (you can drop the [CO-XX] part here)
onLoadMission = "mission_description";  // Mission description on the loading screen
author = "mission_maker";  // Author of the mission
loadScreen = "mission_framework\config\img\loading_screen.jpg";  // Loading screen image (use 2:1 image ratio)
