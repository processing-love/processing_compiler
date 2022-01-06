/// json : {"name":"Array","title":"Array","author":"","description":"An array is a list of data. Each piece of data in an array \n  is identified by an index number representing its position in \n  the array. Arrays are zero based, which means that the first \n  element in the array is [0], the second element is [1], and so on. \n  In this example, an array named \"coswave\" is created and\n  filled with the cosine values. This data is displayed three \n  separate ways on the screen.","featured":["Array","cos_"]}
/// pdes : {"nodes":[{"name":"Array","internal":{"content":"/**\n * Array. \n * \n * An array is a list of data. Each piece of data in an array \n * is identified by an index number representing its position in \n * the array. Arrays are zero based, which means that the first \n * element in the array is [0], the second element is [1], and so on. \n * In this example, an array named \"coswave\" is created and\n * filled with the cosine values. This data is displayed three \n * separate ways on the screen.  \n */\n\n\nfloat[] coswave; \n\nvoid setup() {\n  size(640, 360);\n  coswave = new float[width];\n  for (int i = 0; i < width; i++) {\n    float amount = map(i, 0, width, 0, PI);\n    coswave[i] = abs(cos(amount));\n  }\n  background(255);\n  noLoop();\n}\n\nvoid draw() {\n\n  int y1 = 0;\n  int y2 = height/3;\n  for (int i = 0; i < width; i++) {\n    stroke(coswave[i]*255);\n    line(i, y1, i, y2);\n  }\n\n  y1 = y2;\n  y2 = y1 + y1;\n  for (int i = 0; i < width; i++) {\n    stroke(coswave[i]*255 / 4);\n    line(i, y1, i, y2);\n  }\n  \n  y1 = y2;\n  y2 = height;\n  for (int i = 0; i < width; i++) {\n    stroke(255 - coswave[i]*255);\n    line(i, y1, i, y2);\n  }\n  \n}\n"}}]}
/// liveSketch : {"name":"liveSketch","childRawCode":{"content":"function runLiveSketch(s) {\n  var coswave;\n\n  s.setup = () => {\n    s.createCanvas(640, 360);\n    coswave = [];\n    for (var i = 0; i < s.width; i++) {\n      var amount = s.map(i, 0, s.width, 0, s.PI);\n      coswave[i] = s.abs(s.cos(amount));\n    }\n    s.background(255);\n    s.noLoop();\n  };\n\n  s.draw = () => {\n    var y1 = 0;\n    var y2 = s.height / 3;\n    for (var i = 0; i < s.width; i += 2) {\n      s.stroke(coswave[i] * 255);\n      s.line(i, y1, i, y2);\n    }\n\n    y1 = y2;\n    y2 = y1 + y1;\n    for (var i = 0; i < s.width; i += 2) {\n      s.stroke((coswave[i] * 255) / 4);\n      s.line(i, y1, i, y2);\n    }\n\n    y1 = y2;\n    y2 = s.height;\n    for (var i = 0; i < s.width; i += 2) {\n      s.stroke(255 - coswave[i] * 255);\n      s.line(i, y1, i, y2);\n    }\n  };\n}\n"}}

class ModelExampleNode {
  ModelExampleNode({
    Json? json,
    Pdes? pdes,
    LiveSketch? liveSketch,
  }) {
    _json = json;
    _pdes = pdes;
    _liveSketch = liveSketch;
  }

  ModelExampleNode.fromJson(dynamic json) {
    _json = json['json'] != null ? Json.fromJson(json['json']) : null;
    _pdes = json['pdes'] != null ? Pdes.fromJson(json['pdes']) : null;
    _liveSketch = json['liveSketch'] != null
        ? LiveSketch.fromJson(json['liveSketch'])
        : null;
  }

  Json? _json;
  Pdes? _pdes;
  LiveSketch? _liveSketch;

  Json? get json => _json;

  Pdes? get pdes => _pdes;

  LiveSketch? get liveSketch => _liveSketch;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_json != null) {
      map['json'] = _json?.toJson();
    }
    if (_pdes != null) {
      map['pdes'] = _pdes?.toJson();
    }
    if (_liveSketch != null) {
      map['liveSketch'] = _liveSketch?.toJson();
    }
    return map;
  }
}

/// name : "liveSketch"
/// childRawCode : {"content":"function runLiveSketch(s) {\n  var coswave;\n\n  s.setup = () => {\n    s.createCanvas(640, 360);\n    coswave = [];\n    for (var i = 0; i < s.width; i++) {\n      var amount = s.map(i, 0, s.width, 0, s.PI);\n      coswave[i] = s.abs(s.cos(amount));\n    }\n    s.background(255);\n    s.noLoop();\n  };\n\n  s.draw = () => {\n    var y1 = 0;\n    var y2 = s.height / 3;\n    for (var i = 0; i < s.width; i += 2) {\n      s.stroke(coswave[i] * 255);\n      s.line(i, y1, i, y2);\n    }\n\n    y1 = y2;\n    y2 = y1 + y1;\n    for (var i = 0; i < s.width; i += 2) {\n      s.stroke((coswave[i] * 255) / 4);\n      s.line(i, y1, i, y2);\n    }\n\n    y1 = y2;\n    y2 = s.height;\n    for (var i = 0; i < s.width; i += 2) {\n      s.stroke(255 - coswave[i] * 255);\n      s.line(i, y1, i, y2);\n    }\n  };\n}\n"}

class LiveSketch {
  LiveSketch({
    String? name,
    ChildRawCode? childRawCode,
  }) {
    _name = name;
    _childRawCode = childRawCode;
  }

  LiveSketch.fromJson(dynamic json) {
    _name = json['name'];
    _childRawCode = json['childRawCode'] != null
        ? ChildRawCode.fromJson(json['childRawCode'])
        : null;
  }

  String? _name;
  ChildRawCode? _childRawCode;

  String? get name => _name;

  ChildRawCode? get childRawCode => _childRawCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    if (_childRawCode != null) {
      map['childRawCode'] = _childRawCode?.toJson();
    }
    return map;
  }
}

/// content : "function runLiveSketch(s) {\n  var coswave;\n\n  s.setup = () => {\n    s.createCanvas(640, 360);\n    coswave = [];\n    for (var i = 0; i < s.width; i++) {\n      var amount = s.map(i, 0, s.width, 0, s.PI);\n      coswave[i] = s.abs(s.cos(amount));\n    }\n    s.background(255);\n    s.noLoop();\n  };\n\n  s.draw = () => {\n    var y1 = 0;\n    var y2 = s.height / 3;\n    for (var i = 0; i < s.width; i += 2) {\n      s.stroke(coswave[i] * 255);\n      s.line(i, y1, i, y2);\n    }\n\n    y1 = y2;\n    y2 = y1 + y1;\n    for (var i = 0; i < s.width; i += 2) {\n      s.stroke((coswave[i] * 255) / 4);\n      s.line(i, y1, i, y2);\n    }\n\n    y1 = y2;\n    y2 = s.height;\n    for (var i = 0; i < s.width; i += 2) {\n      s.stroke(255 - coswave[i] * 255);\n      s.line(i, y1, i, y2);\n    }\n  };\n}\n"

class ChildRawCode {
  ChildRawCode({
    String? content,
  }) {
    _content = content;
  }

  ChildRawCode.fromJson(dynamic json) {
    _content = json['content'];
  }

  String? _content;

  String? get content => _content;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['content'] = _content;
    return map;
  }
}

/// nodes : [{"name":"Array","internal":{"content":"/**\n * Array. \n * \n * An array is a list of data. Each piece of data in an array \n * is identified by an index number representing its position in \n * the array. Arrays are zero based, which means that the first \n * element in the array is [0], the second element is [1], and so on. \n * In this example, an array named \"coswave\" is created and\n * filled with the cosine values. This data is displayed three \n * separate ways on the screen.  \n */\n\n\nfloat[] coswave; \n\nvoid setup() {\n  size(640, 360);\n  coswave = new float[width];\n  for (int i = 0; i < width; i++) {\n    float amount = map(i, 0, width, 0, PI);\n    coswave[i] = abs(cos(amount));\n  }\n  background(255);\n  noLoop();\n}\n\nvoid draw() {\n\n  int y1 = 0;\n  int y2 = height/3;\n  for (int i = 0; i < width; i++) {\n    stroke(coswave[i]*255);\n    line(i, y1, i, y2);\n  }\n\n  y1 = y2;\n  y2 = y1 + y1;\n  for (int i = 0; i < width; i++) {\n    stroke(coswave[i]*255 / 4);\n    line(i, y1, i, y2);\n  }\n  \n  y1 = y2;\n  y2 = height;\n  for (int i = 0; i < width; i++) {\n    stroke(255 - coswave[i]*255);\n    line(i, y1, i, y2);\n  }\n  \n}\n"}}]

class Pdes {
  Pdes({
    List<Nodes>? nodes,
  }) {
    _nodes = nodes;
  }

  Pdes.fromJson(dynamic json) {
    if (json['nodes'] != null) {
      _nodes = [];
      json['nodes'].forEach((v) {
        _nodes?.add(Nodes.fromJson(v));
      });
    }
  }

  List<Nodes>? _nodes;

  List<Nodes>? get nodes => _nodes;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_nodes != null) {
      map['nodes'] = _nodes?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// name : "Array"
/// internal : {"content":"/**\n * Array. \n * \n * An array is a list of data. Each piece of data in an array \n * is identified by an index number representing its position in \n * the array. Arrays are zero based, which means that the first \n * element in the array is [0], the second element is [1], and so on. \n * In this example, an array named \"coswave\" is created and\n * filled with the cosine values. This data is displayed three \n * separate ways on the screen.  \n */\n\n\nfloat[] coswave; \n\nvoid setup() {\n  size(640, 360);\n  coswave = new float[width];\n  for (int i = 0; i < width; i++) {\n    float amount = map(i, 0, width, 0, PI);\n    coswave[i] = abs(cos(amount));\n  }\n  background(255);\n  noLoop();\n}\n\nvoid draw() {\n\n  int y1 = 0;\n  int y2 = height/3;\n  for (int i = 0; i < width; i++) {\n    stroke(coswave[i]*255);\n    line(i, y1, i, y2);\n  }\n\n  y1 = y2;\n  y2 = y1 + y1;\n  for (int i = 0; i < width; i++) {\n    stroke(coswave[i]*255 / 4);\n    line(i, y1, i, y2);\n  }\n  \n  y1 = y2;\n  y2 = height;\n  for (int i = 0; i < width; i++) {\n    stroke(255 - coswave[i]*255);\n    line(i, y1, i, y2);\n  }\n  \n}\n"}

class Nodes {
  Nodes({
    String? name,
    Internal? internal,
  }) {
    _name = name;
    _internal = internal;
  }

  Nodes.fromJson(dynamic json) {
    _name = json['name'];
    _internal =
        json['internal'] != null ? Internal.fromJson(json['internal']) : null;
  }

  String? _name;
  Internal? _internal;

  String? get name => _name;

  Internal? get internal => _internal;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    if (_internal != null) {
      map['internal'] = _internal?.toJson();
    }
    return map;
  }
}

/// content : "/**\n * Array. \n * \n * An array is a list of data. Each piece of data in an array \n * is identified by an index number representing its position in \n * the array. Arrays are zero based, which means that the first \n * element in the array is [0], the second element is [1], and so on. \n * In this example, an array named \"coswave\" is created and\n * filled with the cosine values. This data is displayed three \n * separate ways on the screen.  \n */\n\n\nfloat[] coswave; \n\nvoid setup() {\n  size(640, 360);\n  coswave = new float[width];\n  for (int i = 0; i < width; i++) {\n    float amount = map(i, 0, width, 0, PI);\n    coswave[i] = abs(cos(amount));\n  }\n  background(255);\n  noLoop();\n}\n\nvoid draw() {\n\n  int y1 = 0;\n  int y2 = height/3;\n  for (int i = 0; i < width; i++) {\n    stroke(coswave[i]*255);\n    line(i, y1, i, y2);\n  }\n\n  y1 = y2;\n  y2 = y1 + y1;\n  for (int i = 0; i < width; i++) {\n    stroke(coswave[i]*255 / 4);\n    line(i, y1, i, y2);\n  }\n  \n  y1 = y2;\n  y2 = height;\n  for (int i = 0; i < width; i++) {\n    stroke(255 - coswave[i]*255);\n    line(i, y1, i, y2);\n  }\n  \n}\n"

class Internal {
  Internal({
    String? content,
  }) {
    _content = content;
  }

  Internal.fromJson(dynamic json) {
    _content = json['content'];
  }

  String? _content;

  String? get content => _content;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['content'] = _content;
    return map;
  }
}

/// name : "Array"
/// title : "Array"
/// author : ""
/// description : "An array is a list of data. Each piece of data in an array \n  is identified by an index number representing its position in \n  the array. Arrays are zero based, which means that the first \n  element in the array is [0], the second element is [1], and so on. \n  In this example, an array named \"coswave\" is created and\n  filled with the cosine values. This data is displayed three \n  separate ways on the screen."
/// featured : ["Array","cos_"]

class Json {
  Json({
    String? name,
    String? title,
    String? author,
    String? description,
    List<String>? featured,
  }) {
    _name = name;
    _title = title;
    _author = author;
    _description = description;
    _featured = featured;
  }

  Json.fromJson(dynamic json) {
    _name = json['name'];
    _title = json['title'];
    _author = json['author'];
    _description = json['description'];
    _featured = json['featured'] != null ? json['featured'].cast<String>() : [];
  }

  String? _name;
  String? _title;
  String? _author;
  String? _description;
  List<String>? _featured;

  String? get name => _name;

  String? get title => _title;

  String? get author => _author;

  String? get description => _description;

  List<String>? get featured => _featured;

  String? buildFeatured() {
    return featured
            ?.map((e) {
              if (e.contains("_")) {
                List<String> result = e.split("_");
                final data = <String>[];
                for (int index = 0; index < result.length; index++) {
                  if (index == 0) {
                    data.add(result[index] + " ");
                  } else {
                    data.add(result[index] + "()");
                  }
                }
                return data.join("");
              }
              return e;
            })
            .toList()
            .join("\n") ??
        '';
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['title'] = _title;
    map['author'] = _author;
    map['description'] = _description;
    map['featured'] = _featured;
    return map;
  }
}
