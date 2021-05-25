#include "script_component.hpp"

if (isServer && GVARMAIN(isTvT)) then {
    [QGVARMAIN(initFramework), {
        call FUNC(eventHandleDisconnect);
        call FUNC(setViewDistance);
    }] call CFUNC(addEventHandler);

    [QGVAR(sideValueSet), {
        params ["_side", "_changeTotal", "_changeCurrent", "_changeTickets"];

        [_side, _changeTotal, _changeCurrent, _changeTickets] call FUNC(setSideValue);
    }] call CFUNC(addEventHandler);
};

if (hasInterface) then {
    // Reset rank icons
    [QGVARMAIN(initFramework), {
        [faction player, [
             "\A3\Ui_f\data\GUI\Cfg\Ranks\private_gs.paa",
             "\A3\Ui_f\data\GUI\Cfg\Ranks\corporal_gs.paa",
             "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa",
             "\A3\Ui_f\data\GUI\Cfg\Ranks\lieutenant_gs.paa",
             "\A3\Ui_f\data\GUI\Cfg\Ranks\captain_gs.paa",
             "\A3\Ui_f\data\GUI\Cfg\Ranks\major_gs.paa",
             "\A3\Ui_f\data\GUI\Cfg\Ranks\colonel_gs.paa"
        ]] call AFUNC(nametags,setFactionRankIcons);

        call FUNC(setViewDistance);
    }] call CFUNC(addEventHandler);

    if (GVARMAIN(isTvT)) then {
        [QGVARMAIN(initFramework), {
            // Set side values
            [QGVAR(sideValueSet), [playerSide, 1, 1, 0]] call CFUNC(serverEvent);
        }] call CFUNC(addEventHandler);
    };

    [QGVARMAIN(deleteMarkerSide), {
        params ["_marker", "_side"];

        [_marker, _side] call FUNC(deleteMarkerSide);
    }] call CFUNC(addEventHandler);

    [QGVAR(removeCTFAction), {
        params ["_ID"];

        [player, _ID] call BFUNC(holdActionRemove);
    }] call CFUNC(addEventHandler);

    // Init chat commands
    call FUNC(registerChatCommands);
};

// Sitting EH
[QGVAR(playAnim), {
    params ["_unit", "_anim"];

    _unit switchMove _anim;
}] call CFUNC(addEventHandler);

[QGVARMAIN(initFramework), {
    call FUNC(setViewDistance);
}] call CFUNC(addEventHandler);
