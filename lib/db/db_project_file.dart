import 'package:hive_flutter/hive_flutter.dart';
import 'package:processing_compiler/compiler/p5.dart';
import 'package:processing_compiler/compiler/processing_js.dart';

part 'db_project_file.g.dart';

/// @author u
/// @date 2020/6/12.
@HiveType(typeId: 1)
class DbProjectFile extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  String code;

  @HiveField(2)
  int projectType;

  @HiveField(3)
  int modifyTime;

  @HiveField(4)
  String? nameKey;

  DbProjectFile(
      {required this.nameKey,
      required this.name,
      required this.code,
      required this.projectType,
      required this.modifyTime});
}

enum ProjectType { processing, p5js, py }

class ProjectTypeHelper {
  static ProjectType getValue(int type) {
    switch (type) {
      case 0:
        return ProjectType.processing;
      case 1:
        return ProjectType.p5js;
      case 2:
        return ProjectType.py;
      default:
        return ProjectType.processing;
    }
  }

  static String getMode(int type) {
    ProjectType projectType = getValue(type);
    switch (projectType) {
      case ProjectType.processing:
        return 'text/x-java';
      case ProjectType.p5js:
        return 'javascript';
      case ProjectType.py:
        return "python";
      default:
        return 'text/x-java';
    }
  }

  static String getFullHtml(int type, String code) {
    final projectType = getValue(type);
    switch (projectType) {
      case ProjectType.processing:
        return gGetProcessingJsPreviewHtml(code);
      case ProjectType.p5js:
        return gGetP5PreviewHtml(code);
      case ProjectType.py:
        return gGetProcessingJsPreviewHtml(code);
      default:
        return gGetProcessingJsPreviewHtml(code);
    }
  }
}
