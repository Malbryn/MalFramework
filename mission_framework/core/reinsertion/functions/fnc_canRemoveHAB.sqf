#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Checks if the player can remove a HAB (is CO).

    Arguments:
        0: OBJECT - The HAB object

    Example:
        [this] call MF_reinsertion_fnc_canRemoveHAB

    Returns:
        BOOLEAN
*/

if !(hasInterface) exitWith {};

params [["_obj", objNull]];

// Check if player is CO
if !(GETVAR(player,EGVAR(player,isCO),false)) exitWith { false };

// Check if HAB exists and if it's the correct one
private _id = GETMVAR(GVAR(HAB),nil);
private _HAB = objectFromNetId _id;

!isNil "_id" && {_HAB isEqualTo _obj}
