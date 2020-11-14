#define COMPONENT admin

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define CBA_DEBUG_SYNCHRONOUS
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_ADMIN
    #define DEBUG_MODE_FULL
#endif

#include "..\main\script_macros.hpp"

// Custom task state colours
#define TASKCOLOUR_CREATED [0.902, 0.902, 0.902, 1]
#define TASKCOLOUR_ASSIGNED [0.8, 0.502, 0.2, 1]
#define TASKCOLOUR_SUCCEEDED [0, 1, 0, 1]
#define TASKCOLOUR_FAILED [1, 0, 0, 1]
#define TASKCOLOUR_CANCELLED [0.4, 0.4, 0.4, 1]
