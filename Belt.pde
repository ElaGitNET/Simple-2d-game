int beltWidth = 14; 
int beltColor = color(255, 0, 0); 

void drawConveyorBelt() {
  for (int x = 0; x < width; x += beltWidth) {
    fill(beltColor);
    rect(x, height - beltWidth * 2, beltWidth, beltWidth * 2);
  }
}
