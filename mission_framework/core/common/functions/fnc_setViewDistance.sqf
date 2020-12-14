#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Sets the view distance of the player or server.

    Arguments:
        -

    Example:
        call MF_common_fnc_setViewDistance

    Returns:
        void
*/

if (hasInterface) then {
    private _viewDistance = GETVAR(player,GVAR(viewDistance),-1);

    if (_viewDistance == -1) then {
        // Default view distance in config.sqf
        _viewDistance = GVARMAIN(playerViewDistance);
        setViewDistance _viewDistance;
    } else {
        // Custom view distance defined in unit init
        setViewDistance _viewDistance;
    };
};

if (isDedicated) then {
    setViewDistance GVARMAIN(serverViewDistance);
};
