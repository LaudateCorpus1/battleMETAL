/*
battleMETAL
Author: Peter Roohr
Date: 9/22/2016
Overview: center torso animations
*/

void() ctor_die1 = [$ctorDie1, ctor_die2]{

  local entity e, oself;
  local vector pvel;
  pvel = self.velocity;
  e = spawn();
  oself = self;
  self = e;
    setorigin(self, oself.origin);
    BecomeExplosion();
  self = oself;
  
  setsize(self, self.mins, self.maxs);
  
  if(pvel_x > 0 || pvel_y > 0 || pvel_z > 0){
    self.velocity = pvel + VelocityForDamage (100);
    self.avelocity_x = random()*600;
    self.avelocity_y = random()*600;
    self.avelocity_z = random()*600;
  }
  else{
    self.velocity = VelocityForDamage (100);
    self.avelocity_x = random()*600;
    self.avelocity_y = random()*600;
    self.avelocity_z = random()*600;
  }
};
void() ctor_die2 = [$ctorDie2, ctor_die3]{};
void() ctor_die3 = [$ctorDie3, ctor_die3]{
  if( (self.flags & FL_CLIENT) ){
    PlayerDead();
  }
};
