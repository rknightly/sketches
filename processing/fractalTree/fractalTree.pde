float decay = 0.7;
float camAngle = 0;

int leafCount = 0;

PShape globe;

void setup(){
  size(800, 600, P3D);
  
  PImage flowers = loadImage("flower.jpg");
  
  noFill();
  noStroke();
  globe = createShape(SPHERE, 3);
  globe.setTexture(flowers);
  
}

void draw() {
  background(240);
  lights();
  //printArray(fruitNums);
  
  translate(width/2, height * 3/4);
  rotateY(camAngle);
  
  float branchAngle = map(mouseX, 0, width, 0, TWO_PI);
  
  
  branch(100, 8, branchAngle);
  leafCount = 0;
  
  camAngle += 0.01;
}

void branch(float branchLength, float branchWidth, float theta) {
  if (branchLength > 10) {
    float newBranchLength = branchLength * decay;
    float newBranchWidth = branchWidth * decay;
    float newTheta = theta;
    
    
    boolean lastBranch = branchLength * decay < 10;
    
    stroke(255);
    strokeWeight(branchWidth);
    
    for(int i=0; i<4; i++) {
      pushMatrix();
      
      if (lastBranch) {
        leafCount++;
        stroke(64, 99, 44, 100);
      } else {
        stroke(98, 78, 44);
      }
      
      
      line(0, 0, 0, -branchLength);
      translate(0, -branchLength);
      
      if (leafCount % 200 == 0 && leafCount != 0) {
        
        
        shape(globe);
      }
      
      rotate(theta);
      branch(newBranchLength, newBranchWidth, newTheta);
      popMatrix();
      rotateY(PI/2);
    }
  }
  
  //popMatrix();
  
}