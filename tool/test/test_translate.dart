import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:processing_compiler/devices/all_language.dart';
import 'package:processing_compiler/tools/string_ex.dart';

/// @author u
/// @date 2020/6/12.
void main() async {
  var query = '';
  // 手动加国家化语言的描述
  for (var element in gSupportLanguages) {
    gAllSupportLanguage['zh']?.addAll({element.desc: element.desc});
  }

  gAllSupportLanguage['zh']?.forEach((key, value) {
    if (gAllSupportLanguage['zh']?.keys.last == key) {
      query += value;
    } else {
      query += value + "\n";
    }
  });
  File file = File('message.json');
  if (file.existsSync()) {
    file.deleteSync();
  }
  file.createSync();
  for (var language in gSupportLanguages) {
    await translate(language.code, query, file);
  }
  message.message['zh'] = gAllSupportLanguage['zh']!;
  file.writeAsStringSync(jsonEncode(message), mode: FileMode.append);
}

final data = {};
final message = Message();
String jsonString = '';

translate(String to, String query, File file) async {
  const String appID = '20211220001033802';
  const String secretKey = 'lMq3VpBvPEN7hDEEnFnR';
  var salt = DateTime.now().millisecondsSinceEpoch.toString();
  var result = appID + query + salt + secretKey;
  var sign = md5.convert(utf8.encode(result)).toString();
  HttpClient httpClient = HttpClient();
  var url = Uri.parse("http://api.fanyi.baidu.com/"
      "api/trans/vip/translate?"
      "q=$query&"
      "from=auto&"
      "to=$to&"
      "appid=$appID&"
      "salt=$salt&"
      "sign=$sign");
  var request = await httpClient.getUrl(url);
  var response = await request.close();
  if (response.statusCode == 200) {
    var responseBody = await response.transform(utf8.decoder).join();
    var data = json.decode(responseBody) as Map<String, dynamic>;
    List<dynamic> results = data['trans_result'];
    final keyValue = {};
    for (int index = 0; index < results.length; index++) {
      final key = gAllSupportLanguage['zh']!.keys.toList()[index];
      keyValue[key] = results[index]['dst'].toString().capitalize();
    }
    message.message[to] = keyValue;
  }
}

class Message {
  Map<String, Map> message = {};

  Message();

  Map toJson() {
    Map map = {};
    for (var element in message.keys) {
      map[element] = message[element];
    }
    return map;
  }
}
