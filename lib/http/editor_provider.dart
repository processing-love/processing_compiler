import 'package:get/get.dart';
import 'package:processing_compiler/editor/logic.dart';

/// @author u
/// @date 2020/6/12.
class EditorProvider extends GetConnect {
  Future<Response> getCodeThemeCSS(String themeName) async {
    final response = await get('https://codemirror.net/theme/$themeName.css');
    if (response.isOk) {
      print('peter csss' + response.bodyString.toString());
      final logic = Get.put(EditorLogic());
      logic.setCodeTheme(themeName,response.bodyString.toString());
    }
    return response;
  }
}
