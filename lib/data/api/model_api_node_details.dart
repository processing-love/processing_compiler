/// json : {"name":"PVector","description":"A class to describe a two or three dimensional vector, specifically a\n Euclidean (also known as geometric) vector. A vector is an entity that has\n both magnitude and direction. The datatype, however, stores the components of\n the vector (x,y for 2D, and x,y,z for 3D). The magnitude and direction can be\n accessed via the methods <b>mag()</b> and <b>heading()</b>.<br />\n <br />\n In many of the Processing examples, you will see <b>PVector</b> used to\n describe a position, velocity, or acceleration. For example, if you consider\n a rectangle moving across the screen, at any given instant it has a position\n (a vector that points from the origin to its location), a velocity (the rate\n at which the object's position changes per time unit, expressed as a vector),\n and acceleration (the rate at which the object's velocity changes per time\n unit, expressed as a vector). Since vectors represent groupings of values, we\n cannot simply use traditional addition/multiplication/etc. Instead, we'll\n need to do some \"vector\" math, which is made easy by the methods inside the\n <b>PVector</b> class.\n\n ","constructors":["PVector()","PVector(x, y, z)","PVector(x, y)"],"category":"math","subcategory":"","classFields":[{"anchor":"PVector_x","name":"x","desc":"The x component of the vector"},{"anchor":"PVector_y","name":"y","desc":"The y component of the vector"},{"anchor":"PVector_z","name":"z","desc":"The z component of the vector"}],"methods":[{"anchor":"PVector_set_","name":"set()","desc":"Set the components of the vector"},{"anchor":"PVector_random2D_","name":"random2D()","desc":"Make a new 2D unit vector with a random direction"},{"anchor":"PVector_random3D_","name":"random3D()","desc":"Make a new 3D unit vector with a random direction"},{"anchor":"PVector_fromAngle_","name":"fromAngle()","desc":"Make a new 2D unit vector from an angle"},{"anchor":"PVector_copy_","name":"copy()","desc":"Get a copy of the vector"},{"anchor":"PVector_mag_","name":"mag()","desc":"Calculate the magnitude of the vector"},{"anchor":"PVector_magSq_","name":"magSq()","desc":"Calculate the magnitude of the vector, squared"},{"anchor":"PVector_add_","name":"add()","desc":"Adds x, y, and z components to a vector, one vector to another, or\n           two independent vectors"},{"anchor":"PVector_sub_","name":"sub()","desc":"Subtract x, y, and z components from a vector, one vector from\n           another, or two independent vectors"},{"anchor":"PVector_mult_","name":"mult()","desc":"Multiply a vector by a scalar"},{"anchor":"PVector_div_","name":"div()","desc":"Divide a vector by a scalar"},{"anchor":"PVector_dist_","name":"dist()","desc":"Calculate the distance between two points"},{"anchor":"PVector_dot_","name":"dot()","desc":"Calculate the dot product of two vectors"},{"anchor":"PVector_cross_","name":"cross()","desc":"Calculate and return the cross product"},{"anchor":"PVector_normalize_","name":"normalize()","desc":"Normalize the vector to a length of 1"},{"anchor":"PVector_limit_","name":"limit()","desc":"Limit the magnitude of the vector"},{"anchor":"PVector_setMag_","name":"setMag()","desc":"Set the magnitude of the vector"},{"anchor":"PVector_heading_","name":"heading()","desc":"Calculate the angle of rotation for this vector"},{"anchor":"PVector_rotate_","name":"rotate()","desc":"Rotate the vector by an angle (2D only)"},{"anchor":"PVector_lerp_","name":"lerp()","desc":"Linear interpolate the vector to another vector"},{"anchor":"PVector_angleBetween_","name":"angleBetween()","desc":"Calculate and return the angle between two vectors"},{"anchor":"PVector_array_","name":"array()","desc":"Return a representation of the vector as a float array"}],"related":[],"parameters":[{"name":"x","description":"the x coordinate."},{"name":"y","description":"the y coordinate."},{"name":"z","description":"the z coordinate."}]}
/// pdes : {"edges":[{"node":{"name":"PVector_0","internal":{"content":"PVector v1, v2;\n\nvoid setup() {\n  noLoop();\n  v1 = new PVector(40, 20);\n  v2 = new PVector(25, 50); \n}\n\nvoid draw() {\n  ellipse(v1.x, v1.y, 12, 12);\n  ellipse(v2.x, v2.y, 12, 12);\n  v2.add(v1);\n  ellipse(v2.x, v2.y, 24, 24);\n}\n"},"extension":"pde"}}]}

class ModelApiNodeDetails {
  ModelApiNodeDetails({
      Json? json, 
      Pdes? pdes,}){
    _json = json;
    _pdes = pdes;
}

  ModelApiNodeDetails.fromJson(dynamic json) {
    _json = json['json'] != null ? Json.fromJson(json['json']) : null;
    _pdes = json['pdes'] != null ? Pdes.fromJson(json['pdes']) : null;
  }
  Json? _json;
  Pdes? _pdes;

  Json? get json => _json;
  Pdes? get pdes => _pdes;
}

/// edges : [{"node":{"name":"PVector_0","internal":{"content":"PVector v1, v2;\n\nvoid setup() {\n  noLoop();\n  v1 = new PVector(40, 20);\n  v2 = new PVector(25, 50); \n}\n\nvoid draw() {\n  ellipse(v1.x, v1.y, 12, 12);\n  ellipse(v2.x, v2.y, 12, 12);\n  v2.add(v1);\n  ellipse(v2.x, v2.y, 24, 24);\n}\n"},"extension":"pde"}}]

class Pdes {
  Pdes({
      List<Edges>? edges,}){
    _edges = edges;
}

  Pdes.fromJson(dynamic json) {
    if (json['edges'] != null) {
      _edges = [];
      json['edges'].forEach((v) {
        _edges?.add(Edges.fromJson(v));
      });
    }
  }
  List<Edges>? _edges;

  List<Edges>? get edges => _edges;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_edges != null) {
      map['edges'] = _edges?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// node : {"name":"PVector_0","internal":{"content":"PVector v1, v2;\n\nvoid setup() {\n  noLoop();\n  v1 = new PVector(40, 20);\n  v2 = new PVector(25, 50); \n}\n\nvoid draw() {\n  ellipse(v1.x, v1.y, 12, 12);\n  ellipse(v2.x, v2.y, 12, 12);\n  v2.add(v1);\n  ellipse(v2.x, v2.y, 24, 24);\n}\n"},"extension":"pde"}

class Edges {
  Edges({
      Node? node,}){
    _node = node;
}

  Edges.fromJson(dynamic json) {
    _node = json['node'] != null ? Node.fromJson(json['node']) : null;
  }
  Node? _node;

  Node? get node => _node;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_node != null) {
      map['node'] = _node?.toJson();
    }
    return map;
  }

}

/// name : "PVector_0"
/// internal : {"content":"PVector v1, v2;\n\nvoid setup() {\n  noLoop();\n  v1 = new PVector(40, 20);\n  v2 = new PVector(25, 50); \n}\n\nvoid draw() {\n  ellipse(v1.x, v1.y, 12, 12);\n  ellipse(v2.x, v2.y, 12, 12);\n  v2.add(v1);\n  ellipse(v2.x, v2.y, 24, 24);\n}\n"}
/// extension : "pde"

class Node {
  Node({
      String? name, 
      Internal? internal, 
      String? extension,}){
    _name = name;
    _internal = internal;
    _extension = extension;
}

  Node.fromJson(dynamic json) {
    _name = json['name'];
    _internal = json['internal'] != null ? Internal.fromJson(json['internal']) : null;
    _extension = json['extension'];
  }
  String? _name;
  Internal? _internal;
  String? _extension;

  String? get name => _name;
  Internal? get internal => _internal;
  String? get extension => _extension;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    if (_internal != null) {
      map['internal'] = _internal?.toJson();
    }
    map['extension'] = _extension;
    return map;
  }

}

/// content : "PVector v1, v2;\n\nvoid setup() {\n  noLoop();\n  v1 = new PVector(40, 20);\n  v2 = new PVector(25, 50); \n}\n\nvoid draw() {\n  ellipse(v1.x, v1.y, 12, 12);\n  ellipse(v2.x, v2.y, 12, 12);\n  v2.add(v1);\n  ellipse(v2.x, v2.y, 24, 24);\n}\n"

class Internal {
  Internal({
      String? content,}){
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

/// name : "PVector"
/// description : "A class to describe a two or three dimensional vector, specifically a\n Euclidean (also known as geometric) vector. A vector is an entity that has\n both magnitude and direction. The datatype, however, stores the components of\n the vector (x,y for 2D, and x,y,z for 3D). The magnitude and direction can be\n accessed via the methods <b>mag()</b> and <b>heading()</b>.<br />\n <br />\n In many of the Processing examples, you will see <b>PVector</b> used to\n describe a position, velocity, or acceleration. For example, if you consider\n a rectangle moving across the screen, at any given instant it has a position\n (a vector that points from the origin to its location), a velocity (the rate\n at which the object's position changes per time unit, expressed as a vector),\n and acceleration (the rate at which the object's velocity changes per time\n unit, expressed as a vector). Since vectors represent groupings of values, we\n cannot simply use traditional addition/multiplication/etc. Instead, we'll\n need to do some \"vector\" math, which is made easy by the methods inside the\n <b>PVector</b> class.\n\n "
/// constructors : ["PVector()","PVector(x, y, z)","PVector(x, y)"]
/// category : "math"
/// subcategory : ""
/// classFields : [{"anchor":"PVector_x","name":"x","desc":"The x component of the vector"},{"anchor":"PVector_y","name":"y","desc":"The y component of the vector"},{"anchor":"PVector_z","name":"z","desc":"The z component of the vector"}]
/// methods : [{"anchor":"PVector_set_","name":"set()","desc":"Set the components of the vector"},{"anchor":"PVector_random2D_","name":"random2D()","desc":"Make a new 2D unit vector with a random direction"},{"anchor":"PVector_random3D_","name":"random3D()","desc":"Make a new 3D unit vector with a random direction"},{"anchor":"PVector_fromAngle_","name":"fromAngle()","desc":"Make a new 2D unit vector from an angle"},{"anchor":"PVector_copy_","name":"copy()","desc":"Get a copy of the vector"},{"anchor":"PVector_mag_","name":"mag()","desc":"Calculate the magnitude of the vector"},{"anchor":"PVector_magSq_","name":"magSq()","desc":"Calculate the magnitude of the vector, squared"},{"anchor":"PVector_add_","name":"add()","desc":"Adds x, y, and z components to a vector, one vector to another, or\n           two independent vectors"},{"anchor":"PVector_sub_","name":"sub()","desc":"Subtract x, y, and z components from a vector, one vector from\n           another, or two independent vectors"},{"anchor":"PVector_mult_","name":"mult()","desc":"Multiply a vector by a scalar"},{"anchor":"PVector_div_","name":"div()","desc":"Divide a vector by a scalar"},{"anchor":"PVector_dist_","name":"dist()","desc":"Calculate the distance between two points"},{"anchor":"PVector_dot_","name":"dot()","desc":"Calculate the dot product of two vectors"},{"anchor":"PVector_cross_","name":"cross()","desc":"Calculate and return the cross product"},{"anchor":"PVector_normalize_","name":"normalize()","desc":"Normalize the vector to a length of 1"},{"anchor":"PVector_limit_","name":"limit()","desc":"Limit the magnitude of the vector"},{"anchor":"PVector_setMag_","name":"setMag()","desc":"Set the magnitude of the vector"},{"anchor":"PVector_heading_","name":"heading()","desc":"Calculate the angle of rotation for this vector"},{"anchor":"PVector_rotate_","name":"rotate()","desc":"Rotate the vector by an angle (2D only)"},{"anchor":"PVector_lerp_","name":"lerp()","desc":"Linear interpolate the vector to another vector"},{"anchor":"PVector_angleBetween_","name":"angleBetween()","desc":"Calculate and return the angle between two vectors"},{"anchor":"PVector_array_","name":"array()","desc":"Return a representation of the vector as a float array"}]
/// related : []
/// parameters : [{"name":"x","description":"the x coordinate."},{"name":"y","description":"the y coordinate."},{"name":"z","description":"the z coordinate."}]

class Json {

  Json.fromJson(dynamic json) {
    _name = json['name'];
    _description = json['description'];
    _constructors = json['constructors'] != null ? json['constructors'].cast<String>() : [];
    _category = json['category'];
    _subcategory = json['subcategory'];
    _syntax = json['syntax'] != null ? json['syntax'].cast<String>() : [];
    if (json['classFields'] != null) {
      _classFields = [];
      json['classFields'].forEach((v) {
        _classFields?.add(ClassFields.fromJson(v));
      });
    }
    if (json['methods'] != null) {
      _methods = [];
      json['methods'].forEach((v) {
        _methods?.add(Methods.fromJson(v));
      });
    }
    if (json['parameters'] != null) {
      _parameters = [];
      json['parameters'].forEach((v) {
        _parameters?.add(Parameters.fromJson(v));
      });
    }
  }
  String? _name;
  String? _description;
  List<String>? _constructors;
  String? _category;
  String? _subcategory;
  List<String>?  _syntax;
  List<ClassFields>? _classFields;
  List<Methods>? _methods;
  List<Parameters>? _parameters;

  String? get name => _name;
  String? get description => _description;
  List<String>? get constructors => _constructors;
  String? get category => _category;
  String? get subcategory => _subcategory;
  List<String>? get syntax => _syntax;
  List<ClassFields>? get classFields => _classFields;
  List<Methods>? get methods => _methods;
  List<Parameters>? get parameters => _parameters;
}

/// name : "x"
/// description : "the x coordinate."

class Parameters {
  Parameters({
      String? name, 
      String? description,}){
    _name = name;
    _description = description;
}

  Parameters.fromJson(dynamic json) {
    _name = json['name'];
    _description = json['description'];
  }
  String? _name;
  String? _description;

  String? get name => _name;
  String? get description => _description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['description'] = _description;
    return map;
  }

}

/// anchor : "PVector_set_"
/// name : "set()"
/// desc : "Set the components of the vector"

class Methods {
  Methods({
      String? anchor, 
      String? name, 
      String? desc,}){
    _anchor = anchor;
    _name = name;
    _desc = desc;
}

  Methods.fromJson(dynamic json) {
    _anchor = json['anchor'];
    _name = json['name'];
    _desc = json['desc'];
  }
  String? _anchor;
  String? _name;
  String? _desc;

  String? get anchor => _anchor;
  String? get name => _name;
  String? get desc => _desc;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['anchor'] = _anchor;
    map['name'] = _name;
    map['desc'] = _desc;
    return map;
  }

}

/// anchor : "PVector_x"
/// name : "x"
/// desc : "The x component of the vector"

class ClassFields {
  ClassFields({
      String? anchor, 
      String? name, 
      String? desc,}){
    _anchor = anchor;
    _name = name;
    _desc = desc;
}

  ClassFields.fromJson(dynamic json) {
    _anchor = json['anchor'];
    _name = json['name'];
    _desc = json['desc'];
  }
  String? _anchor;
  String? _name;
  String? _desc;

  String? get anchor => _anchor;
  String? get name => _name;
  String? get desc => _desc;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['anchor'] = _anchor;
    map['name'] = _name;
    map['desc'] = _desc;
    return map;
  }
}