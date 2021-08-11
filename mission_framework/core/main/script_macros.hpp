#include "script_version.hpp"

#define PREFIX MF
#define VERSION QUOTE(MAJOR.MINOR.PATCH)
#define VERSION_BUILD QUOTE(MAJOR.MINOR.PATCH.BUILD)

// DEBUGGING
#ifndef DEBUG_MODE_NORMAL
    #define DEBUG_MODE_NORMAL
    #define DEBUG_MODE_MINIMAL
#endif

#include "script_macros_common.hpp"
#include "script_macros_mission.hpp"


// ACE macros
#define GETVAR_SYS(var1,var2) getVariable [ARR_2(QUOTE(var1),var2)]
#define SETVAR_SYS(var1,var2) setVariable [ARR_2(QUOTE(var1),var2)]
#define SETPVAR_SYS(var1,var2) setVariable [ARR_3(QUOTE(var1),var2,true)]

#undef GETVAR
#define GETVAR(var1,var2,var3) (var1 GETVAR_SYS(var2,var3))
#define GETMVAR(var1,var2) (missionNamespace GETVAR_SYS(var1,var2))
#define GETPAVAR(var1,var2) (parsingNamespace GETVAR_SYS(var1,var2))

#undef SETVAR
#define SETVAR(var1,var2,var3) var1 SETVAR_SYS(var2,var3)
#define SETPVAR(var1,var2,var3) var1 SETPVAR_SYS(var2,var3)
#define SETMVAR(var1,var2) missionNamespace SETVAR_SYS(var1,var2)
#define SETPMVAR(var1,var2) missionNamespace SETPVAR_SYS(var1,var2)
#define SETPAVAR(var1,var2) parsingNamespace SETVAR_SYS(var1,var2)

#define ARR_SELECT(ARRAY,INDEX,DEFAULT) (if (count ARRAY > INDEX) then {ARRAY select INDEX} else {DEFAULT})


// Custom macros
#define AFUNC(var1,var2) TRIPLES(DOUBLES(ace,var1),fnc,var2)
#define BFUNC(var1) TRIPLES(BIS,fnc,var1)
#define CFUNC(var1) TRIPLES(CBA,fnc,var1)
#define TFUNC(var1) TRIPLES(TFAR,fnc,var1)

#undef PATHTO_SYS
#undef PREP
#undef PREPMAIN
#define PATHTO_SYS(var1,var2,var3,var4,var5) ##var1\##var2\##var3\##var4\##var5.sqf
#define PREP(var1) TRIPLES(ADDON,fnc,var1) = compile preProcessFileLineNumbers 'PATHTO_SYS(mission_framework,core,COMPONENT,functions,DOUBLES(fnc,var1))'
#define PREPMAIN(var1) TRIPLES(PREFIX,fnc,var1) = compile preProcessFileLineNumbers 'PATHTO_SYS(mission_framework,core,COMPONENT,functions,DOUBLES(fnc,var1))'

#define CCOMP(var1) QUOTE(call compile preProcessFileLineNumbers var1)
#define PATH_PRE(var1) CCOMP('mission_framework\core\var1\XEH_PreInit.sqf')
#define PATH_POST(var1) CCOMP('mission_framework\core\var1\XEH_PostInit.sqf')
#define PATH_POST_CLIENT(var1) CCOMP('mission_framework\core\var1\XEH_PostInitClient.sqf')
#define PATH_POST_SERVER(var1) CCOMP('mission_framework\core\var1\XEH_PostInitServer.sqf')

#define MSG_SYS(LEVEL,MESSAGE) format ["[MF %1] %2", LEVEL, MESSAGE]
#define MSG(LEVEL,MESSAGE) systemChat MSG_SYS(LEVEL,MESSAGE); [MSG_SYS(LEVEL,MESSAGE)] call CFUNC(log)
#define MSG_1(LEVEL,MESSAGE,ARG1) MSG(LEVEL,FORMAT_1(MESSAGE,ARG1))
#define MSG_2(LEVEL,MESSAGE,ARG1,ARG2) MSG(LEVEL,FORMAT_2(MESSAGE,ARG1,ARG2))
#define MSG_3(LEVEL,MESSAGE,ARG1,ARG2,ARG3) MSG(LEVEL,FORMAT_3(MESSAGE,ARG1,ARG2,ARG3))
#define MSG_4(LEVEL,MESSAGE,ARG1,ARG2,ARG3,ARG4) MSG(LEVEL,FORMAT_4(MESSAGE,ARG1,ARG2,ARG3,ARG4))
#define MSG_5(LEVEL,MESSAGE,ARG1,ARG2,ARG3,ARG4,ARG5) MSG(LEVEL,FORMAT_5(MESSAGE,ARG1,ARG2,ARG3,ARG4,ARG5))
#define MSG_6(LEVEL,MESSAGE,ARG1,ARG2,ARG3,ARG4,ARG5,ARG6) MSG(LEVEL,FORMAT_6(MESSAGE,ARG1,ARG2,ARG3,ARG4,ARG5,ARG6))
#define MSG_7(LEVEL,MESSAGE,ARG1,ARG2,ARG3,ARG4,ARG5,ARG6,ARG7) MSG(LEVEL,FORMAT_7(MESSAGE,ARG1,ARG2,ARG3,ARG4,ARG5,ARG6,ARG7))
#define MSG_8(LEVEL,MESSAGE,ARG1,ARG2,ARG3,ARG4,ARG5,ARG6,ARG7,ARG8) MSG(LEVEL,FORMAT_8(MESSAGE,ARG1,ARG2,ARG3,ARG4,ARG5,ARG6,ARG7,ARG8))

#define MINUTES *60

#define ROUND_2D(var1) (round ((var1) * 100.0) / 100.0)

#define DIARY_SUBJECT(ID) player createDiarySubject [toLower ID, ID]
#define DIARY_RECORD_START(ID, TITLE) player createDiaryRecord [toLower ID, [TITLE,
#define DIARY_RECORD_END ]]

#define NEWTAB(NAME) _briefing pushBack ["Diary", [NAME, "
#define ENDTAB "]];
#define DISPLAYBRIEFING() \
_size = count _briefing - 1; \
for '_i' from 0 to _size do \
{ \
    player createDiaryRecord (_briefing select _size - _i); \
};

// Custom task state colour codes
#define TASKCOLOUR_CREATED [0.902, 0.902, 0.902, 1]
#define TASKCOLOUR_ASSIGNED [0.8, 0.502, 0.2, 1]
#define TASKCOLOUR_SUCCEEDED [0, 1, 0, 1]
#define TASKCOLOUR_FAILED [1, 0, 0, 1]
#define TASKCOLOUR_CANCELLED [0.4, 0.4, 0.4, 1]

// Wave respawn options
#define OFF 0
#define AUTO 1
#define MANUAL 2
