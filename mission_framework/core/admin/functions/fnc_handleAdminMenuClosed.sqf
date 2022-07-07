#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Closes the Admin menu dialog.

    Arguments:
        -

    Example:
        call MF_admin_fnc_handleAdminMenuClosed

    Returns:
        void
*/

if !(hasInterface) exitWith {};

// Stop PFH's
[GVAR(timeStatsPFH)] call CFUNC(removePerFrameHandler);
[GVAR(otherStatsPFH)] call CFUNC(removePerFrameHandler);

// Enable ESC key
(findDisplay 799) displayRemoveEventHandler ["KeyDown", GVAR(escKeyBlock)];

// Close dialog
closeDialog 1;
