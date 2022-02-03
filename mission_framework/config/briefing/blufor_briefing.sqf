/*    
    Briefing Builder tool can be found here:
    https://malbryn.github.io/MalFramework/briefing_builder.html

    CHEAT SHEET
    Line break:
    <br/>

    Font attributes:
    <font color='#21749c' size='18' face='PuristaBold'>

    Clickable link to marker:
    <marker name='nameOfTheMarker'>Click here</marker>

    Image:
    <img image='mission_framework\config\img\loading_screen.jpg' width='270' height='378'/>
*/

NEWTAB("I. Organisation")
<br/><font color='#21749c' size='18' face='PuristaBold'>BLUFOR ORBAT</font>
<br/>
<br/><font color='#21749c' size='14' face='PuristaSemiBold'>player_unit_or_faction</font>
<br/>list_of_the_squads_and_callsigns
ENDTAB;

NEWTAB("II. Situation")
<br/><font color='#21749c' size='18' face='PuristaBold'>SUMMARY</font>
<br/>summary_of_the_background_of_the_mission
<br/>
<br/>
<br/><font color='#21749c' size='18' face='PuristaBold'>AREA OF OPERATIONS</font>
<br/><font color='#21749c' size='14' face='PuristaSemiBold'>Terrain</font>
<br/>description_of_the_terrain
<br/>
<br/><font color='#21749c' size='14' face='PuristaSemiBold'>Weather</font>
<br/><font size='12' face='PuristaMedium'>Current:</font>
<br/> - description_of_the_weather
<br/>
<br/><font size='12' face='PuristaMedium'>Forecast:</font>
<br/> - possible_change_of_the_weather
<br/>
<br/><font size='12' face='PuristaMedium'>Visibility:</font>
<br/> - estimated_view_distance
<br/> - night_mission_conditions
<br/>
<br/><font color='#21749c' size='14' face='PuristaSemiBold'>Civilian presence</font>
<br/> - info_about_civies
<br/>
<br/>
<br/><font color='#21749c' size='18' face='PuristaBold'>ENEMY FORCES</font>
<br/><font color='#21749c' size='14' face='PuristaSemiBold'>Composition and Strength</font>
<br/>description_of_the_enemy_composition_and_weaponry
<br/>enemy_qrf_composition_and_strength
<br/>
<br/><font color='#21749c' size='14' face='PuristaSemiBold'>Capabilities:</font>
<br/><font size='12' face='PuristaMedium'>Armour:</font>
<br/> - enemy_armour
<br/>
<br/><font size='12' face='PuristaMedium'>Air:</font>
<br/> - enemy_air
<br/>
<br/><font size='12' face='PuristaMedium'>Artillery:</font>
<br/> - enemy_artillery
<br/>
<br/><font size='12' face='PuristaMedium'>Explosives:</font>
<br/> - enemy_mines_ieds_etc
<br/>
<br/><font color='#21749c' size='14' face='PuristaSemiBold'>Rules of engagement:</font>
<br/>summary_of_the_ROE
ENDTAB;

NEWTAB("III. Mission:")
<br/><font color='#21749c' size='18' face='PuristaBold'>MISSION INTENT</font>
<br/>short_description_of_the_mission
<br/>
<br/>
<br/><font color='#21749c' size='18' face='PuristaBold'>OBJECTIVES</font>
<br/><font color='#21749c' size='14' face='PuristaSemiBold'>location_of_the_1st_objective:</font>
<br/> - short_description_of_this_objective
<br/>
<br/><font color='#21749c' size='14' face='PuristaSemiBold'>location_of_the_2nd_objective:</font>
<br/> - short_description_of_this_objective
<br/>
<br/>(...)
ENDTAB;

NEWTAB("IV. Support & Logistics:")
<br/><font color='#21749c' size='18' face='PuristaBold'>SUPPORT</font>
<br/><font color='#21749c' size='14' face='PuristaSemiBold'>Available supports:</font>
<br/> - available_friendly_supports
<br/>
<br/>
<br/><font color='#21749c' size='18' face='PuristaBold'>LOGISTICS</font>
<br/><font color='#21749c' size='14' face='PuristaSemiBold'>Maintenance:</font>
<br/> - RRR_information
<br/>
<br/><font color='#21749c' size='14' face='PuristaSemiBold'>Transportation:</font>
<br/> - infantry_transport_information
<br/>
<br/><font color='#21749c' size='14' face='PuristaSemiBold'>Resupplies:</font>
<br/> - information_of_the_available_resupplies
<br/>
<br/>
<br/><font color='#21749c' size='18' face='PuristaBold'>SIGNALS</font>
<br/><font color='#21749c' size='14' face='PuristaSemiBold'>Radio frequencies</font>
<br/> - designated_radio_net_structure
<br/>
ENDTAB;

NEWTAB("V. Notes:")
<br/><font color='#21749c' size='18' face='PuristaBold'>RESPAWNS</font>
<br/><font color='#21749c' size='14' face='PuristaSemiBold'>Player respawn</font>
<br/> - player_respawn_info
<br/>
<br/><font color='#21749c' size='14' face='PuristaSemiBold'>Asset respawn</font>
<br/> - asset_respawn_info
<br/>
<br/><font color='#21749c' size='14' face='PuristaSemiBold'>Reinsertion</font>
<br/> - reinsertion_info
<br/>
<br/>
<br/><font color='#21749c' size='18' face='PuristaBold'>END CONDITIONS</font>
<br/><font color='#21749c' size='14' face='PuristaSemiBold'>Success</font>
<br/> - success_conditions
<br/>
<br/><font color='#21749c' size='14' face='PuristaSemiBold'>Failure</font>
<br/> - failure_conditions
<br/>
<br/>
<br/><font color='#21749c' size='18' face='PuristaBold'>RESTRICTIONS</font>
<br/> - additional_rules
<br/>
<br/>
<br/><font color='#21749c' size='18' face='PuristaBold'>JIP</font>
<br/> - join-in-progress_info
<br/>
<br/>
<br/><font color='#21749c' size='18' face='PuristaBold'>Mission maker's notes</font>
<br/> - mission_notes
<br/> - other_technical_information
ENDTAB;
