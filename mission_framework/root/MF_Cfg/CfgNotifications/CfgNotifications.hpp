class IncomingQRF {
    title = "Incoming enemy QRF";  // Title displayed as text on black background. Filled by arguments.
    iconPicture = "\A3\ui_f\data\Map\VehicleIcons\iconTruck_ca.paa";  // Small icon displayed in left part. Colored by "color", filled by arguments.
    iconText = "";  // Short text displayed over the icon. Colored by "color", filled by arguments.
    description = "An enemy QRF was spotted heading to your direction";  // Brief description displayed as structured text. Colored by "color", filled by arguments.
    color[] = {1, 1, 1, 1};  // Icon and text color
    duration = 5;  // How many seconds will the notification be displayed
    priority = 3;  // Priority; higher number = more important; tasks in queue are selected by priority
    difficulty[] = {};  // Required difficulty settings. All listed difficulties has to be enabled
};

class Warning {
    title = "WARNING";
    iconPicture = "\A3\ui_f\data\Map\Markers\Military\warning_CA.paa";
    iconText = "";
    description = "%1";
    color[] = {1, 0, 0, 1};
    duration = 7;
    priority = 5;
    difficulty[] = {};
};

class JipTeleport {
    title = "JIP";
    iconPicture = "\A3\ui_f\data\GUI\Cfg\Hints\Timing_ca.paa";
    iconText = "";
    description = "Join In Progress: Use self-interaction to TP back to your squad";
    color[] = {1, 1, 1, 1};
    duration = 10;
    priority = 4;
    difficulty[] = {};
};
