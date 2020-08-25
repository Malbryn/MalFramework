#include "script_component.hpp"

/*
    Author:
       DreadPirate (modified by Malbryn)

    Description:
        Deletes a group.

    Arguments:
        0: GROUP - The group to delete

    Example:
        [myGroup] call MF_ai_spawner_fnc_deleteGroup

    Returns:
        void
*/

if !(isServer) exitWith {};

params ["_group"];

{
    deleteVehicle (vehicle _x); 
    deleteVehicle _x
} forEach units (_group);

deleteGroup _group;
