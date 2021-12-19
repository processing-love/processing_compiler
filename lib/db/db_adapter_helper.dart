import 'package:hive_flutter/hive_flutter.dart';
import 'package:processing_compiler/compiler/p5.dart';
import 'package:processing_compiler/db/db_codemirror_config.dart';
import 'package:processing_compiler/db/db_project_file.dart';

/// @author u
/// @date 2020/6/12.

const String dbNameCodeMirrorConfig = 'db_code_mirror_config';
const String dbNameProjectFile = 'db_project_file';
late Box<DbCodeMirrorConfig> boxCodeMirrorConfig;
late Box<DbProjectFile> boxProjectFile;

class DbAdapterHelper {
  Future initAllAdapter() async {
    await Hive.initFlutter();
    Hive.registerAdapter(DbCodeMirrorConfigAdapter());
    Hive.registerAdapter(DbProjectFileAdapter());
    boxCodeMirrorConfig = await Hive.openBox<DbCodeMirrorConfig>(dbNameCodeMirrorConfig);
    boxProjectFile = await Hive.openBox<DbProjectFile>(dbNameProjectFile);
  }

  Future<DbProjectFile> getOrCreateProjectFile(
      String projectName, ProjectType projectType) async {
    final DbProjectFile? projectFile = boxProjectFile.get(projectName);
    if (projectFile == null) {
      String code;
      String htmlTemplate;
      switch (projectType.index) {
        case 0:
          code = gP5ExampleCode;
          htmlTemplate = 'assets/code_mirror.html';
          break;
        case 1:
          code = gP5ExampleCode;
          htmlTemplate = 'assets/code_mirror.html';
          break;
        case 2:
          code = gP5ExampleCode;
          htmlTemplate = 'assets/code_mirror.html';
          break;
        default:
          code = gP5ExampleCode;
          htmlTemplate = 'assets/code_mirror.html';
          break;
      }
      await boxProjectFile.put(
          projectName,
          DbProjectFile(
              name: projectName,
              code: code,
              htmlTemplate: htmlTemplate,
              type: projectType.index,
              time: DateTime.now().millisecondsSinceEpoch));
      return boxProjectFile.get(projectName)!;
    }
    return projectFile;
  }

}

DbAdapterHelper gAdapterHelper = DbAdapterHelper();
