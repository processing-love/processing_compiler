import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:processing_compiler/data/api/api_details_json.dart';
import 'package:processing_compiler/data/api/model_api_node.dart';
import 'package:processing_compiler/data/api/model_api_node_details.dart';
import 'package:processing_compiler/data/processing_json.dart';

/// @author u
/// @date 2020/6/12.

int nullValue = 0;

class ApiNodesFetch {
  static Future<Iterable<ModeApiNode>> getApiNodes() async {
    return await compute(getJsonApiNotes, nullValue);
  }

  static Future<ModelApiNodeDetails> getApiDetailNode(String name) async {
    return await compute(getJsonApiDetailNote, name);
  }
}

List<ModeApiNode> getJsonApiNotes(int index) {
  var result = json.decode(processingApiNodesJson);
  final List nodes = result['result']['data']['items']['nodes'];
  return nodes.map((nodeJson) => ModeApiNode.fromJson(nodeJson)).toList();
}

ModelApiNodeDetails getJsonApiDetailNote(String name) {
  String apiDetailNodeJson = ApiDetailsJson().details[name] ?? '';
  var result = json.decode(apiDetailNodeJson);
  return ModelApiNodeDetails.fromJson(result);
}