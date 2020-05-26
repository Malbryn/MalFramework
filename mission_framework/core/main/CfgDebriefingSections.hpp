#include "script_component.hpp"

class GVARMAIN(MissionTime) {
    title = "Mission time";
    variable = "MF_var_stat_mission_time";
};

class GVARMAIN(FriendlyFires) {
    title = "Friendly fires";
    variable = QEGVAR(friendly_fire,stat_ff);
};

class GVARMAIN(CivilianKills) {
    title = "Civilian kills";
    variable = "MF_var_stat_ck";
};
