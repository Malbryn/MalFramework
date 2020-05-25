#include "..\script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Initialise the custom event handlers

    Arguments:
        -

    Example:
        call MF_main_fnc_initCustomEHs

    Returns:
        void
*/

[{(!isNull (findDisplay 46) && CBA_missionTime > 1)}, {
    [QGVARMAIN(initFramework), []] call CFUNC(localEvent);
}] call CFUNC(waitUntilAndExecute);


[QGVARMAIN(systemMessage), {
    params ["_level", "_message"];
    
    MSG(_level,_message);
}] call CFUNC(addEventHandler);
