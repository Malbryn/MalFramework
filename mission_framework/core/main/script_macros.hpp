#define DEBUG_MODE_FULL
#define PREFIX MF
#define VERSION v1.07


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
#define CFUNC(var1) TRIPLES(CBA,fnc,var1)
#define AFUNC(var1,var2) TRIPLES(DOUBLES(ace,var1),fnc,var2)

#undef PATHTO_SYS
#undef PREP
#undef PREPMAIN
#define PATHTO_SYS(var1,var2,var3,var4,var5) ##var1\##var2\##var3\##var4\##var5.sqf
#define PREP(var1) TRIPLES(ADDON,fnc,var1) = compile preProcessFileLineNumbers 'PATHTO_SYS(mission_framework,core,COMPONENT,functions,DOUBLES(fnc,var1))'
#define PREPMAIN(var1) TRIPLES(PREFIX,fnc,var1) = compile preProcessFileLineNumbers 'PATHTO_SYS(mission_framework,core,COMPONENT,functions,DOUBLES(fnc,var1))'

#define CCOMP(var1) QUOTE(call compile preProcessFileLineNumbers var1)
#define PATH_PRE(var1) CCOMP('mission_framework\core\var1\XEH_PreInit.sqf')
#define PATH_POST(var1) CCOMP('mission_framework\core\var1\XEH_PostInit.sqf')
