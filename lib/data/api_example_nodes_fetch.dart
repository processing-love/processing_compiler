import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:processing_compiler/data/api/api_example_details_json.dart';
import 'package:processing_compiler/data/api/model_example_detail_node.dart';
import 'package:processing_compiler/data/api/model_example_node.dart';
import 'package:processing_compiler/data/processing_json.dart';

/// @author u
/// @date 2020/6/12.

int nullValue = 0;

class ApiExampleNodesFetch {
  static Future<Iterable<ModelExampleDetailNode>> getApiExampleDetailNodes() async {
    return await compute(getJsonApiExampleDetailNotes, nullValue);
  }

  static Future<Map<String, ImageDescNodes?>> getApiExampleNodes() async {
    return await compute(getJsonApiExampleNotes, nullValue);
  }
}

List<ModelExampleDetailNode> getJsonApiExampleDetailNotes(int index) {
  return ApiExampleDetailNodesJson().details.values.map((e) {
    final jsonMap = jsonDecode(e);
    return ModelExampleDetailNode.fromJson(jsonMap);
  }).toList();
}

Map<String, ImageDescNodes?> getJsonApiExampleNotes(int index) {
  final map = jsonDecode(processingExampleNodesJson);
  // https://processing.org/page-data/examples/page-data.json
  final ExampleNodes? nodes = ModelExampleNode.fromJson(map['result']['data']).examples;
  final ImageNode? imageNodes = ModelExampleNode.fromJson(map['result']['data']).images;
  final dataMap = <String, ImageDescNodes?>{};
  nodes?.nodes?.forEach((element) {
    final String key = element.name ?? '';
    final String nameKey = element.childJson?.title ?? '';
    ImageDescNodes? imageNode = imageNodes?.nodes?.firstWhere((element) => element.name == key);
    dataMap[nameKey] = imageNode;
  });
  return dataMap;
}
