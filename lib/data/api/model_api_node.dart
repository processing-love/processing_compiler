class ModeApiNode {
  ModeApiNode({
    String? name,
    ChildJson? childJson,
  }) {
    name = name;
    childJson = childJson;
  }

  ModeApiNode.fromJson(dynamic json) {
    name = json['name'];
    childJson = json['childJson'] != null
        ? ChildJson.fromJson(json['childJson'])
        : null;
  }

  String? name;
  ChildJson? childJson;
}

class ChildJson {
  ChildJson({
    String? name,
    String? brief,
    String? category,
    String? subcategory,
    String? type,
  }) {
    name = name;
    brief = brief;
    category = category;
    subcategory = subcategory;
    type = type;
  }

  ChildJson.fromJson(dynamic json) {
    name = json['name'];
    brief = json['brief'];
    category = json['category'];
    subcategory = json['subcategory'];
    type = json['type'];
  }

  String? name;
  String? brief;
  String? category;
  String? subcategory;
  String? type;
}
