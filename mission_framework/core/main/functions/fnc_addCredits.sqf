#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Adds a "Credits" diary record to the player's diary.

    Arguments:
        -

    Example:
        call MF_main_fnc_addCredits

    Returns:
        void
*/

if !(hasInterface) exitWith {};

// Framework version
private _version = VERSION;
private _build = BUILD;

// Title of the mission
private _title = briefingName;

// Author
private _author = [missionConfigFile] call BFUNC(overviewAuthor);

private _text = format ["
    <font color='#21749c' size='16' face='PuristaSemiBold'>%1</font><br/>
    <font size='14' face='PuristaMedium'>This mission was made</font> <font color='#21749c' size='14' face='PuristaSemiBold'>%2.</font><br/>
    <br/>
    <font size='14' face='PuristaMedium'>Framework version:</font> <font color='#21749c' size='14' face='PuristaSemiBold'>%3 (Build %4)</font>
", _title, _author, _version, _build];

DIARY_SUBJECT("Credits");

DIARY_RECORD_START("Credits", "Scenario")
_text
DIARY_RECORD_END;

DIARY_RECORD_START("Credits", "Mission Framework")
"
<img image='mission_framework\core\main\img\banner.jpg' width='360' height='90'/>
<br/>
<font size='14' face='PuristaMedium'>This mission was made with Malbryn's Mission Framework.<br/>
<br/>
Some parts of this framework are based on other Arma 3 frameworks and scripts. See the original authors below.<br/>
<br/>
 - AI task scripts by Nkenny<br/>
 - AI spawner (originally JEBUS) scripts by DreadPirate<br/>
 - AO limit scripts by Olsen and Starfox64<br/>
 - Briefing scripts by Perfks and Pax'Jarome<br/>
 - Curator scripts by Commy2<br/>
 - Diary macros by NeilZar<br/>
 - Global AI skill settings by joko // Jonas<br/>
 - JIP teleport scripts by Diwako<br/>
 - Killcam script by Perfk and BlackHawk<br/>
 - Kill tracker script by PabstMirror<br/>
 - LOS and terrain profile tools by BlackHawk<br/>
 - Map cover script by BlackHawk, PIZZADOX and Karel Moricky<br/>
 - Mortar fire script by PabstMirror<br/>
 - ORBAT script by BlackHawk<br/>
 - Parachute script by Kex and cobra4v320<br/>
 - Rearm scripts by GitHawk<br/>
 - Setup timer script by Olsen<br/>
 - Sit down script by RickOShay<br/>
 - Snowfall script by AZCoder and JW<br/>
 - Vehicle respawn scripts by Fredrik Eriksson<br/>
<br/>
Special thanks to <font color='#21749c'>Garfield</font> and <font color='#21749c'>kMaN</font> for their technical help.
</font>
"
DIARY_RECORD_END;

// Removing some Diary records
[{!isNil "cba_help_DiaryRecordAddons"}, {
    player removeDiarySubject "cba_help_docs";
}] call CFUNC(waitUntilAndExecute);
