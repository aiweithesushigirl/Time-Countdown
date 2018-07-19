import fontastic.*;

float angle;
float anglevel = random(-QUARTER_PI, QUARTER_PI);
float brickWidth = 25;
float brickHeight = 5;
int cols = 6;
int rows = 6;
int columnOffset = 60;
int rowOffset = 60;
int index =0;
int time = millis();
float[] t = new float[1000];
float k = second();
PFont mono;

color[] blueColors = {#75bdd1,#d3eaf2,#54b9d3, #d3e9ef, #2c8599, #009dc1};
color[] redColors = {#f2beb8,#e58e85,#b74c41, #ffd1cc, #84261c, #b22618};
color[] greenColors = {#eaffb6,#aacc58,#b2c18e, #657f24, #6b9602, #d3ff66};
color[][] allColors = {blueColors, redColors, greenColors};
//Rectangle[][] rcts = new Rectangle[rows][cols];


void setup() {

  size(1200, 768);
  noStroke();
  fill(255);
  rectMode(CENTER);

}

void draw() {

  background(k%255, k%255, k%255);
  mono = loadFont("AmericanTypewriter-Bold-48.vlw");
  textAlign(CENTER);
  textFont(mono, 32);
  fill(255);
  text(second(), width/2, height/2);
  for (int m = 0; m < 3; ++m){
  //begin(60*abs(cos(k)) +120, 60*abs(sin(k)) +120, 12);
    delay(5);
    begin((50 - 10 * m)*abs(cos(k))+(100 - 20 * m), (50 - 10 * m)*abs(sin(k))+(100 - 20 * m), 12, m);
    k = (k + PI/128);
  }
if (second()  % 30 == 0){
  noStroke();
  for (int k = 0; k < 3; ++k){   
    for (int i = 0; i < rows; ++i){
      pushMatrix();
      translate(i * columnOffset, 0);
     //i * columnOffset, 0);
      //angle = random(-QUARTER_PI, QUARTER_PI);
   
      for (int j = 0; j < cols; ++j){
        //begin((50 - 10 * j)*abs(cos(k))+(100 - 20 * j), (50 - 10 * i)*abs(sin(k))+(100 - 20 * (j)), 12, j%3);
        //if (millis() - k > 100){
        pushMatrix();
        translate(0, rowOffset * j);
        angle = angle + anglevel;

        float c = cos(angle);
        float s = sin(angle);
        if ((second()+1) % 3 == 0)
          rotate(c);
        else
          rotate(s);
        fill(allColors[k%3][index%6]);
        ellipse(width/4, height/4, brickWidth, brickHeight); 
        index++;
        translate(0, rowOffset * j);
      popMatrix();
   
      
    }
    popMatrix(); 
  }
  //delay(60);
  translate(columnOffset*6 , 0);
    }
}
//}

}

void begin(float R, float r, float n, int colorIndex){
  strokeWeight(5);
  noFill();
  pushMatrix();
  translate(width/2, height/2);
  for (int i = 0; i <= n; i= i+1) {
    t[i] = 2*i*PI/n-PI/4;
    if (i % 2 == 0) {      
      stroke(allColors[colorIndex][second()%4]);
      arc(0, 0, 2*R, 2*R, t[i], t[i+1]);
    } else {
      stroke(allColors[colorIndex][second()%4]);
      arc(0, 0, 2*r, 2*r, t[i], t[i+1]);
    }
  }
  delay(2);
  popMatrix();
}