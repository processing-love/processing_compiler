import 'package:get/get.dart';

/// @author u
/// @date 2020/6/12.
class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'zh_CN': {
          'app_name': 'Processing Compiler',
          'create_project': '创建一个新项目',
          'create_processing': '新建Processing项目',
          'create_p5': '新建P5.js项目',
          'create_python': '新建python项目',
          'setting': '设置',
          'show_code_line_number': '显示代码行号',
          'setting_code_font_size': '设置代码字体大小',
          'code_theme':'主题风格'
        }
      };
}
