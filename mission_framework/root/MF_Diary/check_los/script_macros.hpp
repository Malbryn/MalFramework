#define DOUBLES(var1,var2) ##var1##_##var2
#define TRIPLES(var1,var2,var3) ##var1##_##var2##_##var3
#define QUADS(var1,var2,var3,var4) ##var1##_##var2##_##var3##_##var4
#define QUOTE(var1) #var1

#define AUTHOR_PREFIX BH
#define ADDON_PREFIX checkLOS

#define FUNC(var1) QUADS(AUTHOR_PREFIX,ADDON_PREFIX,fnc,var1)
#define QFUNC(var1) QUOTE(FUNC(var1))
#define GVAR(var1) TRIPLES(AUTHOR_PREFIX,ADDON_PREFIX,var1)
#define QGVAR(var1) QUOTE(GVAR(var1))

#define ROUND_2D(var1) (round ((var1) * 100.0) / 100.0)

#define PREP(fncName) FUNC(fncName) = compile preprocessFileLineNumbers QUOTE(mission_framework\root\MF_Diary\check_los\functions\DOUBLES(fnc,fncName).sqf)
