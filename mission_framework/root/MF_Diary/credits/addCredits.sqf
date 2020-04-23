/*
 * Author:
 * Malbryn
 *
 * Description:
 * Adds a "Credits" diary record to the players diary
 *
 * Arguments:
 * -
 *
 * Return Value:
 * void
 *
 * Example:
 * [] execVM "mission_framework\root\MF_Diary\credits\addCredits.sqf"
 *
 */

#define DIARY_SUBJECT(ID) player createDiarySubject [toLower ID, ID]
#define DIARY_RECORD_START(ID, TITLE) player createDiaryRecord [toLower ID, [TITLE,
#define DIARY_RECORD_END ]]

private ["_version", "_title", "_author", "_text"];

// Framework version
_version = "v1.06";

// Title of the mission
_title = briefingName;

// Author
_author = [missionConfigFile] call BIS_fnc_overviewAuthor;

_text = format ["
  <font color='#21749c' size='16' face='PuristaSemiBold'>%1</font><br/>
  <font size='14' face='PuristaMedium'>This mission was made</font> <font color='#21749c' size='14' face='PuristaSemiBold'>%2.</font><br/>
  <br/>
  <font size='14' face='PuristaMedium'>Framework version:</font> <font color='#21749c' size='14' face='PuristaSemiBold'>%3</font>
", _title, _author, _version];


DIARY_SUBJECT("Credits");

DIARY_RECORD_START("Credits", "Scenario")
_text
DIARY_RECORD_END;

DIARY_RECORD_START("Credits", "Mission Framework")
"
<font size='14' face='PuristaMedium'>This mission was made with Malbryn's Mission Framework.<br/>
<br/>
This mission framework is based on some other Arma 3 frameworks and some other scripts. See the original authors below.<br/>
<br/>
CREDITS:<br/>
 - Achilles mod<br/>
 - F3 Framework<br/>
 - FK Framework<br/>
 - Olsen Framework<br/>
 - STB_A3 Framework<br/>
 - UO Briefing Kit mod<br/>
<br/>
 - Curator scripts by Commy2<br/>
 - Friendly fire script by NeilZar<br/>
 - Server FPS notification script by NeilZar<br/>
 - AI task scripts by Nkenny<br/>
 - Global AI skill settings by joko // Jonas<br/>
 - Briefing scripts by Perfks and Pax'Jarome<br/>
 - Diary scripts by NeilZar<br/>
 - Intel scripts by Kex<br/>
 - ORBAT script by BlackHawk<br/>
 - Mortar fire script by PabstMirror<br/>
 - Snowfall script by AZCoder and JW<br/>
 - JIP teleport scripts by Diwako<br/>
 - Parachute script by Kex and cobra4v320<br/>
 - Vehicle respawn scripts by Fredrik Eriksson<br/>
 - Cover map script by BlackHawk, PIZZADOX and Karel Moricky<br/>
 - Mission time script by Starfox64<br/>
 - No-damage ending script by Starfox64<br/>
 - LOS and terrain profile tools by BlackHawk<br/>
</font>
"
DIARY_RECORD_END;
