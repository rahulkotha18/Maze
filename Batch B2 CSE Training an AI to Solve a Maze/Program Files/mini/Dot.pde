class Dot 
{
  PVector pos;
  PVector vel;
  PVector acc;
  Brain brain;
  boolean dead = false;
  boolean reachedGoal = false;
  boolean isBest = false;//true if this dot is the best dot from the previous generation
  float fitness = 0;
  Dot() 
  {
    brain = new Brain(1000);//new brain with 1000 instructions
    //start the dots at the bottom of the window with a no velocity or acceleration
    pos = new PVector(width/2, height- 10);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
  }
  //-----------------------------------------------------------------------------------------------------------------
  //draws the dot on the screen
  void show() 
  {
    //if this dot is the best dot from the previous generation then draw it as a big green dot
    if (isBest) 
    {
      fill(0, 0, 255);
      ellipse(pos.x, pos.y, 8, 8);
    } 
    else 
    {
      //all other dots are just smaller white dots
      fill(255);
      ellipse(pos.x, pos.y, 4, 4);
    }
  }
  //-----------------------------------------------------------------------------------------------------------------------
  //moves the dot according to the brains directions
  void move() 
  {
    if (brain.directions.length > brain.step) 
    {
      //if there are still directions left then set the acceleration as the next PVector in the direcitons array
      acc = brain.directions[brain.step];
      brain.step++;
    } 
    else 
    {
      //if at the end of the directions array then the dot is dead
      dead = true;
    }
    //apply the acceleration and move the dot
    vel.add(acc);
    vel.limit(5);//not too fast
    pos.add(vel);
  }
  //-------------------------------------------------------------------------------------------------------------------
  //calls the move function and check for collisions and stuff
  void update() 
  {
    if (!dead && !reachedGoal) 
    {
      move();
      if (pos.x< 2|| pos.y<2 || pos.x>width-2 || pos.y>height -2) 
      {
        //if near the edges of the window then kill it 
        dead = true;
      } 
      else if (dist(pos.x, pos.y, goal.x, goal.y) < 5) 
      {
        //if reached goal
        reachedGoal = true;
      } 
     /* else if (pos.x< 600 && pos.y < 310 && pos.x > 0 && pos.y > 300) 
      {
        //if hit obstacle
        dead = true;
      }
       else if (pos.x< 350 && pos.y < 600 && pos.x > 0 && pos.y > 590) 
      {
        //if hit obstacle
        dead = true;
      }
      else if (pos.x< 800 && pos.y < 600 && pos.x > 450 && pos.y > 590) 
      {
        //if hit obstacle
        dead = true;
      }*/
      else if(pos.x<150&&pos.x>0&&pos.y>550&&pos.y<560){ dead = true; }
  else if(pos.x<600&&pos.x>200&&pos.y>550&&pos.y<560){ dead = true; }
  else if(pos.x<800&&pos.x>650&&pos.y>550&&pos.y<560){ dead = true; }
  else if(pos.x<100&&pos.x>50&&pos.y>500&&pos.y<510){ dead = true; }
  else if(pos.x<300&&pos.x>250&&pos.y>500&&pos.y<510){ dead = true; }
  else if(pos.x<550&&pos.x>450&&pos.y>500&&pos.y<510){ dead = true; }
  else if(pos.x<800&&pos.x>650&&pos.y>500&&pos.y<510){ dead = true; }
  else if(pos.x<700&&pos.x>650&&pos.y>450&&pos.y<460){ dead = true; }
  else if(pos.x<450&&pos.x>350&&pos.y>450&&pos.y<460){ dead = true; }
  else if(pos.x<250&&pos.x>200&&pos.y>450&&pos.y<460){ dead = true; }
  else if(pos.x<250&&pos.x>150&&pos.y>400&&pos.y<410){ dead = true; }
  else if(pos.x<400&&pos.x>300&&pos.y>400&&pos.y<410){ dead = true; }
  else if(pos.x<550&&pos.x>450&&pos.y>400&&pos.y<410){ dead = true; }
  else if(pos.x<700&&pos.x>600&&pos.y>400&&pos.y<410){ dead = true; }
  else if(pos.x<300&&pos.x>100&&pos.y>350&&pos.y<360){ dead = true; }
  else if(pos.x<450&&pos.x>350&&pos.y>350&&pos.y<360){ dead = true; }
  else if(pos.x<650&&pos.x>600&&pos.y>350&&pos.y<360){ dead = true; }
  else if(pos.x<750&&pos.x>700&&pos.y>350&&pos.y<360){ dead = true; }
  else if(pos.x<50&&pos.x>0&&pos.y>300&&pos.y<310){ dead = true; }
  else if(pos.x<200&&pos.x>200&&pos.y>300&&pos.y<310){ dead = true; }
  else if(pos.x<500&&pos.x>350&&pos.y>300&&pos.y<310){ dead = true; }
  else if(pos.x<700&&pos.x>550&&pos.y>300&&pos.y<310){ dead = true; }
  else if(pos.x<800&&pos.x>750&&pos.y>300&&pos.y<310){ dead = true; }
  else if(pos.x<200&&pos.x>0&&pos.y>250&&pos.y<260){ dead = true; }
  else if(pos.x<400&&pos.x>250&&pos.y>250&&pos.y<260){ dead = true; }
  else if(pos.x<500&&pos.x>450&&pos.y>250&&pos.y<260){ dead = true; }
  else if(pos.x<750&&pos.x>550&&pos.y>250&&pos.y<260){ dead = true; }
  else if(pos.x<100&&pos.x>0&&pos.y>200&&pos.y<210){ dead = true; }
  else if(pos.x<400&&pos.x>300&&pos.y>200&&pos.y<210){ dead = true; }
  else if(pos.x<600&&pos.x>450&&pos.y>200&&pos.y<210){ dead = true; }
  else if(pos.x<800&&pos.x>650&&pos.y>200&&pos.y<210){ dead = true; }
  else if(pos.x<50&&pos.x>0&&pos.y>150&&pos.y<160){ dead = true; }
  else if(pos.x<300&&pos.x>200&&pos.y>150&&pos.y<160){ dead = true; }
  else if(pos.x<450&&pos.x>400&&pos.y>150&&pos.y<160){ dead = true; }
  else if(pos.x<700&&pos.x>600&&pos.y>150&&pos.y<160){ dead = true; }
  else if(pos.x<200&&pos.x>50&&pos.y>100&&pos.y<110){ dead = true; }
  else if(pos.x<350&&pos.x>250&&pos.y>100&&pos.y<110){ dead = true; }
  else if(pos.x<600&&pos.x>500&&pos.y>100&&pos.y<110){ dead = true; }
  else if(pos.x<750&&pos.x>700&&pos.y>100&&pos.y<110){ dead = true; }
  else if(pos.x<450&&pos.x>150&&pos.y>50&&pos.y<60){ dead = true; }
  else if(pos.x<700&&pos.x>500&&pos.y>50&&pos.y<60){ dead = true; }
  else if(pos.x<800&&pos.x>750&&pos.y>50&&pos.y<60){ dead = true; }
  //v
  else if( pos.x <60 && pos.x > 50 && pos.y > 50 && pos.y <160){ dead = true; }
else if( pos.x <60 && pos.x > 50 && pos.y > 300 && pos.y <500){ dead = true; }
else if( pos.x <110 && pos.x > 100 && pos.y > 0 && pos.y <50){ dead = true; }
else if( pos.x <110 && pos.x > 100 && pos.y > 100 && pos.y <150){ dead = true; }
else if( pos.x <110 && pos.x > 100 && pos.y > 250 && pos.y <300){ dead = true; }
else if( pos.x <110 && pos.x > 100 && pos.y > 350 && pos.y <400){ dead = true; }
else if( pos.x <110 && pos.x > 100 && pos.y > 450 && pos.y <510){ dead = true; }
else if( pos.x <160 && pos.x > 150 && pos.y > 150 && pos.y <200){ dead = true; }
else if( pos.x <160 && pos.x > 150 && pos.y > 300 && pos.y <350){ dead = true; }
else if( pos.x <160 && pos.x > 150 && pos.y > 400 && pos.y <500){ dead = true; }
else if( pos.x <210 && pos.x > 200 && pos.y > 450 && pos.y <500){ dead = true; }
else if( pos.x <260 && pos.x > 250 && pos.y > 300 && pos.y <410){ dead = true; }
else if( pos.x <310 && pos.x > 300 && pos.y > 250 && pos.y <300){ dead = true; }
else if( pos.x <360 && pos.x > 350 && pos.y > 100 && pos.y <200){ dead = true; }
else if( pos.x <360 && pos.x > 350 && pos.y > 300 && pos.y <350){ dead = true; }
else if( pos.x <360 && pos.x > 350 && pos.y > 450 && pos.y <550){ dead = true; }
else if( pos.x <410 && pos.x > 400 && pos.y > 100 && pos.y <150){ dead = true; }
else if( pos.x <410 && pos.x > 400 && pos.y > 350 && pos.y <410){ dead = true; }
else if( pos.x <460 && pos.x > 450 && pos.y > 400 && pos.y <460){ dead = true; }
else if( pos.x <510 && pos.x > 500 && pos.y > 150 && pos.y <260){ dead = true; }
else if( pos.x <510 && pos.x > 500 && pos.y > 300 && pos.y <350){ dead = true; }
else if( pos.x <510 && pos.x > 500 && pos.y > 450 && pos.y <500){ dead = true; }
else if( pos.x <560 && pos.x > 550 && pos.y > 100 && pos.y <150){ dead = true; }
else if( pos.x <560 && pos.x > 550 && pos.y > 350 && pos.y <510){ dead = true; }
else if( pos.x <610 && pos.x > 600 && pos.y > 200 && pos.y <250){ dead = true; }
else if( pos.x <610 && pos.x > 600 && pos.y > 400 && pos.y <500){ dead = true; }
else if( pos.x <660 && pos.x > 650 && pos.y > 150 && pos.y <200){ dead = true; }
else if( pos.x <660 && pos.x > 650 && pos.y > 300 && pos.y <360){ dead = true; }
else if( pos.x <710 && pos.x > 700 && pos.y > 50 && pos.y <100){ dead = true; }
else if( pos.x <710 && pos.x > 700 && pos.y > 300 && pos.y <350){ dead = true; }
else if( pos.x <710 && pos.x > 700 && pos.y > 400 && pos.y <460){ dead = true; }
else if( pos.x <760 && pos.x > 750 && pos.y > 50 && pos.y <110){ dead = true; }
else if( pos.x <760 && pos.x > 750 && pos.y > 250 && pos.y <360){ dead = true; }
else if( pos.x <760 && pos.x > 750 && pos.y > 400 && pos.y <500){ dead = true; }
    }
  }
  //--------------------------------------------------------------------------------------------------------------------------------------
  //calculates the fitness
  void calculateFitness() 
  {
    if (reachedGoal) 
    {
      //if the dot reached the goal then the fitness is based on the amount of steps it took to get there
      fitness = 1.0/16.0 + 1000000.0/(float)(brain.step * brain.step);
    } 
    else 
    {
      //if the dot didn't reach the goal then the fitness is based on how close it is to the goal
      float distanceToGoal = dist(pos.x, pos.y, goal.x, goal.y);
      fitness = 1.0/(distanceToGoal * distanceToGoal);
    }
  }
  //---------------------------------------------------------------------------------------------------------------------------------------
  //clone it 
  Dot gimmeBaby() 
  {
    Dot baby = new Dot();
    baby.brain = brain.clone();//babies have the same brain as their parents
    return baby;
  }
}
