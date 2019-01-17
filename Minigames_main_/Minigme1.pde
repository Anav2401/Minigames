class Minigame1
{
  int count;
  void player ()
  {
    count = 0;
    shooterx = mouseX;
    target_radius = 200; 
    if (timer <= 30)
    {
      target_x = (width/2) + (target_radius * cos(angle));
      target_y = 400 + (target_radius * sin(angle));
    } else if (timer >= 21 && timer <= 39)
    {
      target_x = 2*((width/2) + (degrees(cos(3*timer))));
      target_y=  3*(400 + (degrees(sin(2*timer))));
    }
    if (timer <= 40)
    {
      target_x = (width/2) + (target_radius * cos(angle));
      target_y = 400 + (target_radius * sin(angle));
    } 
    image(target, target_x, target_y);
    image(shooter, shooterx, shootery);
    image(aim, mouseX, mouseY);
    bulletx = mouseX - 25;
    angle += 0.09;
    shootersize  = 300;
    count ++;
    if (count == 1)
    {
      pushMatrix();
      translate(bulletx, bullety);
      sphere(bulletsize);
      bulletsize -= 0.01;
      popMatrix();
      bullety -= 40;
    }
    bullet_count++;
    if (bullety <= 100)
    {
      bullety = 700;
      count = 0;
      bulletsize= 10;
    }
  }
  void point_Count()
  {
    if (dist(bulletx, bullety, target_x, target_y) < (target_radius))
    {
      point_count++;
    }
    fill(234, 235, 10);
    text(point_count, width/2 - 10, 50);
    textSize(50);
  }
  void objects()
  { 
    pushMatrix();
    translate(rect_positionx, rect_positiony);
    rotateX(rotate);
    fill(252, 3, 241);
    box(shapesize);
    popMatrix();
    if (rect_positiony >  height)
    {
      rect_positiony = random(0, height/2);
      rect_positionx = random(250, 700);
      shapesize = random(50, 100);
    }
    if (dist(bulletx, bullety, rect_positionx, rect_positiony) < shapesize)
    {
      rect_hit++;
      if (rect_hit == control)
      {
        rect_positiony = random(0, height/2);
        rect_positionx = random(250, 700);
        shapesize = random(50, 100);
        rect_hit = 0;
      }
    }
    if (timer >= 0 && timer < 20)
    {
      control = 6;
    } else  if (timer >= 20)
    {
      rect_positiony += 3;
      if (timer >= 50)
        circ_positiony += 3;
      control = 10;
      target_x = 4*cos(angle);
      target_y = 3*sin(angle);
    }
    rotate += 0.1;
    if ( dist(shooterx, shootery, rect_positionx, rect_positiony) < shapesize)
    {
      point_count-- ;
    }
    text(rect_hit, 100, 50);
    textSize(50);
  }
}
