#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Adds a restricted ACE Arsenal to an object based on the whitelist in the config.
        The added Arsenal is initialised on each client separately and the added items depend on the player's role. 

    Arguments:
        0: OBJECT - The object used as the Arsenal

    Example:
        [this] call MF_gear_fnc_addRestrictedArsenal

    Returns:
        void
*/

if (!hasInterface) exitWith {};

params [
    ["_object", objNull, [objNull]]
];

// Check input
if (isNull _object) exitWith {
    [
        COMPONENT_STR,
        "ERROR",
        "The arsenal object does not exist",
        true,
        1
    ] call EFUNC(main,log);
};

// Add object to the array so we can use it in PostInit
// PostInit is needed to make sure the player's role is initialised
GVAR(arsenalObjects) pushBackUnique _object;
