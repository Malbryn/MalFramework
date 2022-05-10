#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Creates a hash map from the given loadout array.

    Arguments:
        0: ARRAY - Loadout array containing key-value pairs

    Example:
    [[
        ["SL", ["SL-2", "SL-3"]],
        ["AR", ["AR-2"]]
    ]] call MF_gear_fnc_createLoadoutHashMap

    Returns:
        void
*/

params [
    ["_array", [], [[]]]
];

if (count _array == 0) then {
    [
        COMPONENT_STR,
        "WARNING",
        "The loadout HashMap is using empty values",
        true,
        1
    ] call EFUNC(main,log);
};

GVAR(loadoutHashParsed) = createHashMapFromArray _array;
