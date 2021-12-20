import 'package:get/get.dart';
import 'package:timeago/timeago.dart';

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
          'china_bbs': 'Processing 中文社区',
          'official_bbs': 'Processing 官方社区',
          'create': '创建',
          'cancel': '取消',
          'new_project': '请输入新项目的名称',
          'delete': '删除',
          'config_delete': '您确定删除x吗 ？',
          'tip': '温馨提示',
          'limit_project_name_length': '项目名称不能超过15个字符',
          'limit_project_name_exist': '该项目已经存在，请重新输入新的项目名称',
          'please_input_project_name': '项目名称不能为空'
        }
      };
}

class DateMessage {
  final Map<String, LookupMessages> lookupMessagesMap = {
    'en': EnMessages(),
    'es': EsMessages(),
    'zh': ZhCnMessages()
  };

  void buildCurrentDateMessage() {
    final language = Get.locale?.languageCode;
    setLocaleMessages(language ?? 'zh', lookupMessagesMap[language] ?? ZhMessages());
    setDefaultLocale(language ?? 'zh');
  }
}
