/*
battleMETAL
Author: Peter Roohr
Date: 1/26/2018
mod: 07/23/2019
Overview: 
  all the miscellaneous shared values between client and server.
*/

void( ) FRIK_FILE_precaches =
{
	local float f;                                      // file handle, basically assigns a number to whatever file is open
	local string ln;                                    // ln = line of the file being read
	f = fopen("cache/precache_server.txt" , FILE_READ);        // opens "data/precache.txt" to be read
	if (f != -1){                                        // if f = -1 then the file could not be found
		ln = fgets(f);                              // this line sets ln to the string read from the file with the file handle of f
    
    while( ln != "EOF" ){                     // while there is still text to be read do the following
      if( cvar("developer") ){
        dprint(strcat("line value (",ln,")\n"));  //DEBUG
      }
      if( ln != "" && substring(ln,0, 2) != "//" ){
        if( cvar("developer") ){
          dprint(strcat("loaded [",ln,"]\n"));  //DEBUG
        }
        if(strstrofs(ln, ".wav",0) != -1)   // this checks if the file extension is .wav for a sound file
        {
          precache_sound(ln);         // if it is a sound, then it precaches said sound
        }
        else if(strstrofs(ln, ".ogg",0) != -1){
          precache_sound(ln);
        }
        else if(strstrofs(ln, ".md3",0) != -1){
          precache_model(ln);         // so precache the model
        }
        else if( strstrofs(ln, ".obj", 0) != -1){
          precache_model(ln);
        }
        else if( strstrofs(ln, ".bsp", 0) != -1){
          precache_file(ln);
        }
      }
			ln = fgets(f);                      // get a new line from the file
		}
    fclose(f);                                          // when the while loop is over (no lines left in file) close file with the handle f    
	} 
};
//============================
//   FILE PATHS           
//============================
#ifdef CSQC
string MAP_NAME;  //strips mapname global of junk
float UNLOCKED_MECHS[256];
#endif
string PATH_DATA_MAP = "maps/";
string PATH_DATA_ANIM = "anim";
string PATH_DATA_SAVE = "saves";
string PATH_DATA_UI = "ui";
string NEWLINE = "\n";
#ifdef SSQC
float FLAG_NEWGAME;
#endif
//globals
string SAVE_FILE_NAME = "save_"; //bake this in cause the name shouldnt change
#ifdef SSQC
string SAVE_MAP;
string SAVE_MECHS_LIST;
string SAVE_ITEMS_ALL;
#endif
string SAVE_FILE_EXT = ".sav";

//file tags
string SAVE_FILE_MSN_NAME = "mission";
string SAVE_FILE_MECH_LIST = "mechs";
string SAVE_FILE_ITEMS = "items";
string SAVE_FILES_POINTS = "points";
string SAVE_FILE_NEWGAME = "newgame";

//============================
//   GAME MODES
//============================
float GAMEMODE_CAMPAIGN = 1;
float GAMEMODE_COOP = 2;
float GAMEMODE_DM = 3;
float GAMEMODE_TEAMDM = 4;

float TEAM_SURVEST_TOTAL;  //team deathmatch
float TEAM_MILITAR_TOTAL;

//Server Mission Status
float MISSION_STATUS_READY    = 1;  //server ready to start when the first player connects
float MISSION_STATUS_ACTIVE   = 2;  //server is running as normal
float MISSION_STATUS_OVER     = 3;  //sv_checkrules() hit, triggering server end func
float MISSION_STATUS_ENDING   = 4;  //
float MISSION_STATUS_DONE     = 5;
//Server Mission Results
float MISSION_RESULT_WIN      = 1;
float MISSION_RESULT_FAIL     = 2;
float MISSION_RESULT_WIN1     = 3;
float MISSION_RESULT_WIN2     = 4;
float MISSION_RESULT_STALEMATE= 5;

float SERVER_RESPAWN_COOL_CAMP = 5;
float SERVER_RESPAWN_COOL_DM = 15;
float SERVER_RESPAWN_COOL_COOP = 7;
float SERVER_SCORE_TIME_DM = 30;
float SERVER_SCORE_TIME_COOP = 30;

//Multiplayer Server Flags
float SVFLAG_SPAWNFAR   = 1;  //  pawn player farthest from other players
float SVFLAG_POWERUP    = 2;  //  enforce powerup sequence
float SVFLAG_CHEATS     = 4;  //  cheaty cheat pants
float SVFLAG_FIREON     = 8;  //  friendly fire on
float SVFLAG_NOLIVES    = 16; //  limited lives
float SVFLAG_NOMAP      = 32; //  only see yourself on tac map
float SVFLAG_NORADAR    = 64; //  no radar allowed
float SVFLAG_NOSTATUS   = 128; // hide player status in menus
float SVFLAG_ITEMOVER   = 256; //used when world.itemOverride = 1; tells game to load the override file
float SVFLAG_NOSAVE     = 512; //used when world.ignoreSave = 1; tells game to NOT save any progress to save file, world.animaticOnly will also trigger this!
float SVFLAG_FPSONLY    = 1024; //disables third person / chase_active commands.

//============================
//   GAME DIFFICULTY
//============================
float SKILL_NOV = 0;
float SKILL_REG = 1;
float SKILL_VET = 2;
float SKILL_ELT = 3;
//============================
//   WORLD TYPES
//============================
float WORLD_DESERT = 0;
float WORLD_BADLND = 1;
float WORLD_URBAN = 2;
float WORLD_TUNDRA = 3;
float WORLD_ICE = 4;
float WORLD_CAVE = 5;
//============================
//   PARTICLE CUBE DENSITY RATIO - .Maxs_x / _VALUE
//============================
float SHIELD_SMALL = 84;
float SHIELD_MEDIUM = 200;
float SHIELD_LARGE = 400;

float RAD_SMALL = 64;
float RAD_MEDIUM = 128;
float RAD_LARGE = 256;

float QUAN_SMALL = 256;
float QUAN_MEDIUM = 512;
float QUAN_LARGE = 1024;
//============================
//   OBJECTIVE STATE
//============================
float OBJECTIVE_DISABLE = 0;
float OBJECTIVE_ACTIVE = 1;
float OBJECTIVE_WIN = 2;
float OBJECTIVE_COMPLETE = 3;
float OBJECTIVE_FAIL = 4;
//============================
//   PLAYER STATE ID's           
//============================
//used for client-state syncing between server and client
float PLAYER_CONNECT        = 0;  // Client just connected to server.
float PLAYER_SPAWN          = 1;  // Client has been initialized, and spawned in as observer.
float PLAYER_BRIEF          = 2;  // Client entered the main CSQC menu system.
float PLAYER_DEAD           = 3;  // player has been killed in combat.
float PLAYER_REDEPLOY       = 4;  // player use ClientKill().
float PLAYER_RESPAWN        = 5;  // player is ready to respawn from being dead.
float PLAYER_DEBRIEF        = 6;  // player has finished a campaign mission.
float PLAYER_INTERMSN       = 7; // Client has entered an intermission event.
float PLAYER_MENU           = 8;  //dear galaxy, why is it so hard to summon the main menu via code? >:(

float PLAYER_ANIM_STOP      = 9;  // Client told to stop playing animatic.
float PLAYER_POWERUP_BEGIN  = 10;  // Client has spawned into their mech, and the mech is powering up.
float PLAYER_POWERUP_END    = 11;  // Client mech has completed powerup sequence.
float PLAYER_ACTIVE         = 12;  // Client is controlling mech, and may move/fire freely.
float PLAYER_SPRINT_ON      = 13;

float MOVE_STAND            = 0;  
float MOVE_DEAD             = 1;  //
float MOVE_NORM             = 2;  //normal walking without +button8
float MOVE_SPRINT           = 3;  // Client has engaged the 'sprint' 
float MOVE_RAM_ON           = 4;
float MOVE_RAM_CHARGE       = 5;
float MOVE_RAM_COOL         = 6;

//MOVE / UNIT DATA MODALS as bitflags
//float MOVE_STAND            = 0;  //  declared in AI API
float MV_DEAD = 1;
float MV_NORM = 2;
float MV_SPRINT = 4;
float MV_RAM_ON = 8;
float MV_RAM_CHARGE = 16;
float MV_RAM_COOL = 32;
float MV_CHASE_ON = 64;
float MV_RADAR_ACTIVE = 128;
//float MOVE_DEAD = 256;
//============================
//         DATA_TYPE           
//============================
float GAME_TOTAL_MECHS = 256; //how many distinct mechs the game should assume might exist for UI / unit data purposes
float GAME_TOTAL_ITEMS = 64; //how many distinct mechs the game should assume might exist for UI / unit data purposes
  //don't mess with this really unless...no just don't mess with it.
string DATA = "data";
float DATA_POBS       = 1; //player observer mode
float DATA_MECH       = 2;
float DATA_VEHC       = 3;
float DATA_WEPN       = 4;
float DATA_PROJ       = 5;
float DATA_HUD        = 6;
float DATA_BLD        = 7;
float DATA_NAVP       = 8;
float DATA_OBJT       = 9;
float DATA_NODE       = 10;
float DATA_DEPL       = 11;
float DATA_WEAPON     = 12;
float DATA_INFO_START = 13;//used to send clientdata entity to csqc
float DATA_INFO_COOP  = 14;  //used as ID for info_start_coop
float DATA_MAP_DMG    = 15;
float DATA_MAP_RULES  = 16;

//============================
//     UNIT PART BITS          
//============================
//These should have been floats from the start
//these are component id's (compid) for model pieces
string MECH_PIECE    = "mech_piece";
float M_UNIT        = 1;
float M_TOR_CENTER  = 2;
float M_TOR_RIGHT   = 4;
float M_TOR_LEFT    = 8;
float M_ARM_LEFT    = 16;
float M_ARM_RIGHT   = 32;
float M_LEGS        = 64;
float M_REPAIR      = 128;//sends repair flag over network to repair pieces
float M_ITEM        = 256;
//============================
//     WEAPON SLOT BITS           
//============================
float WEAPON1 = 1;
float WEAPON2 = 2;
float WEAPON3 = 4;
float WEAPON4 = 8;
float WEAPON5 = 16;
float WEAPON6 = 32;
float WEAPON7 = 64;
float WEAPON8 = 128;
float WEAPON9 = 256;
//============================
//     COMBAT STATS
//============================
float POSITION_FADE_TIME = 1;
float MAX_VEHICLE_SIZE = 4;
float FALL_THRESHOLD = 200;
float FALL_DMG_MULTIPLIER = 2;
float FALL_CT_MULTIPLIER = 3;
float FALL_KILL_MULTIPLIER = 3; 
float FALL_DAMAGE_FRACTION = 0.2;
float SHIELD_DELAY = 5; //game timer to pause before shields are brought backonline
float CHAIN_FIRE_INTERVAL = 0.15;

float DMG_TORSO_CRIT_MULTI = 1.5; // t_damage() - line 124, damage multiplier when mechs have torsos destroyed.
float DMG_FRIENDLY_FIRE_REDUCE = 0.67;  // t_damage() - line 35, damage reduction for friendly fire when the flag is on.
float DMG_FRIENDLY_FIRE_REDUCE_SKILL = 0.33;

float MOVE_RAM_SCALAR_UP = 0.004;
float MOVE_RAM_SCALAR_DN = 0.01;
//============================
//     WEAPON FLAGS
//============================
//Primary Damage Types
  float DMG_BAL = 1;  //ballstic damage
  float DMG_ENE = 2;  //energy damage
  float DMG_EXP = 4;  //explosive damage
  float DMG_MSC = 8;  //used for equipment modules
//Secondary Effect Types
  float EFF_PRC = 16; //
  float EFF_RAM = 32; //
  float EFF_STX = 64; //damage only affects shields.
  float EFF_ENE = 128; //weapon draws energy (client-side flag, really)
  
  float EFF_ARC = 256;  //AI-ONLY: weapon has an arcing projectile
  float EFF_LOK = 512;  //AI-ONLY: weapon requires a target lock
  float EFF_PTR = 1024; //AI-ONLY: weapon follow's unit's laser-dot, so it ignores accuracy mechanics
  float EFF_SHD = 2048; //for when you want Shield crits but not just shield-only damage of EFF_STX (see light_laser)
//Weapon Sizes
  float BAL1 = 1;
  float BAL2 = 2;
  float BAL3 = 4;
  float BAL4 = 8;
  
  float ENE1 = 16;
  float ENE2 = 32;
  float ENE3 = 64;
  float ENE4 = 128;
  
  float MIS1 = 256;
  float MIS2 = 512;
  float MIS3 = 1024;
  float MIS4 = 2048;
  
  float MSC1 = 4096;
  float MSC2 = 8192;
  float MSC3 = 16384;
  float MSC4 = 32768;
//============================
//     GETSTAT() TYPES
//============================
float AS_STRING = 1;
float AS_FLOAT = 2;
float AS_INT = 8;
//============================
//     SEND ENTITY SHARED
//============================
//SendTypes-------------------
float SENDTYPE_PLAYER = 1;
float SENDTYPE_MECH_AI = 2;
float SENDTYPE_TANK = 3;
float SENDTYPE_SPG = 4;
float SENDTYPE_GEV = 5;
float SENDTYPE_MECH = 6;
float SENDTYPE_TURRET = 7;
float SENDTYPE_BUILD = 8;
float SENDTYPE_CHUNK = 9; //Vehicle / Turret / Mech debris
float SENDTYPE_PROJ = 10;  //projectiles - missiles, etc
float SENDTYPE_MAP = 11;
float SENDTYPE_TERRAIN = 12;
float SENDTYPE_MISC = 13;
float SENDTYPE_MISC_BLD = 14;
//SendFlags-------------------
//note: sendEnt is capped to 7 bitflags + NEWENT 
//      and uses WriteByte, to add more flags, try switching
//      to WriteShort for ChangeFlags if you want to increase total SENDFLAG size.
float SENDFLAG_MOVE     = 1;  //update .origin and .angles of main piece 
float SENDFLAG_TURRET   = 2; //unit's turret entity has rotated angle.
float SENDFLAG_VELOCITY = 4; //unit is stood up by server
float SENDFLAG_DEAD     = 8; //marks as dead, run death anim.
float SENDFLAG_CRIT     = 16; //what component(s) blew off.
float SENDFLAG_BURN     = 32; //what is starting to burn.
float SENDFLAG_IMPACT   = 64; //specifically missile strike on something.
float SENDFLAG_NEWENT   = 128;  //engine-set value, do not modify
  //128 is hardcoded as isNew, dont change
  //.modelindex
  //.faction
  //.data_type
  //.data_idx
//expanded flags, WriteByte upped to WriteLong?
float SENDFLAG_CAMERA   = 256;  //third person delta
float SENDFLAG_RADAR    = 512;  //radar mode delta
float SENDFLAG_ATTACK   = 1024; //attack trigger
float SENDFLAG_SHIELD   = 2048; //shield change delta
float SENDFLAG_ENERGY   = 4096; //energy change delta.
float SENDFLAG_TARGET   = 8192; //target change delta.
float SENDFLAG_EFLAGS   = 16384;//client .flags delta.
float SENDFLAG_COLORS   = 32768;//player changed colors
float SENDFLAG_NEWUNIT  = 65536; //players go from non-mech to mech
float SENDFLAG_EXDATA   = 131072; //any additional info an ent wants to send (usually custom per class)
float SENDFLAG_FACTION  = 262144; //this should have been its own long ago.
float SENDFLAG_ANGLE    = 524288; //specifically .angles / .v_angle 
float SENDFLAG_VOICE    = 1048576; //when an AI wants to emit a radio sound;
//============================
//     COMMON SPAWNFLAGS
//============================
float START_OFF = 1;        //only activated by trigger
float LIFETIME = 2;         //lifetime
float REACTIVATE = 4;       //reactivate after countdown
float REMOVE_FIRSTUSE = 8;  //remove after first countdown
float REMOVE_ONTOUCH = 16;  //remove on first touch

float BUILDING_TARGET_FLAG = 16;  //used by building and misc_building for allowing self to be targeted

float ACTIVE_ONTOUCH = 32;  //activate on-touch
float MUTE_ME = 1048576;    //ai ignores sending voice effects / radio sounds.
float NO_DROP = 262144; //don't drop bot/buildingto the floor onspawn
float IS_MAPKEY = 4194304;  //mark's this entity on player's briefing map.
float IS_VIP = 8388608;     //faction-allied player will be notified of this entity's state
//============================
//     SHARED STATS         
//============================
float RADAR_SWEEP = 2.5;

.float stat_rdr_mode;
#ifdef SSQC
.float playerState;
.float stat_client_energy;
.float stat_client_shield;

.float stat_target_shield;

.float stat_target_hp_torsoCenter;
.float stat_target_hp_torsoLeft;
.float stat_target_hp_torsoRight;
.float stat_target_hp_armLeft;
.float stat_target_hp_armRight;
.float stat_target_hp_legs;

.float stat_client_hp_torsoCenter;
.float stat_client_hp_torsoLeft;
.float stat_client_hp_torsoRight;
.float stat_client_hp_armLeft;
.float stat_client_hp_armRight;
.float stat_client_hp_legs;

.float targetEntId;
.float targetEntIdPrev;
.float stat_trg_dataidx;

.float stat_trg_dataType;

.float stat_trg_faction;

.float stat_hit_dirs;
.float stat_rdr_rng;
.float stat_trg_dist;
.float stat_trg_face;

.float stat_plr_fir;
.float targLockState;
.float stat_trg_ddflg;
.float stat_ret_dist;

.float stat_plr_rep;
.string stat_target_name;

.float statWeaponReload1;
.float statWeaponReload2;
.float statWeaponReload3;
.float statWeaponReload4;
.float statWeaponReload5;
.float statWeaponReload6;
.float statWeaponReload7;
.float statWeaponReload8;
.float statWeaponReload9;

.float statTargetHitParts;

#endif
//============================
//     ADDSTAT SLOT NUMBERS        
//============================
//float    = 32;
//float    = 33;
float STAT_RAM = 34;
float STAT_TARGET_HIT_PARTS = 35;
//float    = 36;
//float    = 37;
float STAT_PLAYER_STATE = 38;
//float    = 39;
//float    = 40;
//float    = 41;
//float    = 42;
//float    = 43;
//float    = 44;
//float    = 46;
//float    = 47;
float STAT_PLR_HITDIR = 48;
float STAT_PLR_RETDIST = 49;
//float    = 50;
//float    = 53;
//float    = 54;
//float    = 55;
//float     = 56;
//float    = 57;
float STAT_TARGET_HP_TORSOCENTER = 61;
float STAT_TARGET_HP_TORSOLEFT = 62;
float STAT_TARGET_HP_TORSORIGHT = 63;
float STAT_TARGET_HP_ARMLEFT = 64;
float STAT_TARGET_HP_ARMRIGHT = 65;
float STAT_TARGET_HP_LEGS = 66;

float STAT_CLIENT_HP_TORSOCENTER = 67;
float STAT_CLIENT_HP_TORSOLEFT = 68;
float STAT_CLIENT_HP_TORSORIGHT = 69;
float STAT_CLIENT_HP_ARMLEFT = 70;
float STAT_CLIENT_HP_ARMRIGHT = 71;
float STAT_CLIENT_HP_LEGS = 72;
//float   = 73;
//float   = 74;
//float   = 75;
//float   = 76;
//float    = 77;
//float    = 78;
float STAT_RAM_VALUE = 79;
//float STAT_LCK_STT = 80;  //2.0.0: lock-on not timer-based anymore

float STAT_WEAPON_RELOAD_1 = 81;
float STAT_WEAPON_RELOAD_2 = 82;
float STAT_WEAPON_RELOAD_3 = 83;
float STAT_WEAPON_RELOAD_4 = 84;
float STAT_WEAPON_RELOAD_5 = 85;
float STAT_WEAPON_RELOAD_6 = 86;
float STAT_WEAPON_RELOAD_7 = 87;
float STAT_WEAPON_RELOAD_8 = 88;
float STAT_WEAPON_RELOAD_9 = 89;
//float    = 90;

//float    = 91;
//float    = 100;
//float    = 101;
//float    = 102;
float STAT_PLR_REP = 103; //remaining repair delta
//104;

//============================
//     LOCK STATES   
//============================
float LOCK_NONE = 1;
float LOCK_TARG_START = 2;
float LOCK_TARG_HAS = 4;
float LOCK_PLAYER = 8;

//============================
//     HIT DIRECTION FLAGS 
//============================
float STAT_HIT_CL = 1;
float STAT_HIT_LF = 2;
float STAT_HIT_RT = 4;
float STAT_HIT_BK = 8;
float STAT_HIT_TRG = 16;

//============================
//     PLAYER POWER UP TIME  
//============================
float POWERUP_DEFAULT = 7;
float POWERUP_DEBUG   = 0.01;

//============================
//     UNIT ACCURACY PROFILES
//============================
vector ACCURACY_SNIPER      = '0.05 0.33 0.002';
vector ACCURACY_MARKSMAN    = '0.15 0.48 0.005';
vector ACCURACY_SKIRMISH    = '0.25 0.63 0.01';
vector ACCURACY_LOWTECH     = '0.35 0.78 0.0075';
vector ACCURACY_PRIMITVE    = '0.45 0.93 0.001';

//============================
//     FACTIONS
//============================
float FACTION_PSC = 1;
float FACTION_SURVEST = 2;
float FACTION_MILITAR = 3;
float FACTION_ALL = 255;  //buildings don't show up on radar, deploy and nav points are rendered to everyone.

//============================
//     SHIELD HIT FLAGS
//============================
//directs the client to choose the correct color / and shield state for an entity.
float SHIELD_HIT_REG  = 1;  //tells client that entity's shields are hit, but currently up
float SHIELD_HIT_EMP  = 2;  //entity hit with EMP round, color differently for readability.
float SHIELD_HIT_EXP  = 4;  //entity shields have just gone down, cue explosion.
float SHIELD_HIT_IXP  = 5;  //EMP-based shield explosion.

//============================
//     AI VOICE SYSTEM
//============================
//Voice group IDs
float AI_VOICE_GROUP_A = 2;
float AI_VOICE_GROUP_B = 3;
float AI_VOICE_GROUP_C = 1;

float AI_VOICE_DEAD       = 0;
float AI_VOICE_DYING      = 1;
float AI_VOICE_HELP       = 2;
float AI_VOICE_HUNT_END   = 3;
float AI_VOICE_HUNT_START = 4;
float AI_VOICE_KILL       = 5;
float AI_VOICE_NOSPOT     = 6;
float AI_VOICE_ROGER      = 7;
float AI_VOICE_SPOTTED    = 8;
float AI_VOICE_WARN       = 9;


//============================
//     CLIENT INFO STRING
//      sent by player when choosing items.
//============================
/*
  info string management bitflag
  entire invoke is 
    cmd client <changeflags> <infostring>
    
*/
float INFO_FLAG_FACTION = 512;
float INFO_FLAG_MECH    = 1024;
float INFO_FLAG_SPAWN   = 2048;
float INFO_FLAG_COLOR   = 4096;
float INFO_FLAG_GROUPS  = 8192;
float INFO_FLAG_DEPLOY  = 16384;
// WEAPON flags inherit / interoperable with WEAPON1-9 enums above.
/*
  Info string arch - this is sent to the server
  key     | value
  -----------
  spawn   | float
  fac | float
  col1  | float
  col2  | float
  col3  | float
  col4  | float
  col5  | float
  col6  | float
  mech    | float
  grp1   | float
  grp2   | float
  grp3  | float
  grp4   | float
  w1    | float
  w2    | float
  w3    | float
  w4    | float
  w5    | float
  w6    | float
  w7    | float
  w8    | float
  w9    | float
*/
string CMD_CLIENT_INFO = "client";
string KEY_FLAGS  = "flags";
string KEY_DEPLOY  = "deploy";
string KEY_FACTION  = "fac";
string KEY_COLOR1  = "col1";
string KEY_COLOR2  = "col2";
string KEY_COLOR3  = "col3";
string KEY_COLOR4  = "col4";
string KEY_COLOR5  = "col5";
string KEY_COLOR6  = "col6";
string KEY_MECH    = "mech";
string KEY_GROUP1  = "grp1";
string KEY_GROUP2  = "grp2";
string KEY_GROUP3  = "grp3";
string KEY_GROUP4  = "grp4";
string KEY_WEPN1  = "w1";
string KEY_WEPN2  = "w2";
string KEY_WEPN3  = "w3";
string KEY_WEPN4  = "w4";
string KEY_WEPN5  = "w5";
string KEY_WEPN6  = "w6";
string KEY_WEPN7  = "w7";
string KEY_WEPN8  = "w8";
string KEY_WEPN9  = "w9";
string KEY_SPAWN  = "spawn";