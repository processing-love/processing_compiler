import 'package:get/get.dart';
import 'package:processing_compiler/db/db_adapter_helper.dart';

/// @author u
/// @date 2020/6/12.

class EditorProvider extends GetConnect {
  Future<Response> getSingleThemeCSS(String themeName) async {
    final response = await get('https://cdn.staticfile.org/codemirror/5.64.0/$themeName.min.css');
    if (response.isOk) {
      boxCodeMirrorTheme.put(themeName, response.bodyString.toString());
    }
    return response;
  }
}