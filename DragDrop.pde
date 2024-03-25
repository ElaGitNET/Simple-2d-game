public class Items {
  int rectX;        // Rect position
  int rectY;        // Rect position
  int rectWidth;   
  int rectHeight;   
  boolean dragging = false; 
  int score; 
  int itemSize;
  int itemSpeed;

  Items() {
    rectX = width / 2;
    rectY = height / 2;
    rectWidth = 80;
    rectHeight = 20;
    score = 0; 
    itemSize = 25;
    itemSpeed = 1;
  }
  
  void mousePressed() {
    float distance = dist(mouseX, mouseY, rectX + rectWidth / 2, rectY + rectHeight / 2);
    if (distance < rectWidth / 2 && distance < rectHeight / 2) {
       dragging = true;
       fill(64, 256, 64);
    } else {
      fill(128, 256, 128);
    }
  }
  
  void mouseReleased() {
    dragging = false;
    fill(128);
  }
  
  void mouseDragged() {
    if (dragging) {
      rectX = mouseX - rectWidth / 2;
      rectY = mouseY - rectHeight / 2;
    }
  }

  void display() {
    rect(rectX, rectY, rectWidth, rectHeight);
  }
  void fall() {
    fill(255, 0, 0);
    ellipse(random(width), itemSpeed, itemSize, itemSize);
  
    // Move falling items
    itemSpeed += 1;
  }
  void check() {
    if (dist(rectX + rectWidth / 2, rectY + rectHeight / 2, width / 2, itemSpeed) < (rectWidth / 2 + itemSize / 2)) {
      score++;
      itemSpeed = 0;
    }
  }
  void Score() {
    fill(0);
    textSize(14);
    text("Score: " + score, 10, 30);
  }
  void gameOver() {
    if (itemSpeed > height - beltWidth * 2 - itemSize / 2) {
      noLoop();
      background(000000);
      fill(255);
      textSize(40);
      textAlign(CENTER, CENTER);
      text("Game Over! Score: " + score, width/2, height / 2);
    }
  }
  
}

Items myCircle;  //Calling items class

void setup() {
  size(640, 480);
  myCircle = new Items();  //Items class
}

void draw() {
  background(64);
  myCircle.display();
  drawConveyorBelt();
  myCircle.fall();
  myCircle.check();
  myCircle.Score();
  myCircle.gameOver();
}

void mousePressed() {
  myCircle.mousePressed();
}

void mouseReleased() {
  myCircle.mouseReleased();
}

void mouseDragged() {
  myCircle.mouseDragged();
}
