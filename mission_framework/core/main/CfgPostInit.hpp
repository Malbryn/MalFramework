#include "script_component.hpp"

class GVARMAIN(Main) {  // Main first
    init = PATH_POST(main);
    clientInit = PATH_POST_CLIENT(main);
    serverInit = PATH_POST_SERVER(main);
};

class GVARMAIN(ACRE) {
    init = PATH_POST(acre);
    clientInit = PATH_POST_CLIENT(acre);
    serverInit = PATH_POST_SERVER(acre);
};

class GVARMAIN(Admin) {
    init = PATH_POST(admin);
    clientInit = PATH_POST_CLIENT(admin);
    serverInit = PATH_POST_SERVER(admin);
};

class GVARMAIN(AISkills) {
    init = PATH_POST(ai_skills);
    clientInit = PATH_POST_CLIENT(ai_skills);
    serverInit = PATH_POST_SERVER(ai_skills);
};

class GVARMAIN(AISpawner) {
    init = PATH_POST(ai_spawner);
    clientInit = PATH_POST_CLIENT(ai_spawner);
    serverInit = PATH_POST_SERVER(ai_spawner);
};

class GVARMAIN(AOLimit) {
    init = PATH_POST(ao_limit);
    clientInit = PATH_POST_CLIENT(ao_limit);
    serverInit = PATH_POST_SERVER(ao_limit);
};

class GVARMAIN(Briefing) {
    init = PATH_POST(briefing);
    clientInit = PATH_POST_CLIENT(briefing);
    serverInit = PATH_POST_SERVER(briefing);
};

class GVARMAIN(CBRN) {
    init = PATH_POST(cbrn);
    clientInit = PATH_POST_CLIENT(cbrn);
    serverInit = PATH_POST_SERVER(cbrn);
};

class GVARMAIN(Common) {
    init = PATH_POST(common);
    clientInit = PATH_POST_CLIENT(common);
    serverInit = PATH_POST_SERVER(common);
};

class GVARMAIN(Countdown) {
    init = PATH_POST(countdown);
    clientInit = PATH_POST_CLIENT(countdown);
    serverInit = PATH_POST_SERVER(countdown);
};

class GVARMAIN(CustomChannel) {
    init = PATH_POST(custom_channel);
    clientInit = PATH_POST_CLIENT(custom_channel);
    serverInit = PATH_POST_SERVER(custom_channel);
};

class GVARMAIN(EndConditions) {
    init = PATH_POST(end_conditions);
    clientInit = PATH_POST_CLIENT(end_conditions);
    serverInit = PATH_POST_SERVER(end_conditions);
};

class GVARMAIN(EndMission) {
    init = PATH_POST(end_mission);
    clientInit = PATH_POST_CLIENT(end_mission);
    serverInit = PATH_POST_SERVER(end_mission);
};

class GVARMAIN(Flyby) {
    init = PATH_POST(flyby);
    clientInit = PATH_POST_CLIENT(flyby);
    serverInit = PATH_POST_SERVER(flyby);
};

class GVARMAIN(Gear) {
    init = PATH_POST(gear);
    clientInit = PATH_POST_CLIENT(gear);
    serverInit = PATH_POST_SERVER(gear);
};

class GVARMAIN(GrassCutter) {
    init = PATH_POST(grass_cutter);
    clientInit = PATH_POST_CLIENT(grass_cutter);
    serverInit = PATH_POST_SERVER(grass_cutter);
};

class GVARMAIN(Hostage) {
    init = PATH_POST(hostage);
    clientInit = PATH_POST_CLIENT(hostage);
    serverInit = PATH_POST_SERVER(hostage);
};

class GVARMAIN(IED) {
    init = PATH_POST(ied);
    clientInit = PATH_POST_CLIENT(ied);
    serverInit = PATH_POST_SERVER(ied);
};

class GVARMAIN(Intel) {
    init = PATH_POST(intel);
    clientInit = PATH_POST_CLIENT(intel);
    serverInit = PATH_POST_SERVER(intel);
};

class GVARMAIN(IntroText) {
    init = PATH_POST(intro_text);
    clientInit = PATH_POST_CLIENT(intro_text);
    serverInit = PATH_POST_SERVER(intro_text);
};

class GVARMAIN(JIP) {
    init = PATH_POST(jip);
    clientInit = PATH_POST_CLIENT(jip);
    serverInit = PATH_POST_SERVER(jip);
};

class GVARMAIN(Killcam) {
    init = PATH_POST(killcam);
    clientInit = PATH_POST_CLIENT(killcam);
    serverInit = PATH_POST_SERVER(killcam);
};

class GVARMAIN(Logistics) {
    init = PATH_POST(logistics);
    clientInit = PATH_POST_CLIENT(logistics);
    serverInit = PATH_POST_SERVER(logistics);
};

class GVARMAIN(LOSTool) {
    init = PATH_POST(los_tool);
    clientInit = PATH_POST_CLIENT(los_tool);
    serverInit = PATH_POST_SERVER(los_tool);
};

class GVARMAIN(MapCover) {
    init = PATH_POST(map_cover);
    clientInit = PATH_POST_CLIENT(map_cover);
    serverInit = PATH_POST_SERVER(map_cover);
};

class GVARMAIN(MarkerSide) {
    init = PATH_POST(marker_side);
    clientInit = PATH_POST_CLIENT(marker_side);
    serverInit = PATH_POST_SERVER(marker_side);
};

class GVARMAIN(Mortar) {
    init = PATH_POST(mortar);
    clientInit = PATH_POST_CLIENT(mortar);
    serverInit = PATH_POST_SERVER(mortar);
};

class GVARMAIN(ORBAT) {
    init = PATH_POST(orbat);
    clientInit = PATH_POST_CLIENT(orbat);
    serverInit = PATH_POST_SERVER(orbat);
};

class GVARMAIN(Player) {
    init = PATH_POST(player);
    clientInit = PATH_POST_CLIENT(player);
    serverInit = PATH_POST_SERVER(player);
};

class GVARMAIN(Reinsertion) {
    init = PATH_POST(reinsertion);
    clientInit = PATH_POST_CLIENT(reinsertion);
    serverInit = PATH_POST_SERVER(reinsertion);
};

class GVARMAIN(Respawn) {
    init = PATH_POST(respawn);
    clientInit = PATH_POST_CLIENT(respawn);
    serverInit = PATH_POST_SERVER(respawn);
};

class GVARMAIN(Retreat) {
    init = PATH_POST(retreat);
    clientInit = PATH_POST_CLIENT(retreat);
    serverInit = PATH_POST_SERVER(retreat);
};

class GVARMAIN(Safety) {
    init = PATH_POST(safety);
    clientInit = PATH_POST_CLIENT(safety);
    serverInit = PATH_POST_SERVER(safety);
};

class GVARMAIN(SetupTimer) {
    init = PATH_POST(setup_timer);
    clientInit = PATH_POST_CLIENT(setup_timer);
    serverInit = PATH_POST_SERVER(setup_timer);
};

class GVARMAIN(Snowfall) {
    init = PATH_POST(snowfall);
    clientInit = PATH_POST_CLIENT(snowfall);
    serverInit = PATH_POST_SERVER(snowfall);
};

class GVARMAIN(SupplyDrop) {
    init = PATH_POST(supply_drop);
    clientInit = PATH_POST_CLIENT(supply_drop);
    serverInit = PATH_POST_SERVER(supply_drop);
};

class GVARMAIN(TFAR) {
    init = PATH_POST(tfar);
    clientInit = PATH_POST_CLIENT(tfar);
    serverInit = PATH_POST_SERVER(tfar);
};

class GVARMAIN(UnitTracking) {
    init = PATH_POST(unit_tracking);
    clientInit = PATH_POST_CLIENT(unit_tracking);
    serverInit = PATH_POST_SERVER(unit_tracking);
};

class GVARMAIN(VehicleRespawn) {
    init = PATH_POST(vehicle_respawn);
    clientInit = PATH_POST_CLIENT(vehicle_respawn);
    serverInit = PATH_POST_SERVER(vehicle_respawn);
};
