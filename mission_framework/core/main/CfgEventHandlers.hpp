#include "script_component.hpp"

/*
EXAMPLES:

class Extended_PreInit_EventHandlers {
    class My_pre_init_event {
        init = "call compile preprocessFileLineNumbers 'XEH_preInit.sqf'";
        serverInit = "call compile preprocessFileLineNumbers 'XEH_preInitServer.sqf'";
        clientInit = "call compile preprocessFileLineNumbers 'XEH_preInitClient.sqf'";
    };
};


class Extended_PostInit_EventHandlers {
    class My_post_init_event {
        init = "call compile preprocessFileLineNumbers 'XEH_postInit.sqf'";
        serverInit = "call compile preprocessFileLineNumbers 'XEH_postInitServer.sqf'";
        clientInit = "call compile preprocessFileLineNumbers 'XEH_postInitClient.sqf'";
    };
};
*/


class Extended_PreInit_EventHandlers {
    class GVARMAIN(admin_menu) {
        clientInit = PATH_PRE(admin_menu);
    };

    class GVARMAIN(arsenal) {
        clientInit = PATH_PRE(arsenal);
    };

    class GVARMAIN(chat_commands) {
        clientInit = PATH_PRE(chat_commands);
    };

    class GVARMAIN(main) {
        clientInit = PATH_PRE(main);
    };
};


class Extended_PostInit_EventHandlers {
    class GVARMAIN(admin_menu) {
        clientInit = PATH_POST(admin_menu);
    };

    class GVARMAIN(arsenal) {
        clientInit = PATH_POST(arsenal);
    };

    class GVARMAIN(chat_commands) {
        clientInit = PATH_POST(chat_commands);
    };

    class GVARMAIN(main) {
        clientInit = PATH_POST(main);
    };
};
