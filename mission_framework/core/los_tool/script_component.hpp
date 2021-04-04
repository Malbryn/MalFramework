#define COMPONENT los_tool
#define COMPONENT_STR QUOTE(LOS Tool)

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define CBA_DEBUG_SYNCHRONOUS
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_LOS_TOOL
    #define DEBUG_MODE_FULL
#endif

#include "..\main\script_macros.hpp"

// Custom macros
#define STR_TELEMETRY_LOG "[checkLOS] %5 generated %2m area, %1 cells, size %3m, in %4s."

#define STR_FINISHED_MESSAGE "Finished\ndrawn cells: %1\ncell size: %2m\ntime taken: %3s"

#define STR_DIARY_LOS "<font color='#21749c' size='18' face='PuristaBold'><execute expression='call %1'>Check LOS</execute><br/>\
<br/>\
<execute expression='call %2'>Clear LOS display</execute></font><br/>\
<br/>\
How to use it:<br/>\
1. Click blue 'Check LOS' text<br/>\
2. On map, click position where Line of Sight will be calculated from<br/>\
3. Click position where will be middle of area where LOS will be calculated<br/>\
4. Move your mouse to set size of the area, click to confirm<br/>\
5. Wait for script to finish. Depending on cell count you selected it might take from 3 seconds up to few minutes!<br/>\
<br/>\
You can abort generation at any time by pressing A on your keyboard."

#define STR_DIARY_PROFILE "<font color='#21749c' size='18' face='PuristaBold'><execute expression='call %1'>Draw Terrain Profile</execute><br/>\
<br/>\
<execute expression='call %2'>Remove Terrain Profile chart</execute></font><br/>\
<br/>\
How to use it:<br/>\
1. Click blue 'Draw Terrain Profile' text<br/>\
2. On map, click position where terrain profile will start<br/>\
3. Click end position for profile<br/>\
4. Chart can be closed by pressing x in it's right upper corner."

#define STR_DISABLED "LOS Tool is only available on the briefing screen."

#define STR_DIARY_SUBJECT "LOS Tool"

#define STR_DIARY_USER_INSTR "<font color='#21749c' size='18' face='PuristaBold'>Important information</font><br/>\
 - LOS Tool is available only during briefing<br/>\
 - The drawings are local meaning that other people won't see them<br/>\
 - LOS Tool's resolution scales with size of area. Make area smaller for better quality<br/>\
 - Areas colored <font color='#FF4444'>red</font> are areas <font color='#FF4444'>obscured</font> by terrain<br/>\
 - Areas colored <font color='#4444FF'>blue</font> are <font color='#4444FF'>not obscured</font> by terrain, but might be obscured by objects or vegetation<br/>\
<br/>\
Author: BlackHawk"
