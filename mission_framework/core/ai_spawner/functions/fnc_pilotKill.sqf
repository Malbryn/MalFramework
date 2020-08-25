#include "script_component.hpp"

/*
    Author:
       DreadPirate (modified by Malbryn)

    Description:
        Kills the crew of an aircraft when they decide to bail out.
        Prevents long respawn waits when aircraft crash far from the battlefield.

    Arguments:
        0: OBJECT - The pilot unit

    Example:
        [pilot] call MF_ai_spawner_fnc_pilotKill

    Returns:
        void
*/

if !(isServer) exitWith {};

params ["_pilot"];

private _aircraft = vehicle _pilot;
private _crew = crew _aircraft;
private _group = group (_crew#0);

waitUntil {!canMove _aircraft};

{deleteVehicle _x} foreach _crew;
