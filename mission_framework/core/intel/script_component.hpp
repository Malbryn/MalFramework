#define COMPONENT intel
#define COMPONENT_STR QUOTE(Intel)

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define CBA_DEBUG_SYNCHRONOUS
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_INTEL
    #define DEBUG_MODE_FULL
#endif

#include "..\main\script_macros.hpp"
