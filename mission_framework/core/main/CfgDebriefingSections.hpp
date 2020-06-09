#include "script_component.hpp"

class CfgDebriefingSections {
    class GVARMAIN(MissionTime) {
        title = "Mission time";
        variable = QEGVAR(mission_stats,missionTime);
    };

    class GVARMAIN(FriendlyFires) {
        title = "Friendly fires";
        variable = QEGVAR(mission_stats,friendlyFires);
    };

    class GVARMAIN(CivilianKills) {
        title = "Civilian kills";
        variable = QEGVAR(mission_stat,civilianKills);
    };
};
