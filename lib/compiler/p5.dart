/// @author u
/// @date 2020/6/12.
const String p5PreviewHTML = '''
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Processing review</title>
    <meta name=viewport
      content="width=device-width, initial-scale=1.0,
      minimum-scale=1.0 maximum-scale=1.0,
      user-scalable=no viewport-fit=cover">
    <style>
       body, html {
          margin: 0;
          padding: 0;
          width: 100vw;
          height: 100vh;
          overflow: hidden;
          -moz-user-select:none; /* Firefox私有属性 */
          -webkit-user-select:none; /* WebKit内核私有属性 */
          -webkit-touch-callout: none; /* 当在iOS上一直按住一个目标元素时 */
          -ms-user-select:none; /* IE私有属性(IE10及以后) */
          -khtml-user-select:none; /* KHTML内核私有属性 */
          -o-user-select:none; /* Opera私有属性 */
          user-select:none; /* CSS3属性 */
       }        
    </style>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/p5.js/1.4.0/p5.min.js"></script>
    <script>
      document.body.addEventListener('touchmove', function (e) {
      if (e._isScroller)
        return;
      e.preventDefault();
      }, { passive: false}
      );
    window.onerror = function(message,url,line,column,error) {
      // console.log('log---onerror::::',message, url, line, column, error);
      ErrorMessageInvoker.postMessage(message.toString());
    }
    <-js->
    </script>
</head>
<body>
</body>
</html>
''';

const String gP5ExampleCode = '''
function setup() {
  createCanvas(windowWidth, windowHeight);
}

function draw() {
  if (mouseIsPressed) {
    fill(0);
  } else {
    fill(255);
  }
  if (mouseX > 0 && mouseY > 0) {
    ellipse(mouseX, mouseY, 80, 80);
  }
}
''';

const String gP5ExampleFontCode = '''
function setup() {
  createCanvas(400, 400);
}

function draw() {
  background(220);
  ellipse(50,50,80,80);
}
''';