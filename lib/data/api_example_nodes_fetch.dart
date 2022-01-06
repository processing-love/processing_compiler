import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:processing_compiler/data/api/api_example_details_json.dart';
import 'package:processing_compiler/data/api/model_example_node.dart';

/// @author u
/// @date 2020/6/12.

int nullValue = 0;

class ApiExampleNodesFetch {
  static Future<Iterable<ModelExampleNode>> getApiExampleNodes() async {
    return await compute(getJsonApiExampleNotes, nullValue);
  }
}

List<ModelExampleNode> getJsonApiExampleNotes(int index) {
  return ApiExampleDetailsJson().details.values.map((e) {
    final jsonMap = jsonDecode(e);
    return ModelExampleNode.fromJson(jsonMap);
  }).toList();
}
