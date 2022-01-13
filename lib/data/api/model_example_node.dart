class ModelExampleNode {
  ModelExampleNode.fromJson(dynamic json) {
    _examples = json['examples'] != null
        ? ExampleNodes.fromJson(json['examples'])
        : null;
    _images =
        json['images'] != null ? ImageNode.fromJson(json['images']) : null;
  }

  ExampleNodes? _examples;
  ImageNode? _images;

  ExampleNodes? get examples => _examples;

  ImageNode? get images => _images;
}

class ImageNode {
  ImageNode({
    List<ImageDescNodes>? nodes,
  }) {
    _nodes = nodes;
  }

  ImageNode.fromJson(dynamic json) {
    if (json['nodes'] != null) {
      _nodes = [];
      json['nodes'].forEach((v) {
        _nodes?.add(ImageDescNodes.fromJson(v));
      });
    }
  }

  List<ImageDescNodes>? _nodes;

  List<ImageDescNodes>? get nodes => _nodes;
}

class ImageDescNodes {
  ImageDescNodes({
    String? name,
    String? relativeDirectory,
    ChildImageSharp? childImageSharp,
  }) {
    _name = name;
    _relativeDirectory = relativeDirectory;
    _childImageSharp = childImageSharp;
  }

  ImageDescNodes.fromJson(dynamic json) {
    _name = json['name'];
    _relativeDirectory = json['relativeDirectory'];
    _childImageSharp = json['childImageSharp'] != null
        ? ChildImageSharp.fromJson(json['childImageSharp'])
        : null;
  }

  String? _name;
  String? _relativeDirectory;
  ChildImageSharp? _childImageSharp;

  String? get name => _name;

  String? get relativeDirectory => _relativeDirectory;

  ChildImageSharp? get childImageSharp => _childImageSharp;
}

class ChildImageSharp {
  ChildImageSharp({
    GatsbyImageData? gatsbyImageData,
  }) {
    _gatsbyImageData = gatsbyImageData;
  }

  ChildImageSharp.fromJson(dynamic json) {
    _gatsbyImageData = json['gatsbyImageData'] != null
        ? GatsbyImageData.fromJson(json['gatsbyImageData'])
        : null;
  }

  GatsbyImageData? _gatsbyImageData;

  GatsbyImageData? get gatsbyImageData => _gatsbyImageData;
}

class GatsbyImageData {

  GatsbyImageData.fromJson(dynamic json) {
    _layout = json['layout'];
    _backgroundColor = json['backgroundColor'];
    _images =
        json['images'] != null ? Images.fromJson(json['images']) : null;
    _width = json['width'];
    _height = json['height'];
  }

  String? _layout;
  String? _backgroundColor;
  Images? _images;
  int? _width;
  int? _height;

  String? get layout => _layout;

  String? get backgroundColor => _backgroundColor;

  Images? get images => _images;

  int? get width => _width;

  int? get height => _height;
}

class Images {
  Images({
    Fallback? fallback,
    List<Sources>? sources,
  }) {
    _fallback = fallback;
    _sources = sources;
  }

  Images.fromJson(dynamic json) {
    _fallback =
        json['fallback'] != null ? Fallback.fromJson(json['fallback']) : null;
    if (json['sources'] != null) {
      _sources = [];
      json['sources'].forEach((v) {
        _sources?.add(Sources.fromJson(v));
      });
    }
  }

  Fallback? _fallback;
  List<Sources>? _sources;

  Fallback? get fallback => _fallback;

  List<Sources>? get sources => _sources;
}

/// srcSet : "/static/94f6712bde2d56e16ea252dc9223f8d5/b2036/Histogram.webp 100w,\n/static/94f6712bde2d56e16ea252dc9223f8d5/b6124/Histogram.webp 200w,\n/static/94f6712bde2d56e16ea252dc9223f8d5/dff21/Histogram.webp 400w,\n/static/94f6712bde2d56e16ea252dc9223f8d5/b2a35/Histogram.webp 800w"
/// type : "image/webp"
/// sizes : "(min-width: 400px) 400px, 100vw"

class Sources {
  Sources({
    String? srcSet,
    String? type,
    String? sizes,
  }) {
    _srcSet = srcSet;
    _type = type;
    _sizes = sizes;
  }

  Sources.fromJson(dynamic json) {
    _srcSet = json['srcSet'];
    _type = json['type'];
    _sizes = json['sizes'];
  }

  String? _srcSet;
  String? _type;
  String? _sizes;

  String? get srcSet => _srcSet;

  String? get type => _type;

  String? get sizes => _sizes;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['srcSet'] = _srcSet;
    map['type'] = _type;
    map['sizes'] = _sizes;
    return map;
  }
}

/// src : "/static/94f6712bde2d56e16ea252dc9223f8d5/aeb79/Histogram.png"
/// srcSet : "/static/94f6712bde2d56e16ea252dc9223f8d5/c636e/Histogram.png 100w,\n/static/94f6712bde2d56e16ea252dc9223f8d5/a1453/Histogram.png 200w,\n/static/94f6712bde2d56e16ea252dc9223f8d5/aeb79/Histogram.png 400w,\n/static/94f6712bde2d56e16ea252dc9223f8d5/47126/Histogram.png 800w"
/// sizes : "(min-width: 400px) 400px, 100vw"

class Fallback {
  Fallback({
    String? src,
    String? srcSet,
    String? sizes,
  }) {
    _src = src;
    _srcSet = srcSet;
    _sizes = sizes;
  }

  Fallback.fromJson(dynamic json) {
    _src = json['src'];
    _srcSet = json['srcSet'];
    _sizes = json['sizes'];
  }

  String? _src;
  String? _srcSet;
  String? _sizes;

  String? get src => _src;

  String? get srcSet => _srcSet;

  String? get sizes => _sizes;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['src'] = _src;
    map['srcSet'] = _srcSet;
    map['sizes'] = _sizes;
    return map;
  }
}

/// nodes : [{"name":"VectorMath","relativeDirectory":"Topics/Vectors/VectorMath","childJson":{"name":"Vector Math","title":"Vector","order":"1","level":"Intermediate"}}]

class ExampleNodes {
  ExampleNodes.fromJson(dynamic json) {
    if (json['nodes'] != null) {
      _nodes = [];
      json['nodes'].forEach((v) {
        _nodes?.add(ExampleNode.fromJson(v));
      });
    }
  }

  List<ExampleNode>? _nodes;

  List<ExampleNode>? get nodes => _nodes;
}

class ExampleNode {
  ExampleNode({
    String? name,
    String? relativeDirectory,
    ChildJson? childJson,
  }) {
    _name = name;
    _relativeDirectory = relativeDirectory;
    _childJson = childJson;
  }

  ExampleNode.fromJson(dynamic json) {
    _name = json['name'];
    _relativeDirectory = json['relativeDirectory'];
    _childJson = json['childJson'] != null
        ? ChildJson.fromJson(json['childJson'])
        : null;
  }

  String? _name;
  String? _relativeDirectory;
  ChildJson? _childJson;

  String? get name => _name;

  String? get relativeDirectory => _relativeDirectory;

  ChildJson? get childJson => _childJson;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['relativeDirectory'] = _relativeDirectory;
    if (_childJson != null) {
      map['childJson'] = _childJson?.toJson();
    }
    return map;
  }
}

/// name : "Vector Math"
/// title : "Vector"
/// order : "1"
/// level : "Intermediate"

class ChildJson {
  ChildJson({
    String? name,
    String? title,
    String? order,
    String? level,
  }) {
    _name = name;
    _title = title;
    _order = order;
    _level = level;
  }

  ChildJson.fromJson(dynamic json) {
    _name = json['name'];
    _title = json['title'];
    _order = json['order'];
    _level = json['level'];
  }

  String? _name;
  String? _title;
  String? _order;
  String? _level;

  String? get name => _name;

  String? get title => _title;

  String? get order => _order;

  String? get level => _level;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['title'] = _title;
    map['order'] = _order;
    map['level'] = _level;
    return map;
  }
}
