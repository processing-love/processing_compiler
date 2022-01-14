import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:processing_compiler/devices/all_language.dart';
import 'package:processing_compiler/tools/string_ex.dart';

import '../test/test_translate.dart';
import 'sample.dart';

/// @author u
/// @date 2020/6/12.

void main() async {
  for (var language in gSupportLanguages) {
  }
  await translate('en', Sample().info['zh']);
  File file = File('tool/store/app_desc.json');
  file.writeAsStringSync(jsonEncode(message));
  print('peter 翻译结束 ');
}

final data = {};
final message = Message();

translate(String to, String query) async {
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
  print('peter 翻译 statue ' + to + " " + response.statusCode.toString());
  if (response.statusCode == 200) {
    var responseBody = await response.transform(utf8.decoder).join();
    var data = json.decode(responseBody) as Map<String, dynamic>;
    List<dynamic> results = data['trans_result'];
    final keyValue = {};
    print('peter result ' + data.toString());
    for (int index = 0; index < results.length; index++) {
      final key = gAllSupportLanguage['zh']!.keys.toList()[index];
      keyValue[key] = results[index]['dst'].toString().capitalize();
    }
    message.message[to] = keyValue;
  }
}
