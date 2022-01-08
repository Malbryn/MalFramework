#include "script_component.hpp"

[QGVARMAIN(initFramework), {
    // Reset rank icons
    [faction player, [
            "\A3\Ui_f\data\GUI\Cfg\Ranks\private_gs.paa",
            "\A3\Ui_f\data\GUI\Cfg\Ranks\corporal_gs.paa",
            "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa",
            "\A3\Ui_f\data\GUI\Cfg\Ranks\lieutenant_gs.paa",
            "\A3\Ui_f\data\GUI\Cfg\Ranks\captain_gs.paa",
            "\A3\Ui_f\data\GUI\Cfg\Ranks\major_gs.paa",
            "\A3\Ui_f\data\GUI\Cfg\Ranks\colonel_gs.paa"
    ]] call AFUNC(nametags,setFactionRankIcons);

    if (GVARMAIN(isTvT)) then {
        // Set side values
        [QGVAR(sideValueSet), [playerSide, 1, 1, 0]] call CFUNC(serverEvent);
    };
}] call CFUNC(addEventHandler);

// Delete marker
[QGVARMAIN(deleteMarkerSide), {
    params ["_marker", "_side"];

    [_marker, _side] call FUNC(deleteMarkerSide);
}] call CFUNC(addEventHandler);

// Capture the flag action
[QGVAR(removeCTFAction), {
    params ["_obj", "_ID"];

    [_obj, _ID] call BFUNC(holdActionRemove);
}] call CFUNC(addEventHandler);

// Init chat commands
call FUNC(registerChatCommands);
