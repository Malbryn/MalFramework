// DO NOT EDIT THIS
/* -------------------------------------------------------------------------- */
_briefing = [];

#define NEWTAB(NAME) _briefing set [count _briefing, ["Diary",[NAME,"
#define ENDTAB "]]];

#define DISPLAYBRIEFING() \
_size = count _briefing - 1; \
for '_i' from 0 to _size do \
{ \
	player createDiaryRecord (_briefing select _size - _i); \
};



// EDIT BELOW THE LINE
/* -------------------------------------------------------------------------- */
NEWTAB("I. Organization")
<br/><font color='#FFA500' size='16' face='PuristaBold'>player_facetion_goes_here</font>
<br/>list_of_the_squads_goes_here
<br/>
<br/><font color='#FFA500' size='16' face='PuristaBold'>Attached Forces:</font>
<br/>list_of_the_friendly_assets_goes_here
ENDTAB;

NEWTAB("II. Situation")
<br/>description_of_the_current_situation_goes_here
<br/>
<br/><font color='#FFA500' size='16' face='PuristaBold'>Area of Operation:</font>
<br/><font color='#d21111' size='15'>a) Terrain:</font>
<br/>description_of_the_terrain_goes_here
<br/>
<br/><font color='#d21111' size='15'>b) Weather:</font>
<br/><font size='14'>CURRENT:</font>
<br/>Wind:
<br/>Rain:
<br/>Sky:
<br/>Fog:
<br/>
<br/><font size='14'>FORECAST:</font>
<br/>possible_change_of_the_weather_goes_here
<br/>
<br/><font size='14'>MOONSTATE:</font>
<br/>day_or_night_op
<br/>
<br/><font size='14'>VISIBILITY:</font>
<br/>estimated_view_distance_goes_here
<br/>
<br/><font color='#FFA500' size='16' face='PuristaBold'>Enemy:</font>
<br/><font color='#d21111' size='15'>a) Composition and Strength:</font>
<br/>description_of_the_enemy_composition_weapons_and_assets
<br/>enemy_qrf_composition_strength
<br/>
<br/><font color='#d21111' size='15'>b) Capabilities:</font>
<br/><font size='14'>MANEUVER:</font>
<br/>
<br/>
<br/><font size='14'>FIRE SUPPORT:</font>
<br/>
<br/>
<br/><font size='14'>EXPLOSIVES:</font>
<br/>
ENDTAB;

NEWTAB("III. Mission:")
<br/><font color='#FFA500' size='16' face='PuristaBold'>Objectives:</font>
<br/><font color='#d21111' size='15'>location_of_obj</font>
<br/> - short_description_of_this_obj
ENDTAB;

NEWTAB("IV. Execution:")
<br/>Up to Platoon Commander
ENDTAB;

NEWTAB("V. Service Support:")
<br/><font color='#d21111' size='15'>Resupply:</font>
<br/>
ENDTAB;

NEWTAB("VI. Mission notes:")
<br/><font color='#FFA500' size='15'>RESPAWN</font>
<br/>respawn_info_goes_here
<br/>
<br/><font color='#FFA500' size='15'>END CONDITION</font>
<br/>
<br/><font size='14'>VICTORY CONDITION:</font>
<br/>end_conditions
<br/>
<br/><font size='14'>DEFEAT VICTORY:</font>
<br/>end_conditions
<br/>
<br/><font color='#FFA500' size='15'>USE OF ENEMY VEHICLE ASSETS</font>
<br/>yay_or_nay
<br/>
<br/><font color='#FFA500' size='15'>USE OF ENEMY WEAPONS</font>
<br/>yay_or_nay
<br/>
<br/><font color='#FFA500' size='15'>TECHNICAL ASPECT</font>
<br/>
<br/>- View Distance:
<br/>-- Player:
<br/>-- AI:
ENDTAB;

DISPLAYBRIEFING();
