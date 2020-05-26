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

    class GVARMAIN(Curator) {
        init = PATH_PRE(curator);
    };

    class GVARMAIN(Flyby) {
        init = PATH_PRE(flyby);
    };

    class GVARMAIN(FriendlyFire) {
        init = PATH_PRE(friendly_fire);
    };

    class GVARMAIN(Performance) {
        init = PATH_PRE(performance);
    };

    class GVARMAIN(TaskControl) {
        init = PATH_PRE(task_control);
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

    class GVARMAIN(Curator) {
        init = PATH_POST(curator);
    };

    class GVARMAIN(Flyby) {
        init = PATH_POST(flyby);
    };

    class GVARMAIN(FriendlyFire) {
        init = PATH_POST(friendly_fire);
    };

    class GVARMAIN(Performance) {
        init = PATH_POST(performance);
    };

    class GVARMAIN(TaskControl) {
        init = PATH_POST(task_control);
    };
};

