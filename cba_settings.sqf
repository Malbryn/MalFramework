// ACE Advanced Ballistics
force force ace_advanced_ballistics_ammoTemperatureEnabled = true;
force force ace_advanced_ballistics_barrelLengthInfluenceEnabled = true;
force force ace_advanced_ballistics_bulletTraceEnabled = true;
force force ace_advanced_ballistics_enabled = false;
force force ace_advanced_ballistics_muzzleVelocityVariationEnabled = true;
force force ace_advanced_ballistics_simulationInterval = 0.05;

// ACE Advanced Fatigue
force force ace_advanced_fatigue_enabled = true;
force force ace_advanced_fatigue_enableStaminaBar = true;
force force ace_advanced_fatigue_loadFactor = 1;
force force ace_advanced_fatigue_performanceFactor = 1.2;
force force ace_advanced_fatigue_recoveryFactor = 1.2;
force force ace_advanced_fatigue_swayFactor = 1;
force force ace_advanced_fatigue_terrainGradientFactor = 0.8;

// ACE Advanced Throwing
force force ace_advanced_throwing_enablePickUp = true;
force force ace_advanced_throwing_enablePickUpAttached = true;

// ACE Arsenal
force force ace_arsenal_allowDefaultLoadouts = false;
force force ace_arsenal_allowSharedLoadouts = true;
force force ace_arsenal_EnableRPTLog = true;

// ACE Artillery
force force ace_artillerytables_advancedCorrections = true;
force force ace_artillerytables_disableArtilleryComputer = true;
force force ace_mk6mortar_airResistanceEnabled = true;
force force ace_mk6mortar_allowCompass = true;
force force ace_mk6mortar_allowComputerRangefinder = false;
force force ace_mk6mortar_useAmmoHandling = true;

// ACE Captives
force force ace_captives_allowHandcuffOwnSide = true;
force force ace_captives_allowSurrender = true;
force force ace_captives_requireSurrender = 1;
force force ace_captives_requireSurrenderAi = false;

// ACE Common
force force ace_common_allowFadeMusic = true;
force force ace_common_checkPBOsAction = 0;
force force ace_common_checkPBOsCheckAll = false;
force force ace_common_checkPBOsWhitelist = "[]";
force force ace_noradio_enabled = true;
force force ace_parachute_hideAltimeter = true;

// ACE Cook off
force force ace_cookoff_ammoCookoffDuration = 0.3;
force force ace_cookoff_enable = 2;
force force ace_cookoff_enableAmmobox = true;
force force ace_cookoff_enableAmmoCookoff = true;
force force ace_cookoff_probabilityCoef = 0.3;

// ACE Crew Served Weapons
force force ace_csw_ammoHandling = 1;
force force ace_csw_defaultAssemblyMode = true;
force force ace_csw_handleExtraMagazines = true;
force force ace_csw_progressBarTimeCoefficent = 1;

// ACE Explosives
force force ace_explosives_explodeOnDefuse = false;
force force ace_explosives_punishNonSpecialists = true;
force force ace_explosives_requireSpecialist = false;

// ACE Fragmentation Simulation
force force ace_frag_enabled = true;
force force ace_frag_maxTrack = 10;
force force ace_frag_maxTrackPerFrame = 10;
force force ace_frag_reflectionsEnabled = false;
force force ace_frag_spallEnabled = false;

// ACE Goggles
force force ace_goggles_effects = 2;

// ACE Hearing
force force ace_hearing_autoAddEarplugsToUnits = false;
force force ace_hearing_disableEarRinging = true;
force force ace_hearing_earplugsVolume = 0.6;
force force ace_hearing_enableCombatDeafness = false;
force force ace_hearing_enabledForZeusUnits = false;
force force ace_hearing_unconsciousnessVolume = 0.3;

// ACE Interaction
force force ace_interaction_disableNegativeRating = true;
force force ace_interaction_enableMagazinePassing = true;
force force ace_interaction_enableTeamManagement = true;

// ACE Logistics
force force ace_cargo_enable = true;
force force ace_cargo_loadTimeCoefficient = 5;
force force ace_cargo_paradropTimeCoefficent = 2.5;
force force ace_rearm_distance = 20;
force force ace_rearm_level = 0;
force force ace_rearm_supply = 0;
force force ace_refuel_hoseLength = 15;
force force ace_refuel_rate = 1;
force force ace_repair_addSpareParts = true;
force force ace_repair_autoShutOffEngineWhenStartingRepair = false;
force force ace_repair_consumeItem_toolKit = 0;
force force ace_repair_displayTextOnRepair = true;
force force ace_repair_engineerSetting_fullRepair = 0;
force force ace_repair_engineerSetting_repair = 0;
force force ace_repair_engineerSetting_wheel = 0;
force force ace_repair_fullRepairLocation = 3;
force force ace_repair_fullRepairRequiredItems = ["ToolKit"];
force force ace_repair_miscRepairRequiredItems = ["ToolKit"];
force force ace_repair_repairDamageThreshold = 0.6;
force force ace_repair_repairDamageThreshold_engineer = 0.6;
force force ace_repair_wheelRepairRequiredItems = [];

// ACE Magazine Repack
force force ace_magazinerepack_timePerAmmo = 1.5;
force force ace_magazinerepack_timePerBeltLink = 8;
force force ace_magazinerepack_timePerMagazine = 2;

// ACE Map
force force ace_map_BFT_Enabled = false;
force force ace_map_BFT_HideAiGroups = true;
force force ace_map_BFT_Interval = 1;
force force ace_map_BFT_ShowPlayerNames = false;
force force ace_map_DefaultChannel = 1;
force force ace_map_mapGlow = true;
force force ace_map_mapIllumination = true;
force force ace_map_mapLimitZoom = false;
force force ace_map_mapShake = true;
force force ace_map_mapShowCursorCoordinates = false;
force force ace_markers_moveRestriction = 5;

// ACE Map Gestures
force force ace_map_gestures_enabled = true;
force force ace_map_gestures_interval = 0.03;
force force ace_map_gestures_maxRange = 8;

// ACE Medical
force force ace_medical_ai_enabledFor = 0;
force force ace_medical_AIDamageThreshold = 2;
force force ace_medical_bleedingCoefficient = 0.3;
force force ace_medical_blood_bloodLifetime = 600;
force force ace_medical_blood_enabledFor = 2;
force force ace_medical_blood_maxBloodObjects = 500;
force force ace_medical_fatalDamageSource = 2;
force force ace_medical_feedback_bloodVolumeEffectType = 2;
force force ace_medical_feedback_painEffectType = 1;
force force ace_medical_fractureChance = 0.5;
force force ace_medical_fractures = 2;
force force ace_medical_gui_enableMedicalMenu = 1;
force force ace_medical_gui_maxDistance = 4;
force force ace_medical_gui_openAfterTreatment = true;
force force ace_medical_ivFlowRate = 2;
force force ace_medical_limping = 1;
force force ace_medical_painCoefficient = 1;
force force ace_medical_playerDamageThreshold = 2;
force force ace_medical_spontaneousWakeUpChance = 0.5;
force force ace_medical_spontaneousWakeUpEpinephrineBoost = 30;
force force ace_medical_statemachine_AIUnconsciousness = true;
force force ace_medical_statemachine_cardiacArrestTime = 1;
force force ace_medical_statemachine_fatalInjuriesAI = 0;
force force ace_medical_statemachine_fatalInjuriesPlayer = 2;
force force ace_medical_treatment_advancedBandages = 2;
force force ace_medical_treatment_advancedDiagnose = true;
force force ace_medical_treatment_advancedMedication = true;
force force ace_medical_treatment_allowLitterCreation = true;
force force ace_medical_treatment_allowSelfIV = 1;
force force ace_medical_treatment_allowSelfPAK = 1;
force force ace_medical_treatment_allowSelfStitch = 1;
force force ace_medical_treatment_allowSharedEquipment = 1;
force force ace_medical_treatment_clearTraumaAfterBandage = false;
force force ace_medical_treatment_consumePAK = 0;
force force ace_medical_treatment_consumeSurgicalKit = 0;
force force ace_medical_treatment_convertItems = 0;
force force ace_medical_treatment_cprSuccessChance = 0.5;
force force ace_medical_treatment_holsterRequired = 0;
force force ace_medical_treatment_litterCleanupDelay = 600;
force force ace_medical_treatment_locationEpinephrine = 0;
force force ace_medical_treatment_locationPAK = 0;
force force ace_medical_treatment_locationsBoostTraining = false;
force force ace_medical_treatment_locationSurgicalKit = 0;
force force ace_medical_treatment_maxLitterObjects = 500;
force force ace_medical_treatment_medicEpinephrine = 0;
force force ace_medical_treatment_medicIV = 1;
force force ace_medical_treatment_medicPAK = 1;
force force ace_medical_treatment_medicSurgicalKit = 1;
force force ace_medical_treatment_timeCoefficientPAK = 1;

// ACE Name Tags
force force ace_nametags_playerNamesMaxAlpha = 0.8;
force force ace_nametags_playerNamesViewDistance = 12;
force force ace_nametags_showCursorTagForVehicles = false;

// ACE Nightvision
force force ace_nightvision_aimDownSightsBlur = 0.1;
force force ace_nightvision_disableNVGsWithSights = false;
force force ace_nightvision_effectScaling = 0.3;
force force ace_nightvision_fogScaling = 0;
force force ace_nightvision_noiseScaling = 0.3;
force force ace_nightvision_shutterEffects = false;

// ACE Overheating
force force ace_overheating_enabled = true;
force force ace_overheating_overheatingDispersion = true;
force force ace_overheating_unJamFailChance = 0;
force force ace_overheating_unJamOnreload = false;

// ACE Pointing
force force ace_finger_enabled = true;
force force ace_finger_maxRange = 4;

// ACE Pylons
force force ace_pylons_enabledForZeus = true;
force force ace_pylons_enabledFromAmmoTrucks = true;
force force ace_pylons_rearmNewPylons = false;
force force ace_pylons_requireEngineer = false;
force force ace_pylons_requireToolkit = false;
force force ace_pylons_searchDistance = 15;
force force ace_pylons_timePerPylon = 5;

// ACE Quick Mount
force force ace_quickmount_distance = 3;
force force ace_quickmount_enabled = true;
force force ace_quickmount_speed = 18;

// ACE Respawn
force force ace_respawn_removeDeadBodiesDisconnected = true;
force force ace_respawn_savePreDeathGear = false;

// ACE Scopes
force force ace_scopes_correctZeroing = true;
force force ace_scopes_deduceBarometricPressureFromTerrainAltitude = false;
force force ace_scopes_defaultZeroRange = 100;
force force ace_scopes_enabled = true;
force force ace_scopes_forceUseOfAdjustmentTurrets = false;
force force ace_scopes_overwriteZeroRange = false;
force force ace_scopes_simplifiedZeroing = false;
force force ace_scopes_useLegacyUI = false;
force force ace_scopes_zeroReferenceBarometricPressure = 1013.25;
force force ace_scopes_zeroReferenceHumidity = 0;
force force ace_scopes_zeroReferenceTemperature = 15;

// ACE Spectator
force force ace_spectator_enableAI = false;
force force ace_spectator_maxFollowDistance = 10;
force force ace_spectator_restrictModes = 4;
force force ace_spectator_restrictVisions = 3;

// ACE Switch Units
force force ace_switchunits_enableSafeZone = true;
force force ace_switchunits_enableSwitchUnits = false;
force force ace_switchunits_safeZoneRadius = 100;
force force ace_switchunits_switchToCivilian = false;
force force ace_switchunits_switchToEast = false;
force force ace_switchunits_switchToIndependent = false;
force force ace_switchunits_switchToWest = false;

// ACE Uncategorized
force force ace_fastroping_requireRopeItems = false;
force force ace_gforces_enabledFor = 1;
force force ace_hitreactions_minDamageToTrigger = 0.1;
force force ace_laser_dispersionCount = 2;
force force ace_microdagr_mapDataAvailable = 2;
force force ace_microdagr_waypointPrecision = 3;
force force ace_overpressure_distanceCoefficient = 1;

// ACE User Interface
force force ace_ui_allowSelectiveUI = true;
force force ace_ui_soldierVehicleWeaponInfo = true;

// ACE Vehicle Lock
force force ace_vehiclelock_defaultLockpickStrength = 10;
force force ace_vehiclelock_lockVehicleInventory = false;
force force ace_vehiclelock_vehicleStartingLockState = -1;

// ACE Vehicles
force force ace_vehicles_keepEngineRunning = true;

// ACE View Distance Limiter
force force ace_viewdistance_enabled = false;
force force ace_viewdistance_limitViewDistance = 10000;
force force ace_viewdistance_objectViewDistanceCoeff = 0;
force force ace_viewdistance_viewDistanceAirVehicle = 0;
force force ace_viewdistance_viewDistanceLandVehicle = 0;
force force ace_viewdistance_viewDistanceOnFoot = 0;

// ACE Weapons
force force ace_laserpointer_enabled = true;

// ACE Weather
force force ace_weather_enabled = true;
force force ace_weather_updateInterval = 60;
force force ace_weather_windSimulation = false;
force force ace_weather_enableServerController = true;
force force ace_weather_useACEWeather = false;
force force ace_weather_syncRain = false;
force force ace_weather_syncWind = false;
force force ace_weather_syncMisc = false;
force force ace_weather_serverUpdateInterval = 60;

// ACE Wind Deflection
force force ace_winddeflection_enabled = true;
force force ace_winddeflection_simulationInterval = 0.05;
force force ace_winddeflection_vehicleEnabled = true;

// ACE Zeus
force force ace_zeus_autoAddObjects = true;
force force ace_zeus_canCreateZeus = 1;
force force ace_zeus_radioOrdnance = false;
force force ace_zeus_remoteWind = false;
force force ace_zeus_revealMines = 0;
force force ace_zeus_zeusAscension = false;
force force ace_zeus_zeusBird = false;

/*
// ASR AI3
force force asr_ai3_control_onteamswitchleader = true;
force force asr_ai3_danger_AD_INSIDE = 50;
force force asr_ai3_danger_AD_OUTSIDE = 300;
force force asr_ai3_danger_ADVANCED_COVER = true;
force force asr_ai3_danger_ATTACK_TIMER = 30;
force force asr_ai3_danger_AUTO_ATTACK_WITHIN = 150;
force force asr_ai3_danger_COUNTER_ATTACK = false;
force force asr_ai3_danger_debug_findcover = false;
force force asr_ai3_danger_debug_reveal = false;
force force asr_ai3_danger_getinweapons = 0.33;
force force asr_ai3_danger_MAX_DIST_TO_COVER = 50;
force force asr_ai3_danger_NO_COVER_FOR_DANGER_WITHIN = 50;
force force asr_ai3_danger_radiorange = 0;
force force asr_ai3_danger_rrdelaymin = 5;
force force asr_ai3_danger_rrdelayplus = 10;
force force asr_ai3_danger_seekcover = true;
force force asr_ai3_danger_usebuildings = 0.8;
force force asr_ai3_hitreactions_fallDown = true;
force force asr_ai3_hitreactions_STAY_IN_VEH = true;
force force asr_ai3_incognito_incodbg = false;
force force asr_ai3_incognito_incodiff = 0;
force force asr_ai3_incognito_incohint = false;
force force asr_ai3_main_factionskip_str = "['LOP_AFR_Civ','LOP_CHR_Civ','LOP_TAK_Civ']";
force force asr_ai3_rearming_debug_rearm = false;
force force asr_ai3_rearming_rearm = 100;
force force asr_ai3_rearming_rearm_fak = 1;
force force asr_ai3_rearming_rearm_mags = 1;
force force asr_ai3_skills_debug_setcamo = false;
force force asr_ai3_skills_debug_setskill = false;
force force asr_ai3_skills_packNVG = true;
force force asr_ai3_skills_setskills = true;
force force asr_ai3_skills_teamsuperai = true;
*/

/*
// DUI - Squad Radar - Indicators
force force diwako_dui_indicators_range = 20;

// DUI - Squad Radar - Radar
force force diwako_dui_compassRange = 35;
force force diwako_dui_enable_occlusion = true;
force force diwako_dui_radar_occlusion_fade_time = 10;
force force diwako_dui_radar_sortType = "fireteam";
force force diwako_dui_radar_sqlFirst = true;
force force diwako_dui_enable_compass_dir = 1;
*/


/*
// LAxemann's Suppress
force force L_Suppress_buildup = 2;
force force L_Suppress_enabled = true;
force force L_Suppress_flyByEffects = true;
force force L_Suppress_flyByIntensity = 0.5;
force force L_Suppress_halting = true;
force force L_Suppress_intensity = 0.5;
force force L_Suppress_playerSwabEnabled = false;
force force L_Suppress_recovery = 2;
*/


// TFAR - Global settings
force force TFAR_AICanHearPlayer = false;
force force TFAR_AICanHearSpeaker = false;
force force TFAR_allowDebugging = true;
force force TFAR_curatorCamEars = true;
force force TFAR_defaultIntercomSlot = 0;
force force TFAR_enableIntercom = true;
force force TFAR_experimentalVehicleIsolation = true;
force force TFAR_fullDuplex = true;
force force TFAR_giveLongRangeRadioToGroupLeaders = false;
force force TFAR_giveMicroDagrToSoldier = false;
force force TFAR_givePersonalRadioToRegularSoldier = false;
force force TFAR_globalRadioRangeCoef = 1;
force force TFAR_instantiate_instantiateAtBriefing = false;
force force TFAR_noAutomoveSpectator = false;
force force TFAR_objectInterceptionEnabled = true;
force force TFAR_objectInterceptionStrength = 400;
force force tfar_radiocode_east = "_opfor";
force force tfar_radiocode_independent = "_independent";
force force tfar_radiocode_west = "_bluefor";
force force tfar_radioCodesDisabled = true;
force force TFAR_SameLRFrequenciesForSide = true;
force force TFAR_SameSRFrequenciesForSide = true;
force force TFAR_setting_defaultFrequencies_lr_east = "69,68,67,66,65,64,63,62,70";
force force TFAR_setting_defaultFrequencies_lr_independent = "69,68,67,66,65,64,63,62,70";
force force TFAR_setting_defaultFrequencies_lr_west = "69,68,67,66,65,64,63,62,70";
force force TFAR_setting_defaultFrequencies_sr_east = "110,120,130,140,150,160,170,180,190";
force force TFAR_setting_defaultFrequencies_sr_independent = "110,120,130,140,150,160,170,180,190";
force force TFAR_setting_defaultFrequencies_sr_west = "110,120,130,140,150,160,170,180,190";
force force TFAR_setting_DefaultRadio_Airborne_east = "TFAR_mr6000l";
force force TFAR_setting_DefaultRadio_Airborne_Independent = "TFAR_anarc164";
force force TFAR_setting_DefaultRadio_Airborne_West = "TFAR_anarc210";
force force TFAR_setting_DefaultRadio_Backpack_east = "TFAR_mr3000";
force force TFAR_setting_DefaultRadio_Backpack_Independent = "TFAR_anprc155";
force force TFAR_setting_DefaultRadio_Backpack_west = "TFAR_rt1523g";
force force TFAR_setting_DefaultRadio_Personal_east = "TFAR_fadak";
force force TFAR_setting_DefaultRadio_Personal_Independent = "TFAR_anprc154";
force force TFAR_setting_DefaultRadio_Personal_West = "TFAR_anprc152";
force force TFAR_setting_DefaultRadio_Rifleman_East = "TFAR_fadak";
force force TFAR_setting_DefaultRadio_Rifleman_Independent = "TFAR_anprc154";
force force TFAR_setting_DefaultRadio_Rifleman_West = "TFAR_anprc152";
force force TFAR_spectatorCanHearEnemyUnits = false;
force force TFAR_spectatorCanHearFriendlies = true;
force force TFAR_takingRadio = 1;
force force TFAR_Teamspeak_Channel_Name = "TaskForceRadio";
force force TFAR_Teamspeak_Channel_Password = "123";
force force tfar_terrain_interception_coefficient = 7;
force force TFAR_voiceCone = true;
force force TFAR_ShowDiaryRecord = false;


/*
// IFA3 Liberation
force force ifa3_plane_Script_cba_eng = true;
force force ifa3_plane_Script_cba_fuel = true;
force force ifa3_plane_Script_cba_start = false;
force force ifa3_screams_cba_death = true;
force force ifa3_screams_cba_hit_blue = true;
force force ifa3_screams_cba_hit_green = true;
force force ifa3_screams_cba_hit_red = true;
force force ifa3_tank_Script_cba_ammo = true;
force force ifa3_tank_Script_cba_fire_car = true;
force force ifa3_tank_Script_cba_start = false;
force force ifa3lib_compass_init = false;
force force ifa3lib_damage_cba_kontuzia_gr = true;
force force ifa3lib_damage_cba_kontuzia_ofc = true;
force force ifa3lib_tank_cba_crew_ai = true;
force force ifa3lib_tank_cba_crew_player = true;
force force ifa3lib_tank_cba_engine = true;
force force ifa3lib_tank_cba_fuel = true;
force force ifa3lib_tank_cba_radio = false;
force force ifa3lib_tank_cba_trans = true;
*/


/*
// LAMBS Danger
force force lambs_danger_autoAddArtillery = false;
force force lambs_danger_CQB_formations_COLUMN = false;
force force lambs_danger_CQB_formations_DIAMOND = true;
force force lambs_danger_CQB_formations_ECH LEFT = false;
force force lambs_danger_CQB_formations_ECH RIGHT = false;
force force lambs_danger_CQB_formations_FILE = true;
force force lambs_danger_CQB_formations_LINE = false;
force force lambs_danger_CQB_formations_STAG COLUMN = false;
force force lambs_danger_CQB_formations_VEE = false;
force force lambs_danger_CQB_formations_WEDGE = false;
force force lambs_danger_CQB_range = 100;
force force lambs_danger_debug_Drawing = false;
force force lambs_danger_debug_FSM = false;
force force lambs_danger_debug_FSM_civ = false;
force force lambs_danger_debug_functions = false;
force force lambs_danger_disableAIAutonomousManoeuvres = false;
force force lambs_danger_disableAICallouts = false;
force force lambs_danger_disableAIGestures = false;
force force lambs_danger_disableAIHideFromTanksAndAircraft = true;
force force lambs_danger_disableAIImediateAction = false;
force force lambs_danger_disableAIPlayerGroup = false;
force force lambs_danger_disableAIPlayerGroupReaction = false;
force force lambs_danger_disableAIPlayerGroupSuppression = false;
force force lambs_danger_minSuppression_range = 15;
force force lambs_danger_panic_chance = 1;
force force lambs_danger_radio_backpack = 2000;
force force lambs_danger_radio_disabled = false;
force force lambs_danger_radio_EAST = 500;
force force lambs_danger_radio_GUER = 500;
force force lambs_danger_radio_shout = 50;
force force lambs_danger_radio_WEST = 500;
force force lambs_danger_RenderExpectedDestination = false;



// LAMBS Danger Eventhandlers
force force lambs_eventhandlers_ExplosionEventHandlerEnabled = true;
force force lambs_eventhandlers_ExplosionReactionTime = 9;
*/


/*
// VET_Unflipping
force force vet_unflipping_require_serviceVehicle = false;
force force vet_unflipping_require_toolkit = false;
force force vet_unflipping_time = 8;
force force vet_unflipping_unit_man_limit = 3;
force force vet_unflipping_unit_mass_limit = 3000;
force force vet_unflipping_vehicle_mass_limit = 100000;
*/


/*
// VCOM SETTINGS
force force VCM_ActivateAI = true;
force force VCM_ADVANCEDMOVEMENT = true;
force force VCM_AIDISTANCEVEHPATH = 0;
force force VCM_AIMagLimit = 2;
force force VCM_AISNIPERS = true;
force force VCM_AISUPPRESS = true;
force force VCM_ARTYDELAY = 30;
force force VCM_ARTYENABLE = false;
//force force VCM_ARTYSIDES = [WEST,EAST,GUER];
force force VCM_CARGOCHNG = true;
force force VCM_ClassSteal = false;
force force VCM_Debug = false;
force force VCM_DISEMBARKRANGE = 150;
force force Vcm_DrivingActivated = false;
force force VCM_ForceSpeed = true;
force force VCM_FRMCHANGE = true;
force force VCM_HEARINGDISTANCE = 500;
force force VCM_MINECHANCE = 0;
force force Vcm_PlayerAISkills = true;
force force VCM_RAGDOLL = true;
force force VCM_RAGDOLLCHC = 75;
//force force VCM_SIDEENABLED = [WEST,EAST,GUER];
force force VCM_SKILLCHANGE = true;
force force VCM_STATICARMT = 300;
force force VCM_StealVeh = false;
force force VCM_TURRETUNLOAD = false;
force force VCM_USECBASETTINGS = true;
force force VCM_WARNDELAY = 30;
force force VCM_WARNDIST = 500;
*/
