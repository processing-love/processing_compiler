import 'package:get/get.dart';

/// @author u
/// @date 2020/6/12.
class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'zh_CN': {
          'app_name': 'Processing',
          'create_project': '创建一个新项目',
          'create_processing': '新建Processing项目',
          'create_p5': '新建p5.js项目',
          'create_python': '新建Processing.py项目',
          'editor_setting': '编辑器设置',
          'setting': '设置',
          'show_code_line_number': '显示代码行号',
          'setting_code_font_size': '设置代码字体大小',
          'code_theme': '编辑器风格',
          'emtpy_pro': '开启您的创意编程吧 !',
          'loading': '加载中 ...',
          'slide_setting_font_size': '滑动手指进行字体大小设置',
          'project': '项目',
          'sample': '示例',
          'knowledge': '知识库',
          'createTimeDesc': '创建时间：',
          'china_bbs': 'Processing中文社区',
          'official_bbs': 'Processing官方社区'
        }
      };
}
