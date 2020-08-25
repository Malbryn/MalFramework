#include "script_component.hpp"

/*
    Author:
       DreadPirate (modified by Malbryn)

    Description:
        Kills the crew of an aircraft when they decide to bail out.
        Prevents long respawn waits when aircraft crash far from the battlefield.

    Arguments:
        -

    Example:
        call MF_ai_spawner_fnc_pilotKill

    Returns:
        void
*/

if !(isServer) exitWith {};

params ["_pilot", ["_debug", false]];

private _aircraft = vehicle _pilot;
private _crew = crew _aircraft;
private _group = group (_crew#0);

if (_debug) then {
    MSG_1("DEBUG","%1 - Jebus Pilot Kill",_group);
};

waitUntil {!canMove _aircraft};

if (_debug) then {
    MSG_1("DEBUG","%1 - Killing crew",_group);
};	

{deleteVehicle _x} foreach _crew;
