/*
battleMETAL
Author: Peter Roohr
Date: 05/25/2019
Overview:
  Data File - Unit - Vehicle
      Trowel
        Super heavy assault tank.
        NON-PLAYABLE
*/

/*
  Main ini function for unit.
  Register this in <world_ext_c>
*/
void() data_ini_trowel_={

  self.data_idx = UID_VEHICLE_trowel;
  self.vec_size = 3;
  self.vec_name = "Trowel";
 
  self.max_health = 550;//465;
  setsize(self, '-32 -32 -7.75', '32 32 36');
  self.flags = self.flags | (FL_TURRET | FL_MONSTER | FL_UNIT);
//ENERGY AND SHIELDS===================
  self.energyMax = 700;
  self.energyRate= 1.85;
  self.shieldMax = 250;
  self.shieldRate= 0;
//=====================================
 
//RADAR================================
  self.radar_range = 1200;
  self.w_firetime = 4;  //lock-on time in seconds
//=====================================

//SPEED================================
  self.data_speed_forward = 25;
  self.data_speed_strafe = 10;
  self.data_speed_backward = 10;
  self.data_speed_accel = 1;
#ifdef SSQC
  self.yaw_speed = 1.5;//1;    //AI-only 
  self.turret_yaw_speed = 2;//1.5;//AI-only
  self.ai_angleLimits = '-160 160 0';
#endif
//=====================================
 
//MECH COMPONENTS====================
  self.hardpoint_cnt = 3;
  weaponList = self;
  self.model = "q3mdl/vecs/trowel/mdl_trowel_chas.md3";
  
  //tank turret
  data_ini_unitPiece_( M_TOR_CENTER, "q3mdl/vecs/trowel/mdl_trowel_tur.md3", 1, '0 13.5 0', self, torsoCenter, '0 0 0'); 
  
  //camera location
  data_ini_camera_( '0 20 0', self.torsoCenter );
//=====================================
 
//HARDPOINTS==========================
#ifdef CSQC
  //csqc quirk: offsets_z = (turret_z * -1) + ssqc offsets_z
  //csqc quirk: offsets_y = (turret_y  - ssqc offsets_y
  data_ini_unitHardpoint_1( M_TOR_CENTER, '-4.65 -1.5 10.5', '0 0 0', 3, (DMG_ENE | DMG_BAL));
  data_ini_unitHardpoint_2( M_TOR_CENTER, '-4.65 3.25 10.5', '0 0 0', 3, (DMG_ENE | DMG_BAL));
  data_ini_unitHardpoint_3( M_TOR_CENTER, '2 1.5 -7', '90 0 0', 3, (DMG_ENE | DMG_BAL));
  data_ini_unitHardpoint_4( M_TOR_CENTER, '2 1.5 -11', '90 0 0', 3, (DMG_ENE | DMG_BAL));
  data_ini_unitHardpoint_5( M_LEGS, '7 7.5 20', '0 0 0', 3, (DMG_ENE | DMG_BAL));
  data_ini_unitHardpoint_6( M_LEGS, '-7 7.5 20', '0 0 0', 3, (DMG_ENE | DMG_BAL));
  data_ini_unitHardpoint_7( M_TOR_CENTER, '0 -1 -15.5', '0 180 0', 3, (DMG_ENE | DMG_BAL));
#endif
#ifdef SSQC
  data_ini_unitHardpoint_1( M_TOR_CENTER, '-4.65 12 10.5', '0 0 0', 3, (DMG_ENE | DMG_BAL));
  data_ini_unitHardpoint_2( M_TOR_CENTER, '-4.65 16.75 10.5', '0 0 0', 3, (DMG_ENE | DMG_BAL));
  data_ini_unitHardpoint_3( M_TOR_CENTER, '2 -8 10.5', '90 0 0', 3, (DMG_ENE | DMG_BAL));
  data_ini_unitHardpoint_4( M_TOR_CENTER, '2 -8 14', '90 0 0', 3, (DMG_ENE | DMG_BAL));
  data_ini_unitHardpoint_5( M_LEGS, '7 7.5 20', '0 0 0', 3, (DMG_ENE | DMG_BAL));
  data_ini_unitHardpoint_6( M_LEGS, '-7 7.5 20', '0 0 0', 3, (DMG_ENE | DMG_BAL));
  data_ini_unitHardpoint_7( M_TOR_CENTER, '0 -1 -15.5', '0 180 0', 3, (DMG_ENE | DMG_BAL));
#endif
//=====================================

//HUD DATA=============================
  //Unit is non-playable
//====================================

};
