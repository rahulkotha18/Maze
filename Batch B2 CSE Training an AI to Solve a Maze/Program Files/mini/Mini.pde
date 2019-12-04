Population test;
PVector goal  = new PVector(440, 20);
void setup() 
{
  size(800, 600); //size of the window
  frameRate(10000000);//increase this to make the dots go faster
  test = new Population(1000);//create a new population with 1000 members
}
void draw() 
{ 
  background(0);
  //draw goal
  fill(0, 255, 0);
  ellipse(goal.x, goal.y, 10, 10);
  //draw obstacle(s)
  fill(255, 0, 0);
  //rect(0, 300, 600, 10);
  //cen
  //horizontal
  rect(0, 550, 150, 10); 
  rect(200, 550, 400, 10);
  rect(650, 550, 150, 10);
  rect(50, 500, 50, 10);
  rect(250, 500, 50, 10);
  rect(450, 500, 100, 10);
  rect(650, 500, 150, 10);
  rect(650, 450, 50, 10);
  rect(350, 450, 100, 10);
  rect(200, 450, 50, 10);
  rect(150, 400, 100, 10);
  rect(300, 400, 100, 10);
  rect(450, 400, 100, 10);
  rect(600, 400, 100, 10);
  rect(100, 350, 200, 10);
  rect(350, 350, 100, 10);
  rect(600, 350, 50, 10);
  rect(700, 350, 50, 10);
  rect(0, 300, 50, 10);
  rect(200, 300, 50, 10);
  rect(350, 300, 150, 10);
  rect(550, 300, 150, 10);
  rect(750, 300, 50, 10);
  rect(0, 250, 200, 10);
  rect(250, 250, 150, 10);
  rect(450, 250, 50, 10);
  rect(550, 250, 200, 10);
  rect(0, 200, 100, 10);
  rect(300, 200, 100, 10);
  rect(450, 200, 150, 10);
  rect(650, 200, 150, 10);
  rect(0, 150, 50, 10);
  rect(200, 150, 100, 10);
  rect(400, 150, 50, 10);
  rect(600, 150, 100, 10);
  rect(50, 100, 150, 10);
  rect(250, 100, 100, 10);
  rect(500, 100, 100, 10);
  rect(700, 100, 50, 10);
  rect(150, 50, 300, 10);
  rect(500, 50, 250, 10);
  rect(750, 50, 50, 10);
 // /*
  //vertical
  rect(50, 50, 10, 110);
  rect(50, 300, 10, 200);
  rect(100, 0, 10, 50);
  rect(100, 100, 10, 50);
  rect(100, 250, 10, 50);
  rect(100, 350, 10, 50);
  rect(100, 450, 10, 60);
  rect(150, 150, 10, 50);
  rect(150, 300, 10, 50);
  rect(150, 400, 10, 100);
  rect(200, 450, 10, 50);
  rect(250, 300, 10, 110);
  rect(300, 250, 10, 50);
  rect(350, 100, 10, 100);
  rect(350, 300, 10, 50);
  rect(350, 450, 10, 100);
  rect(400, 100, 10, 50);
  rect(400, 350, 10, 60);
  rect(450, 400, 10, 60);
  rect(500, 150, 10, 110);
  rect(500, 300, 10, 50);
  rect(500, 450, 10, 50);
  rect(550, 100, 10, 50);
  rect(550, 350, 10, 160);
  rect(600, 200, 10, 50);
  rect(600, 400, 10, 100);
  rect(650, 150, 10, 50);
  rect(650, 300, 10, 60);
  rect(700, 50, 10, 50);
  rect(700, 300, 10, 50);
  rect(700, 400, 10, 60);
  rect(750, 50, 10, 60);
  rect(750, 250, 10, 110);
  rect(750, 400, 10, 100);
  if (test.allDotsDead()) 
  {
    //genetic algorithm
    test.calculateFitness();
    test.naturalSelection();
    test.mutateDemBabies();
  } 
  else 
  {
    //if any of the dots are still alive then update and then show them
    test.update();
    test.show();
  }
}
