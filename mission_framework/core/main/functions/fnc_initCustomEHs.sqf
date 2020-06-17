#include "..\script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Initialises the custom event handlers

    Arguments:
        -

    Example:
        call MF_main_fnc_initCustomEHs

    Returns:
        void
*/

// Mission start on client and on server
if (hasInterface) then {
    [{(!isNull (findDisplay 46) && CBA_missionTime > 1)}, {
        [QGVARMAIN(initFramework), []] call CFUNC(localEvent);
    }] call CFUNC(waitUntilAndExecute);
} else {
    [{CBA_missionTime > 1}, {
        [QGVARMAIN(initFramework), []] call CFUNC(localEvent);
    }] call CFUNC(waitUntilAndExecute);
};

// Remote messages
[QGVARMAIN(systemMessage), {
    params ["_level", "_message"];
    
    MSG(_level,_message);
}] call CFUNC(addEventHandler);

// Remote notification
[QGVARMAIN(notification_1), {
    params ["_cat"];
    
    [_cat] call BFUNC(showNotification);
}] call CFUNC(addEventHandler);

// Remote notification
[QGVARMAIN(notification_2), {
    params ["_cat", "_message"];
    
    [_cat, [_message]] call BFUNC(showNotification);
}] call CFUNC(addEventHandler);
