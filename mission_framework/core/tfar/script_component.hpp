#define COMPONENT tfar
#define COMPONENT_STR QUOTE(TFAR)

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define CBA_DEBUG_SYNCHRONOUS
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_TFAR
    #define DEBUG_MODE_FULL
#endif

#include "..\main\script_macros.hpp"

// Module-specific macros
#define STEREO_ARRAY [ARR_3(0,1,2)]
