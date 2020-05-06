// The UID of the mission maker (to access the admin menu and debug console during the mission)
#define UID "76561198066551781"  // Malbryn's UID


// Mission parameters
class Header {
    gameType =  Coop;  // Game type (use Coop for regular scripted missions)
    minPlayers =  1;  // Minimum number of players
    maxPlayers = 8;  // Maximum number of players
};


// Mission selection screen
briefingName = "[CO-XX] Operation Name";  // Mission name on the mission selection screen (please keep this naming convention)
overviewText = "mission_info";  // Mission info on the mission selection screen (e.g. mission assets, any major restriction)


// Loading screen settings
onLoadName = "operation_name";  // Name of the operation on the loading screen (you can drop the [CO-XX] part here)
onLoadMission = "mission_description";  // Mission description on the loading screen
author = "mission_maker";  // Author of the mission
loadScreen = "mission_framework\config\img\loading_screen.jpg";  // Loading screen image (use 2:1 image ratio)


// Respawn settings
respawnButton = 1;  // Enable/disable the respawn button (in the Esc menu)
respawnDelay = 30;  // Respawn delay in seconds (this is overwritten by the framework when using the wave respawn module)
