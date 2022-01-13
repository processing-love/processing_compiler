import 'dart:convert';
import 'dart:io';

import 'package:processing_compiler/data/processing_json.dart';

/// @author u
/// @date 2020/6/12.

File apiDetailsJsonFile = File(
    '/Users/u/code/demo/flutter/processing_compiler/lib/data/api/api_details_json.dart');
File apiExampleDetailsJsonFile = File(
    '/Users/u/code/demo/flutter/processing_compiler/lib/data/api/api_example_details_json.dart');
File failFile = File('./test/api_details_fail.dart');

Future<void> main() async {
  handlerExampleDetails();
}

handlerExampleDetails() async {
  if (apiExampleDetailsJsonFile.existsSync()) {
    apiExampleDetailsJsonFile.deleteSync();
  }

  if (failFile.existsSync()) {
    failFile.deleteSync();
  }
  apiExampleDetailsJsonFile.createSync();
  failFile.createSync();
  var apiNodes = jsonDecode(processingExampleDetailNodesJson);
  List result = apiNodes['examples']['nodes'];
  for (var element in result) {
    String name = element['childJson']['name'];
    String wName = name.toLowerCase().split(" ").join("");
    await httpExampleDetailsRequest(name,wName);
  }

  String apiDetailsDartTemp = '''
  class ApiExampleDetailNodesJson {
  Map<String, String> details = {
    $content
  };
}
  ''';
  apiExampleDetailsJsonFile.writeAsStringSync(apiDetailsDartTemp,
      mode: FileMode.append);
}

handlerApiDetails() async {
  if (apiDetailsJsonFile.existsSync()) {
    apiDetailsJsonFile.deleteSync();
  }

  if (failFile.existsSync()) {
    failFile.deleteSync();
  }
  apiDetailsJsonFile.createSync();
  failFile.createSync();
  var apiNodes = jsonDecode(processingApiNodesJson);
  List result = apiNodes['result']['data']['items']['nodes'];
  for (var element in result) {
    String name = element['name'];
    await httpRequest(name);
  }

  String apiDetailsDartTemp = '''
  class ApiDetailsJson {
  Map<String, String> details = {
    $content
  };
}
  ''';
  apiDetailsJsonFile.writeAsStringSync(apiDetailsDartTemp,
      mode: FileMode.append);
}

httpExampleDetailsRequest(String name, String wName) async {
  HttpClient httpClient = HttpClient();
  var request = await httpClient.getUrl(Uri.parse(
      "https://processing.org/page-data/examples/$wName.html/page-data.json"));
  var response = await request.close();

  if (response.statusCode == 200) {
    var responseBody = await response.transform(utf8.decoder).join();
    var data = json.decode(responseBody) as Map<String, dynamic>;
    Map nodeDetails = data['result']['data'];
    Map selfNeed = {
      'json': nodeDetails['example']['childJson'],
      'pdes': nodeDetails['pdes'],
      'liveSketch': nodeDetails['liveSketch']
    };
    print('peter 成功了 ' + request.uri.toString());
    writeDartFile(name, json.encode(selfNeed));
  } else {
    print('peter 失败了 ' + name.toString());
    failFile.writeAsStringSync(name + " \n", mode: FileMode.append);
  }
}

httpRequest(String name) async {
  HttpClient httpClient = HttpClient();
  var request = await httpClient.getUrl(Uri.parse(
      "https://processing.org/page-data/reference/$name.html/page-data.json"));
  var response = await request.close();

  if (response.statusCode == 200) {
    var responseBody = await response.transform(utf8.decoder).join();
    var data = json.decode(responseBody) as Map<String, dynamic>;
    Map nodeDetails = data['result']['data'];
    Map selfNeed = {
      'json': nodeDetails['json']['childJson'],
      'pdes': nodeDetails['pdes']
    };
    print('peter 成功了 ' + request.uri.toString());
    writeDartFile(name, json.encode(selfNeed));
  } else {
    print('peter 失败了 ' + name.toString());
    failFile.writeAsStringSync(name + " \n", mode: FileMode.append);
  }
}

String content = '';

writeDartFile(String name, String json) {
  content += '\'$name\':  r\'\'\' $json \'\'\',';
}
