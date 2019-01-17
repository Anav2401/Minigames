class Rectmov
{
  int level_count = 0;
  PVector circ = new PVector(mouseX, mouseY);
  void Xmove()
  {
    rectx = width/2;
    recty = height/2;
    circx = mouseX;
    circy = mouseY;
    d1 = dist(circx, circy, rectx, recty);  
    if (d1 > 0)
    {
      rectx += 5;
      d2 = dist(circx, circy, rectx, recty);
    }

    if (d2 > d1)
    {
      rectx -= 100;
    } else
    {
      rectx += 100;
    }
  }

  void Ymove ()
  {
    if (circy > height/2)
    {
      recty += 100;
    } else if (circy < height/2)
    {
      recty -= 100;
    }
    println(d1);
    println(d2);
  }
  void finish()
  {
    if (dist(circx, circy, rectx, recty) < 50)
    {
      fill(0);
      text("-1", 200, 200);
      textSize(50);
      count -= 1;
    }
  }
  void rectCount()
  {
    if ( m >= 20)
    {
      fill(204, 71, 219);
      rect(rectx + 100, recty, rectsize, rectsize);
      if (dist(circx, circy, rectx +100, recty) < 50)
      {
        count -= 1;
      }
    }
    if ( m >= 30)
    {
      fill(23, 255, 36);
      rect( rectx + 250, recty, rectsize + 50, rectsize +50);
    }
    if ( m >= 40)
    {
      fill(204, 71, 219);
      rect(rectx - 100, recty, rectsize, rectsize);
      if (dist(circx, circy, rectx -100, recty) < 50)
    {
      count -= 1;
    }
    }
    if ( m >= 50)
    {
      fill(23, 255, 36);
      rect( rectx - 250, recty, rectsize + 50, rectsize +50);
      if (dist(circx, circy, rectx -250, recty) < 50)
    {
      count -= 1;
    }
    }
    if ( m >= 60)
    {
      fill(204, 71, 219);
      rect(rectx - 250, recty - 100, rectsize, rectsize);
      if (dist(circx, circy, rectx - 250, recty-100) < 50)
    {
      count -= 1;
    }
    }
    if ( m >= 70)
    {
      fill(204, 71, 219);
      rect(rectx + 250, recty - 100, rectsize, rectsize);
      if (dist(circx, circy, rectx + 250, recty -100) < 50)
    {
      count -= 1;
    }
    }
    if ( m >= 80)
    {
      fill(204, 71, 219);
      rect(rectx - 250, recty - 200, rectsize, rectsize);
      if (dist(circx, circy, rectx -250, recty-200) < 50)
    {
      count -= 1;
    }
    }
    if (m >= 100)
    {
      PVector catchers = new PVector(random(0, height), random(0, height));
      PVector Position = circ.sub(catchers);
      Position.normalize();
      ellipse(10, 10, Position.x, Position.y);
      if (dist(circx, circy, Position.x, Position.y) < 2)
      {
        background(255);
        text("GG", width/2, height/2);
        textSize(50);
      }
    }
  }
}
