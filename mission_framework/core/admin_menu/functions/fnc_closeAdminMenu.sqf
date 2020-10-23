#include "script_component.hpp"

/*
    Author:
        Malbryn

    Description:
        Closes the Admin menu dialog.

    Arguments:
        -

    Example:
        call MF_admin_menu_fnc_closeAdminMenu

    Returns:
        void
*/

if !(hasInterface) exitWith {};

// Stop PFH's
[GVAR(timeStatsPFH)] call FUNC(removePerFrameHandler);
[GVAR(otherStatsPFH)] call FUNC(removePerFrameHandler);

// Enable ESC key
(findDisplay 799) displayRemoveEventHandler ["KeyDown", GVAR(escKeyBlock)];

// Close dialog
closeDialog 1;
