import 'package:processing_compiler/db/db_project_file.dart';

class SampleState {
  SampleState() {
    ///Initialize variables
  }
}

class SampleCode {
  String name;

  String code;

  ProjectType projectType;

  String desc;

  String author;

  SampleCode(this.name, this.code, this.projectType, this.desc, this.author);

  static List<SampleCode> getSampleCodes() {
    return [
      SampleCode(
          '示例1',
          '''
      // By Roni Kaufman

let kMax; // maximal value for the parameter "k" of the blobs
let step = 0.01; // difference in time between two consecutive blobs
let n = 100; // total number of blobs
let radius = 0; // radius of the base circle
let inter = 0.05; // difference of base radii of two consecutive blobs
let maxNoise = 500; // maximal value for the parameter "noisiness" for the blobs

//let noiseProg = (x) => (x);

function setup() {
  createCanvas(windowWidth, windowHeight);
  colorMode(HSB, 1);
	angleMode(DEGREES);
  noFill();
	//noLoop();
	kMax = random(0.6, 1.0);
	noStroke();
}

function draw() {
  background(0.6, 0.75, 0.25);
  let t = frameCount/100;
  for (let i = n; i > 0; i--) {
		let alpha = 1 - (i / n);
		fill((alpha/5 + 0.75)%1, 1, 1, alpha);
		let size = radius + i * inter;
		let k = kMax * sqrt(i/n);
		let noisiness = maxNoise * (i / n);
    blob(size, width/2, height/2, k, t - i * step, noisiness);
  }
}

// Creates and draws a blob
// size is the radius (before noise) of the base circle
// (xCenter, yCenter) is the position of the center of the blob
// k is the tightness of the blob (0 = perfect circle, higher = more spiky)
// t is the time
// noisiness is the magnitude of the noise (i.e. how far it streches out)
function blob(size, xCenter, yCenter, k, t, noisiness) {
  beginShape();
	let angleStep = 360 / 10;
  for (let theta = 0; theta <= 360 + 2 * angleStep; theta += angleStep) {
    let r1, r2;
		/*
    if (theta < PI / 2) {
      r1 = cos(theta);
      r2 = 1;
    } else if (theta < PI) {
      r1 = 0;
      r2 = sin(theta);
    } else if (theta < 3 * PI / 2) {
      r1 = sin(theta);
      r2 = 0;
    } else {
      r1 = 1;
      r2 = cos(theta);
    }
		*/
		r1 = cos(theta)+1;
		r2 = sin(theta)+1; // +1 because it has to be positive for the function noise
    let r = size + noise(k * r1,  k * r2, t) * noisiness;
    let x = xCenter + r * cos(theta);
    let y = yCenter + r * sin(theta);
    curveVertex(x, y);
  }
  endShape();
}
      ''',
          ProjectType.p5js,
          "blob blob blob blob blob blob blob blob blob blob blob 噪音效果"
              "blob blob blob blob blob blob blob blob blob blob blob 噪音效果blob blob blob blob blob blob blob blob blob blob blob 噪音效果blob blob blob blob blob blob blob blob blob blob blob 噪音效果blob blob blob blob blob blob blob blob blob blob blob 噪音效果blob blob blob blob blob blob blob blob blob blob blob 噪音效果"
              "",
          'By Roni Kaufman'),
      SampleCode(
          '示例2',
          '''
      let w, h, num;
let url = "https://coolors.co/app/1a535c-4ecdc4-f7fff7-ff6b6b-ffe66d";
let pallete;

function setup() {
  createCanvas(windowWidth, windowHeight);
  angleMode(DEGREES);

  w = width * 5;
  h = height * 5;
  num = 40;
  pallete = createPallete(url);
}

function draw() {
  background(0, 0, 0, 10);
  push();
  translate(width / 2, height / 2);
  for (let i = 0; i < num; i++) {

    let f = frameCount / 100;
    let n = map(i, 0, num, 0, pallete.length);
    let current = int(n + f) % pallete.length;
    let next = ceil(n + f) % pallete.length;
    let fl = (f+ n) % 1;

    let c1 = color(pallete[current]);
    let c2 = color(pallete[next]);

    colorMode(RGB);
    let c = lerpColor(c1, c2, fl);


    let x = cos(frameCount * 2.5 + i * 8) * w / 15;
    let y = sin(frameCount * 1.5 + i * 10) * w / 15;
    let r = map(i, 0, num, w / 100, w / 2);
    drawRectWithHole(x, y, w, h, r, c);
  }
  pop();
}

function drawRectWithHole(_x, _y, _w, _h, _r, _c) {
  push();
  translate(_x, _y);
  fill(_c);
  noStroke();
  beginShape();
  vertex(-_w / 2, -_h / 2);
  vertex(_w / 2, -_h / 2);
  vertex(_w / 2, _h / 2);
  vertex(-_w / 2, _h / 2);

  beginContour();
  for (let angle = 0; angle > -360; angle -= 5) {
    let x = cos(angle) * _r / 2;
    let y = sin(angle) * _r / 2;
    vertex(x, y);
  }
  endContour();
  endShape(CLOSE);
  pop();
}

function createPallete(_url) {
  let slash_index = _url.lastIndexOf('/');
  let pallate_str = _url.slice(slash_index + 1);
  let arr = pallate_str.split('-');
  for (let i = 0; i < arr.length; i++) {
    arr[i] = '#' + arr[i];
  }
  return arr;
}
      ''',
          ProjectType.p5js,
          '彩条一样，不知道怎么说',
          'by Richard Bourne')
    ];
  }
}
