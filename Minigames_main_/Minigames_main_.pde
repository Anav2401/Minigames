PImage shooter; 
PImage aim;
PImage target;
float target_x = 0;
float target_y = 0;
float angle = PI/2;
float bullety = 800;
float bulletz = -900;
float shooterx = mouseX;
float shootery = 800; 
float rotate = PI/4;
float rect_positionx = random(200, 700);
float rect_positiony = random(0, height);
int control = 0;
//float rect_positionz = -100; 
float shapesize = 100;
int bulletsize = 20;
float bulletx = mouseX + 10;
int shootersize = 300;
float target_radius = 200;
int point_count = 0;
int bullet_count = 0;
int rect_hit = 0;
float rectx;
float recty;
float circx;
float circy;
float d1;
float d2;
float circ2X;
float circ2Y;
int count = 0;
int rectsize = 50;
int m;
boolean level;
boolean point;
int timer; 
Rectmov r;
Minigame1 m1;
boolean g1 = false;
boolean g2 = false;
float circ_positiony;
float circ_positionx;
int circ_hit;
PVector circ;
void setup()
{
  fullScreen(P3D);
  rectMode(CENTER);
  imageMode(CENTER);
  shooter = loadImage("shootermain2.png");
  target = loadImage("2Target.png");
  aim = loadImage("Aim2.png");
  target.resize(300, 300);
  aim.resize(100, 100);
  m1 = new Minigame1();
  r  = new Rectmov();
}
void draw()
{  
  if (g1 == false && g2 == false)
  { 
    background(0);
    textSize(50);
    text("ENTER 1 OR 2 TO ENTER GAME", 100,100);
    text("AFTERWARDS ENTER 1 OR 2 TO SWITCH GAMES", 100, 300);
    text("Minigame 1",100,500);
    text("Minigame 2",100,700);
    textSize(25);
    text("You are a ball and you're trying your best to reach the treasure.. But beware of the protectors",100,600);
    text("Aim for the best and in this case I mean literally and beware of the foreign objects in the way!!",100,800);
  }
  if (key == '1')
  {
    g1 = true;
    g2 = false;
    if ( g1 == true && g2 == false)
    {
      background(112, 133, 247);
      cursor(CROSS);
      timer = millis()/1000;
      fill(0);
      text(timer, width -100, 50);
      textSize(50);
      m1.objects();
      m1.player();
      m1.point_Count();
      shooter.resize(shootersize, shootersize);    
      shapesize += 0.5;
      rect_positiony += 2;
    }
  } else if (key == '2')
  {
    g1 = false;
    g2 = true;
    if (g2 == true && g1 == false)
    {
      int g = 0;
      m *= g;
      g = 1;
      m = g*(millis()/1000);
      circ2X = width/2;
      circ2Y = height/2;
      background(0);
      fill(255, 10, 182);
      ellipse(circx, circy, 50, 50);
      r.Xmove();
      r.Ymove();
      fill(204, 71, 219);
      rect(rectx, recty, rectsize, rectsize);
      fill(252, 234, 23);
      ellipse(circ2X, circ2Y, 50, 50);
      if (dist(circx, circy, circ2X, circ2Y) < 20)
      {
        point = true;
        if ( point == true)
        {
          text("+1", 100, 200);
          count += 1;
          timer = millis()/1000;
          text(timer, 700, 200);
          textSize(100);
        }
      }
      fill(255);
      text(count, 500, 200);
      textSize(100);
      r.finish();
      r.rectCount();
      text(m, width/2, 50);
    }
  }
}
