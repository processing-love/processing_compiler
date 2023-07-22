/// @author u
/// @date 2020/6/12.

const String gP5Html = r'''
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name=viewport
          content="width=device-width, initial-scale=1.0,
          minimum-scale=1.0 maximum-scale=1.0,
          user-scalable=no viewport-fit=cover">
    <title>Processing Compiler</title>
    <link rel="stylesheet" href="https://codemirror.net/lib/codemirror.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/3024-day.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/3024-night.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/abbott.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/abcdef.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/ambiance.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/ayu-dark.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/ayu-mirage.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/base16-dark.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/bespin.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/base16-light.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/blackboard.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/cobalt.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/colorforth.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/dracula.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/duotone-dark.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/duotone-light.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/eclipse.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/elegant.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/erlang-dark.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/gruvbox-dark.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/hopscotch.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/icecoder.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/isotope.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/juejin.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/lesser-dark.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/liquibyte.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/lucario.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/material.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/material-darker.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/material-palenight.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/material-ocean.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/mbo.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/mdn-like.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/midnight.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/monokai.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/moxer.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/neat.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/neo.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/night.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/nord.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/oceanic-next.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/panda-syntax.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/paraiso-dark.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/paraiso-light.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/pastel-on-dark.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/railscasts.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/rubyblue.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/seti.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/shadowfox.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/solarized.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/the-matrix.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/tomorrow-night-bright.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/tomorrow-night-eighties.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/ttcn.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/twilight.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/vibrant-ink.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/xq-dark.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/xq-light.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/yeti.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/idea.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/darcula.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/yonce.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/zenburn.css">

    <link rel="stylesheet" href="https://cdn.staticfile.org/codemirror/5.65.13/addon/hint/show-hint.css">

    <style>
        body {
            margin: 0px;
            padding: 0px;
            width: 100vw;
            height: 100vh;
            overflow: hidden;
        }
    </style>
</head>
<body>
<script src="https://cdn.staticfile.org/codemirror/5.65.13/codemirror.min.js"></script>
<script src="https://cdn.staticfile.org/codemirror/5.65.13/mode/javascript/javascript.min.js"></script>
<script src="https://cdn.staticfile.org/codemirror/5.65.13/addon/selection/active-line.min.js"></script>
<script src="https://cdn.staticfile.org/codemirror/5.65.13/addon/edit/matchbrackets.min.js"></script>
<script src="https://cdn.staticfile.org/codemirror/5.65.13/addon/edit/closebrackets.min.js"></script>
<script src="https://cdn.staticfile.org/codemirror/5.65.13/addon/edit/closetag.min.js"></script>

<script src="https://cdn.staticfile.org/codemirror/5.65.13/addon/hint/show-hint.min.js"></script>

<script type="text/javascript">
<-script->
    const element = document.querySelector('body');
    const editor = CodeMirror(element, {
        lineNumbers: true,
        lineWrapping: true,
        styleActiveLine: true,
        styleActiveSelected: true,
        // mode: "text/x-java",
        smartIndent: true,
        matchTags: true,
        matchBrackets: this.matchBrackets || true,
        gutters: [
            "CodeMirror-linenumbers",
            "CodeMirror-foldgutter",
        ],
        autoCloseBrackets: true,
        autoCloseTags: true,
        autoMatchParens: true,
        gutter: true,
        tabSize: 4,
        hintOptions: {
            completeSingle: false,
        },
        indentWithTabs: true,
        indent: true,
        foldGutter: true,
        autofocus: true,
        tabMode: "indent",
        dragDrop: true, // 没用过，不知道
        theme: 'material',
        value: 'function draw() {}',
        mode: "javascript",
    });

    editor.on("inputRead", () => {
        editor.showHint();
    });
    editor.refresh();
</script>
</body>
</html>
''';


const String gP5HtmlWeb = r'''
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name=viewport
          content="width=device-width, initial-scale=1.0,
          minimum-scale=1.0 maximum-scale=1.0,
          user-scalable=no viewport-fit=cover">
    <title>Processing Compiler</title>
    <link rel="stylesheet" href="https://codemirror.net/lib/codemirror.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/3024-day.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/3024-night.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/abbott.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/abcdef.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/ambiance.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/ayu-dark.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/ayu-mirage.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/base16-dark.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/bespin.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/base16-light.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/blackboard.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/cobalt.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/colorforth.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/dracula.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/duotone-dark.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/duotone-light.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/eclipse.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/elegant.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/erlang-dark.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/gruvbox-dark.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/hopscotch.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/icecoder.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/isotope.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/juejin.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/lesser-dark.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/liquibyte.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/lucario.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/material.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/material-darker.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/material-palenight.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/material-ocean.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/mbo.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/mdn-like.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/midnight.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/monokai.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/moxer.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/neat.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/neo.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/night.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/nord.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/oceanic-next.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/panda-syntax.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/paraiso-dark.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/paraiso-light.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/pastel-on-dark.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/railscasts.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/rubyblue.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/seti.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/shadowfox.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/solarized.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/the-matrix.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/tomorrow-night-bright.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/tomorrow-night-eighties.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/ttcn.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/twilight.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/vibrant-ink.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/xq-dark.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/xq-light.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/yeti.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/idea.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/darcula.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/yonce.css">
    <link rel="stylesheet" href="https://codemirror.net/theme/zenburn.css">

    <link rel="stylesheet" href="https://cdn.staticfile.org/codemirror/5.65.13/addon/hint/show-hint.css">

    <style>
        body {
            margin: 0px;
            padding: 0px;
            width: 100vw;
            height: 100vh;
            overflow: hidden;
        }
    </style>
</head>
<body>
<script src="https://cdn.staticfile.org/codemirror/5.65.13/codemirror.min.js"></script>
<script src="https://cdn.staticfile.org/codemirror/5.65.13/mode/javascript/javascript.min.js"></script>
<script src="https://cdn.staticfile.org/codemirror/5.65.13/addon/selection/active-line.min.js"></script>
<script src="https://cdn.staticfile.org/codemirror/5.65.13/addon/edit/matchbrackets.min.js"></script>
<script src="https://cdn.staticfile.org/codemirror/5.65.13/addon/edit/closebrackets.min.js"></script>
<script src="https://cdn.staticfile.org/codemirror/5.65.13/addon/edit/closetag.min.js"></script>

<script src="https://cdn.staticfile.org/codemirror/5.65.13/addon/hint/show-hint.min.js"></script>


<script type="text/javascript">
<-script->
    const element = document.querySelector('body');
    const editor = CodeMirror(element, {
        lineNumbers: true,
        lineWrapping: true,
        styleActiveLine: true,
        styleActiveSelected: true,
        // mode: "text/x-java",
        smartIndent: true,
        matchTags: true,
        matchBrackets: this.matchBrackets || true,
        gutters: [
            "CodeMirror-linenumbers",
            "CodeMirror-foldgutter",
        ],
        autoCloseBrackets: true,
        autoCloseTags: true,
        autoMatchParens: true,
        gutter: true,
        tabSize: 4,
        hintOptions: {
            completeSingle: false,
        },
        indentWithTabs: true,
        indent: true,
        foldGutter: true,
        autofocus: true,
        tabMode: "indent",
        dragDrop: true, // 没用过，不知道
        theme: 'material',
        value: 'function draw() {}',
        mode: "javascript",
    });

    editor.on("inputRead", () => {
        let words = editor.getValue() + "";
        words = words.replace(/[a-z]+[\-|\']+[a-z]+/ig, '').match(/([a-z]+)/ig);
        CodeMirror.ukeys = words;
        editor.showHint();
    });

    editor.refresh();
</script>
</body>
</html>

''';

