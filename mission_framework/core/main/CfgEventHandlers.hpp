#include "script_component.hpp"

class Extended_PreInit_EventHandlers {
    class GVARMAIN(Main) {  // Main first
        init = PATH_PRE(main);
    };

    class GVARMAIN(AdminMenu) {
        init = PATH_PRE(admin_menu);
    };

    class GVARMAIN(AIScripts) {
        init = PATH_PRE(ai_scripts);
    };

    class GVARMAIN(AISkills) {
        init = PATH_PRE(ai_skills);
    };

    class GVARMAIN(Arsenal) {
        init = PATH_PRE(arsenal);
    };

    class GVARMAIN(Briefing) {
        init = PATH_PRE(briefing);
    };

    class GVARMAIN(ChatCommands) {
        init = PATH_PRE(chat_commands);
    };

    class GVARMAIN(Common) {
        init = PATH_PRE(common);
    };

    class GVARMAIN(CoverMap) {
        init = PATH_PRE(cover_map);
    };

    class GVARMAIN(Credits) {
        init = PATH_PRE(credits);
    };

    class GVARMAIN(Curator) {
        init = PATH_PRE(curator);
    };

    class GVARMAIN(DisableDamage) {
        init = PATH_PRE(disable_damage);
    };

    class GVARMAIN(EndConditions) {
        init = PATH_PRE(end_conditions);
    };

    class GVARMAIN(EndMIssion) {
        init = PATH_PRE(end_mission);
    };

    class GVARMAIN(Flyby) {
        init = PATH_PRE(flyby);
    };

    class GVARMAIN(FriendlyFire) {
        init = PATH_PRE(friendly_fire);
    };

    class GVARMAIN(Gear) {
        init = PATH_PRE(gear);
    };

    class GVARMAIN(GrassCutter) {
        init = PATH_PRE(grass_cutter);
    };

    class GVARMAIN(IED) {
        init = PATH_PRE(ied);
    };

    class GVARMAIN(Intel) {
        init = PATH_PRE(intel);
    };

    class GVARMAIN(IntroText) {
        init = PATH_PRE(intro_text);
    };

    class GVARMAIN(JIP) {
        init = PATH_PRE(jip);
    };

    class GVARMAIN(LOSTool) {
        init = PATH_PRE(los_tool);
    };

    class GVARMAIN(MissionStats) {
        init = PATH_PRE(mission_stats);
    };

    class GVARMAIN(Mortar) {
        init = PATH_PRE(mortar);
    };

    class GVARMAIN(Orbat) {
        init = PATH_PRE(orbat);
    };

    class GVARMAIN(Performance) {
        init = PATH_PRE(performance);
    };

    class GVARMAIN(Player) {
        init = PATH_PRE(player);
    };

    class GVARMAIN(Reinsert) {
        init = PATH_PRE(reinsert);
    };

    class GVARMAIN(RespawnTickets) {
        init = PATH_PRE(respawn_tickets);
    };

    class GVARMAIN(RespawnWave) {
        init = PATH_PRE(respawn_wave);
    };

    class GVARMAIN(Safety) {
        init = PATH_PRE(safety);
    };

    class GVARMAIN(ScenarioControl) {
        init = PATH_PRE(scenario_control);
    };

    class GVARMAIN(Snowfall) {
        init = PATH_PRE(snowfall);
    };

    class GVARMAIN(SupplyDrop) {
        init = PATH_PRE(supply_drop);
    };

    class GVARMAIN(TaskControl) {
        init = PATH_PRE(task_control);
    };

    class GVARMAIN(TeamColour) {
        init = PATH_PRE(team_colour);
    };

    class GVARMAIN(TFAR) {
        init = PATH_PRE(tfar);
    };

    class GVARMAIN(TimeLimit) {
        init = PATH_PRE(time_limit);
    };

    class GVARMAIN(VehicleRespawn) {
        init = PATH_PRE(vehicle_respawn);
    };

    class GVARMAIN(ViewDistance) {
        init = PATH_PRE(view_distance);
    };
};


class Extended_PostInit_EventHandlers {
    class GVARMAIN(Main) {  // Main first
        init = PATH_POST(main);
    };

    class GVARMAIN(AdminMenu) {
        init = PATH_POST(admin_menu);
    };

    class GVARMAIN(AIScripts) {
        init = PATH_POST(ai_scripts);
    };

    class GVARMAIN(AISkills) {
        init = PATH_POST(ai_skills);
    };

    class GVARMAIN(Arsenal) {
        init = PATH_POST(arsenal);
    };

    class GVARMAIN(Briefing) {
        init = PATH_POST(briefing);
    };

    class GVARMAIN(ChatCommands) {
        init = PATH_POST(chat_commands);
    };

    class GVARMAIN(Common) {
        init = PATH_POST(common);
    };

    class GVARMAIN(CoverMap) {
        init = PATH_POST(cover_map);
    };

    class GVARMAIN(Credits) {
        init = PATH_POST(credits);
    };

    class GVARMAIN(Curator) {
        init = PATH_POST(curator);
    };

    class GVARMAIN(DisableDamage) {
        init = PATH_POST(disable_damage);
    };

    class GVARMAIN(EndConditions) {
        init = PATH_POST(end_conditions);
    };

    class GVARMAIN(EndMIssion) {
        init = PATH_POST(end_mission);
    };

    class GVARMAIN(Flyby) {
        init = PATH_POST(flyby);
    };

    class GVARMAIN(FriendlyFire) {
        init = PATH_POST(friendly_fire);
    };

    class GVARMAIN(Gear) {
        init = PATH_POST(gear);
    };

    class GVARMAIN(GrassCutter) {
        init = PATH_POST(grass_cutter);
    };

    class GVARMAIN(IED) {
        init = PATH_POST(ied);
    };

    class GVARMAIN(Intel) {
        init = PATH_POST(intel);
    };

    class GVARMAIN(IntroText) {
        init = PATH_POST(intro_text);
    };

    class GVARMAIN(JIP) {
        init = PATH_POST(jip);
    };

    class GVARMAIN(LOSTool) {
        init = PATH_POST(los_tool);
    };

    class GVARMAIN(MissionStats) {
        init = PATH_POST(mission_stats);
    };

    class GVARMAIN(Mortar) {
        init = PATH_POST(mortar);
    };

    class GVARMAIN(Orbat) {
        init = PATH_POST(orbat);
    };

    class GVARMAIN(Performance) {
        init = PATH_POST(performance);
    };

    class GVARMAIN(Player) {
        init = PATH_POST(player);
    };

    class GVARMAIN(Reinsert) {
        init = PATH_POST(reinsert);
    };

    class GVARMAIN(RespawnTickets) {
        init = PATH_POST(respawn_tickets);
    };

    class GVARMAIN(RespawnWave) {
        init = PATH_POST(respawn_wave);
    };

    class GVARMAIN(Safety) {
        init = PATH_POST(safety);
    };

    class GVARMAIN(ScenarioControl) {
        init = PATH_POST(scenario_control);
    };

    class GVARMAIN(Snowfall) {
        init = PATH_POST(snowfall);
    };

    class GVARMAIN(SupplyDrop) {
        init = PATH_POST(supply_drop);
    };

    class GVARMAIN(TaskControl) {
        init = PATH_POST(task_control);
    };

    class GVARMAIN(TeamColour) {
        init = PATH_POST(team_colour);
    };

    class GVARMAIN(TFAR) {
        init = PATH_POST(tfar);
    };

    class GVARMAIN(TimeLimit) {
        init = PATH_POST(time_limit);
    };

    class GVARMAIN(VehicleRespawn) {
        init = PATH_POST(vehicle_respawn);
    };

    class GVARMAIN(ViewDistance) {
        init = PATH_POST(view_distance);
    };
};


class Extended_Init_EventHandlers {
    class CAManBase {
        init = QUOTE([_this] call FUNC(setAISkills));
    };
};
