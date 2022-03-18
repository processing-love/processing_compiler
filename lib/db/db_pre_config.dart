import 'package:processing_compiler/db/db_adapter_helper.dart';
import 'package:processing_compiler/db/db_app_config.dart';
import 'package:processing_compiler/db/db_project_file.dart';

/// @date 2020/6/12.
class DbPreConfig {
  static const String appConfigKey = 'app_config_key';

  static Future loadExamples() async {
    DbAppConfig? appConfig = boxAppConfig.get(appConfigKey);
    appConfig?.isFirstConfig = false;
    await appConfig?.save();
    await createExampleProject('Interactive Noise', codeInteractiveNoiseP5, ProjectType.p5js.index);
    await createExampleProject('Circle Noise', codeCircleNoiseP5, ProjectType.p5js.index);
    await createExampleProject('Golden Flower', codeGoldenFlowerProcessing, ProjectType.processing.index);
    await createExampleProject('Magical Tree', codeMagicalTreeProcessing, ProjectType.processing.index);
  }

  static Future createExampleProject(
      String name, String code, int projectTypeIndex) async {
    return await boxProjectFile.put(
        DateTime.now().millisecondsSinceEpoch.toString(),
        DbProjectFile(
            nameKey: DateTime.now().millisecondsSinceEpoch.toString(),
            name: name,
            code: code,
            projectType: projectTypeIndex,
            modifyTime: DateTime.now().millisecondsSinceEpoch));
  }

  static Future loadDefaultAppConfig() async {
    DbAppConfig defaultAppConfig = DbAppConfig(isFirstConfig: true);
    DbAppConfig? appConfig = boxAppConfig.get(appConfigKey);
    appConfig ?? await boxAppConfig.put(appConfigKey, defaultAppConfig);
    if (appConfig?.isFirstConfig ?? true) {
      await loadExamples();
    }
  }

  static const String codeMagicalTreeProcessing = r'''
float n = 0; // noise input
PGraphics bg; // background
PGraphics tree;
ArrayList <PVector> leafs;
float minHue, maxHue;


/*---------------*/


void setup() {
  size(900, 700);
  colorMode(HSB);
  noLoop();
  noStroke();
  
  createBackground(); 
  tree = createGraphics(width, height);  
  leafs = new ArrayList<PVector>();  
}


/*---------------*/


void draw() {     
  image(bg, 0, 0); // display background  
  createTree();
  setHue();
  drawLeafs(10, 250, 0, 1);  // big smooth leafs
  image(tree, 0, 0);  //display tree    
  drawLeafs(0, 20, 10, 40);  // small rigid leafs
  ground();  
}


/*---------------*/


void mousePressed() {
  redraw();
   
  //delete leafs
  for (int i = leafs.size(); i >= 0; i--) {
    leafs.remove(0);
  }
}


/*---------------*/


void createBackground() {
  bg = createGraphics(width, height);
  bg.beginDraw();
  bg.noStroke();
  for (float diam = 1.5*width; diam > 0.5*width; diam -= 20) {
    bg.fill(map(diam, 0.5*width, 1.5*width, 255, 210));
    bg.ellipse(width/2, height/2, diam, diam);
  }
  bg.endDraw();
}


/*---------------*/


void setHue() {
  float rdn0 = random(255);
  float rdn1 = random(255);
  minHue = min(rdn0, rdn1);
  maxHue = max(rdn0, rdn1);
}


/*---------------*/


void createTree() {
  tree.beginDraw();
  tree.noStroke();
  tree.background(0, 0);  // clear PGraphics
  for (int i = 0; i < 3; i++) {
    tree.fill(map(i, 0, 2, 60, 20));
    branch(width/2, height, 70, -HALF_PI, 150, 0);
  }
  tree.endDraw();  
}


/*---------------*/


void branch(float x, float y, float bSize, float theta, float bLength, float pos) {
  n += 0.01;  // increment noise input
  float diam = lerp(bSize, 0.7*bSize, pos/bLength);  // gradually reduce the diameter
  diam *= map(noise(n), 0, 1, 0.4, 1.6);  // multiply by noise to add variation
  
  tree.ellipse(x, y, diam, diam);
  if (bSize > 0.6) {
    if (pos < bLength) {
      x += cos(theta + random(-PI/10, PI/10));
      y += sin(theta + random(-PI/10, PI/10));
      branch(x, y, bSize, theta, bLength, pos+1);
    } else {
      leafs.add(new PVector(x, y));  // add a leaf at the intersection
      boolean drawleftBranch = random(1) > 0.1;
      boolean drawrightBranch = random(1) > 0.1;
      if (drawleftBranch) branch(x, y, random(0.5, 0.7)*bSize, theta - random(PI/15, PI/5), random(0.6, 0.8)*bLength, 0);
      if (drawrightBranch) branch(x, y, random(0.5, 0.7)*bSize, theta + random(PI/15, PI/5), random(0.6, 0.8)*bLength, 0);
      
      if (!drawleftBranch && !drawrightBranch) {  // if none of the branchs are drawn, draw a tip
        tree.pushMatrix();
        tree.translate(x, y);
        tree.rotate(theta);
        tree.quad(0, -diam/2, 2*diam, -diam/6, 2*diam, diam/6, 0, diam/2);
        tree.popMatrix();
      }
    }
  }
}


/*---------------*/


void drawLeafs(float minDiam, float maxDiam, float minAlpha, float maxAlpha) {
  for (int i = 0; i < leafs.size(); i++) {
    float h = map(i, 0, leafs.size(), minHue, maxHue);
    float s = 255;
    float b = 255;
    float a = random(minAlpha, maxAlpha);
    fill(h, s, b, a);
    float diam = random(minDiam, maxDiam);
    float jitterX = random(-30, 30);
    float jitterY = random(-30, 30);
    ellipse(leafs.get(i).x + jitterX, leafs.get(i).y + jitterY, diam, diam);
  }
}


/*---------------*/


void ground() {
  fill(20);
  beginShape();
  vertex(0, height);
  for (int i = 0; i <= width; i += 50) {
    vertex(i, map(noise(n), 0, 1, height - 30, height));
    n += 0.1;
  }
  vertex(width, height);
  endShape();
}
  ''';
  static const String codeGoldenFlowerProcessing = r'''
final float PHI = (1 + sqrt(5))/2;  //golden ratio
ArrayList<Ball> balls;
int counter = 0;


/*------------------------------*/


void setup()
{
  size(900, 1200);
  balls = new ArrayList<Ball>();
  balls.add (new Ball(10, 0));
  
  noStroke();  
  fill(255, 200, 0);
}


/*------------------------------*/


void draw()
{
  background(22, 8, 0);
 
  //loop backwards to test the balls from the center to the edges
  for (int i = balls.size() - 1; i >= 0; i--)
  {
    Ball b = balls.get(i);
    b.move(i, balls);
    b.display();
    if (b.isDead())  balls.remove(i);    
  }
  
  counter++;
  balls.add (new Ball(10 - (counter%500)/50, counter*PHI*TAU));  
}


/*------------------------------*/


class Ball
{
  PVector center,  //screen center
             pos,  //position
             dir;  //direction
  float diam;  //diameter
  
  ////////////
  
  Ball(float diam_, float angle)
  {
    center = new PVector(width/2, height/2, 1); 
    pos = center.get();
    dir = new PVector(cos(angle), sin(angle), 0);
    diam = diam_;
  }
  
  ///////////
  
  void move(int id, ArrayList<Ball> balls)
  {
    //tests if balls created afterwards are too close
    for (int i = id + 1; i < balls.size() - 1; i++)
    {
      Ball b = balls.get(i);
      if (PVector.dist(pos, b.pos) < 12)  pos.add(dir);
    }
  }
   
  /////////// 
   
  void display()
  {
    ellipse(pos.x, pos.y, diam, diam);
  }
  
  ///////////
  
  boolean isDead()
  {
    if (PVector.dist(pos, center) > width/3) return true;
    else return false;
  }
}
  ''';
  static const String codeCircleNoiseP5 = r'''
var particles = [];
var colors = ["#3DB2FF","#FFB830","#FF2442","#FF7600","#185ADB","#0A1931","#99154E"];
var n, s, maxR;

function setup() {
	createCanvas(windowWidth, windowHeight);
	background("#FFEDDA");
	smooth();
	
	n = 150;
	s = 20;
	maxR = height/2 - height/10;
}

function draw() {
	translate(width/2, height/2);
	noStroke();
	
	if(s > 1) {
		if(particles.length != 0) {
			for(let i = 0; i < particles.length; i++) {
				var p = particles[i];
				p.show();
				p.move();
				
				if(p.isDead()) particles.splice(i, 1);
			}
		} else {
			s -= 2;
			initParticles();
		}
	}
}

function initParticles() {
	var c = colors[int(random(colors.length))];
	
	for(let i = 0; i < n; i++) {
		particles.push(new Particle(maxR, s, c));
	}
}

class Particle {
  
  constructor(maxR_, s_, c_) {
    this.s = s_;
    this.c = c_;
    this.maxR = maxR_;
    
    this.life = 100;
    
    this.init();
  }
  
  init() {
    this.pos = p5.Vector.random2D();
    this.pos.normalize();
    this.pos.mult(random(2, maxR));

    this.vel = createVector();
  }

  show() {
    fill(this.c);
    ellipse(this.pos.x, this.pos.y, this.s, this.s);
    this.life -= 1;
  }
  
  move() {
    var angle = noise(this.pos.x / 400, this.pos.y / 400) * TAU;
    
    this.vel.set(cos(angle), sin(angle));
    this.vel.mult(0.3);
    this.pos.add(this.vel);
  }
  

  isDead() {
    var d = dist(this.pos.x, this.pos.y, 0, 0);
 
    if(d > this.maxR || this.life < 1) return true;
    else return false;
  }
}
  ''';
  static const String codeInteractiveNoiseP5 = r'''
let objs = [];
let objsNum = 360;
const noiseScale = 0.01;
let R;
let maxR;
let t = 0;
let nt = 0;
let nR = 0;
let nTheta = 1000;
const palette = ["#ACDEED55", "#EAD5E855", "#84C0E755", "#38439955"];

function setup() {
  createCanvas(windowWidth, windowHeight);
  angleMode(DEGREES);
  noStroke();

  maxR = max(width, height) * 0.45;

  background("#F5F4FD");
}

function draw() {
  let R = map(noise(nt * 0.01, nR), 0, 1, 0, maxR);
  let t = map(noise(nt * 0.001, nTheta), 0, 1, -360, 360);
  let x = R * cos(t) + width / 2;
  let y = R * sin(t) + height / 2;
  objs.push(new Obj(x, y));

  if (mouseIsPressed) {
    objs.push(new Obj(mouseX, mouseY));
  }

  for (let i = 0; i < objs.length; i++) {
    objs[i].move();

    objs[i].display();
  }

  for (let j = objs.length - 1; j >= 0; j--) {
    if (objs[j].isFinished()) {
      objs.splice(j, 1);
    }
  }

  // t++;
  nt++;
}

class Obj {
  constructor(ox, oy) {
    this.init(ox, oy);
  }

  init(ox, oy) {
    this.vel = createVector(0, 0);
    this.pos = createVector(ox, oy);
    this.t = random(0, noiseScale);
    this.lifeMax = random(20, 50);
    this.life = this.lifeMax;
    this.step = random(0.1, 0.5);
    this.dMax = random(10) >= 5 ? 10 : 30;
    this.d = this.dMax;
    this.c = color(random(palette));
  }

  move() {
    let theta = map(noise(this.pos.x * noiseScale, this.pos.y * noiseScale, this.t), 0, 1, -360, 360);
    this.vel.x = cos(theta);
    this.vel.y = sin(theta);
    this.pos.add(this.vel);
  }

  isFinished() {
    this.life -= this.step;
    this.d = map(this.life, 0, this.lifeMax, 0, this.dMax);
    if (this.life < 0) {
      return true;
    } else {
      return false;
    }
  }

  display() {
    fill(this.c);

    circle(this.pos.x, this.pos.y, this.d);
  }
}

function func(t, num) {
  let a = 360 / num;
  let A = cos(a);
  let b = acos(cos(num * t));
  let B = cos(a - b / num);

  return A / B;
}
  ''';
}
