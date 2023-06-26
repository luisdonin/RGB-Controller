import processing.serial.*;//habilita o uso da porta serial
import cc.arduino.*; // habilita comunicação serial com o arduino conectado
/*objetos*/
Arduino arduino;
Serial myPort;


int ledR = 9; //LED vermelho no pino 9 do arduino uno
int ledG = 10; //LED verde no pino 10 do arduino uno
int ledB = 11; //LED  azul no pino 11 do arduino uno

/*Variaveis que recebem o valor atual do range pwm*/

int red;
int green;
int blue;
//printArray(Serial.list());


void settings() {
  size(800,600);
  smooth(2);
}

void setup(){
  //titulo da tela
  surface.setTitle("RGB Controller");
  frameRate(60);
  /*
    Chamamos o objeto arduino criado anteriormente
    depois atribuimos a porta serial que o arduino está conectado
  */
  arduino = new Arduino(this, Arduino.list()[2], 57600);
  /*
    Depois inicializamos as variaveis que representam os led's como
    saída de forma semelhante ao que usamos em C/C++
  */
  arduino.pinMode(ledR, Arduino.OUTPUT);
  arduino.pinMode(ledG, Arduino.OUTPUT);
  arduino.pinMode(ledB, Arduino.OUTPUT);
}
void draw(){
  background(51); //define a cor de fundo da aplicação
  noStroke();//retira a borda das figuras que serão desenhadas
  textSize(28);
  textAlign(CENTER);
  fill(255);
  text("RGB Controller Interface", 300, 60);
  textSize(32);
  fill(255);
  
  //RED
  text("R",55,135);
  fill(255,0,0);
  
  //rect(coordX, coordY, sizeX, sizeY, border);  
  rect(100,120,255,10,5);
  fill(255);
  rect(red + 100, 115, 10, 20, 8);
  
  //GREEN
  text("G",55,235);
  fill(0,255,0);
  rect(100,220,255,10,5);
  fill(255);
  rect(green + 100, 215, 10, 20, 8);
  
  //BLUE
  text("B",55,335);
  fill(0,0,255);
  rect(100,320,255,10,5);
  fill(255);
  rect(blue + 100, 315, 10, 20, 8);  
  
  //desenha um circulo que indica a cor atual do LED
  fill(red,green,blue);
  ellipse(480,190,130,130);
  if(mousePressed && mouseX > 100 && mouseX < 355 && mouseY > 115 && mouseY < 145){
    red = mouseX - 100;
    arduino.analogWrite(ledR, red);//
  }else
  if(mousePressed && mouseX > 100 && mouseX < 355 && mouseY > 240 && mouseY < 375){
    blue = mouseX - 100;
    arduino.analogWrite(ledB, blue);//
  }else
  if(mousePressed && mouseX > 100 && mouseX < 355 && mouseY > 178 && mouseY < 230){
    green = mouseX - 100;
    arduino.analogWrite(ledG, green);//
  }
}
