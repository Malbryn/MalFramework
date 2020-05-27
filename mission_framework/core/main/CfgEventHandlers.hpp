#include "script_component.hpp"

class Extended_PreInit_EventHandlers {
    class GVARMAIN(Main) {  // Main first
        init = PATH_PRE(main);
    };

    class GVARMAIN(AdminMenu) {
        init = PATH_PRE(admin_menu);
    };

    class GVARMAIN(Arsenal) {
        init = PATH_PRE(arsenal);
    };

    class GVARMAIN(ChatCommands) {
        init = PATH_PRE(chat_commands);
    };

    class GVARMAIN(Common) {
        init = PATH_PRE(common);
    };

    class GVARMAIN(Curator) {
        init = PATH_PRE(curator);
    };

    class GVARMAIN(Flyby) {
        init = PATH_PRE(flyby);
    };

    class GVARMAIN(FriendlyFire) {
        init = PATH_PRE(friendly_fire);
    };

    class GVARMAIN(IED) {
        init = PATH_PRE(ied);
    };

    class GVARMAIN(Mortar) {
        init = PATH_PRE(mortar);
    };

    class GVARMAIN(Performance) {
        init = PATH_PRE(performance);
    };

    class GVARMAIN(Reinsert) {
        init = PATH_PRE(reinsert);
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

    class GVARMAIN(VehicleRespawn) {
        init = PATH_PRE(vehicle_respawn);
    };
};


class Extended_PostInit_EventHandlers {
    class GVARMAIN(Main) {  // Main first
        init = PATH_POST(main);
    };

    class GVARMAIN(AdminMenu) {
        init = PATH_POST(admin_menu);
    };

    class GVARMAIN(Arsenal) {
        init = PATH_POST(arsenal);
    };

    class GVARMAIN(ChatCommands) {
        init = PATH_POST(chat_commands);
    };

    class GVARMAIN(Common) {
        init = PATH_POST(common);
    };

    class GVARMAIN(Curator) {
        init = PATH_POST(curator);
    };

    class GVARMAIN(Flyby) {
        init = PATH_POST(flyby);
    };

    class GVARMAIN(FriendlyFire) {
        init = PATH_POST(friendly_fire);
    };

    class GVARMAIN(IED) {
        init = PATH_POST(ied);
    };

    class GVARMAIN(Mortar) {
        init = PATH_POST(mortar);
    };

    class GVARMAIN(Performance) {
        init = PATH_POST(performance);
    };

    class GVARMAIN(Reinsert) {
        init = PATH_POST(reinsert);
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

    class GVARMAIN(VehicleRespawn) {
        init = PATH_POST(vehicle_respawn);
    };
};

