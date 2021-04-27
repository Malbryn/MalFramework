#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Checks if the player can remove a RP (is SL and it's their squad's RP).

    Arguments:
        0: OBJECT - The RP object

    Example:
        [this] call MF_reinsertion_fnc_canRemoveRP

    Returns:
        BOOLEAN
*/

if !(hasInterface) exitWith {};

params [["_obj", objNull]];

// Check if player is SL
if !(GETVAR(player,EGVAR(player,isSL),false)) exitWith { false };

// Check if RP exists and if it's the correct one
private _id = GETVAR((group player),GVAR(RPTent),nil);
private _RPTent = objectFromNetId _id;

if (isNil "_id" || _RPTent isNotEqualTo _obj) exitWith { false };

true
