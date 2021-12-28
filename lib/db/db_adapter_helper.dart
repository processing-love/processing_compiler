import 'package:hive_flutter/hive_flutter.dart';
import 'package:processing_compiler/compiler/p5.dart';
import 'package:processing_compiler/compiler/processing_js.dart';
import 'package:processing_compiler/db/db_code_mirror_config.dart';
import 'package:processing_compiler/db/db_project_file.dart';

/// @author u
/// @date 2020/6/12.

const String dbNameCodeMirrorConfig = 'db_code_mirror_config';
const String dbNameProjectFile = 'db_project_file';
const String dbNameTheme = 'db_theme';
late Box<DbCodeMirrorConfig> boxCodeMirrorConfig;
late Box<DbProjectFile> boxProjectFile;

class DbAdapterHelper {
  Future initAllAdapter() async {
    await Hive.initFlutter();
    Hive.registerAdapter(DbCodeMirrorConfigAdapter());
    Hive.registerAdapter(DbProjectFileAdapter());
    boxCodeMirrorConfig =
        await Hive.openBox<DbCodeMirrorConfig>(dbNameCodeMirrorConfig);
    boxProjectFile = await Hive.openBox<DbProjectFile>(dbNameProjectFile,
        keyComparator: (dynamic key1, dynamic key2) {
      return key2.compareTo(key1);
    });

    if (boxCodeMirrorConfig.isEmpty) {
      await boxCodeMirrorConfig.put(
          dbNameCodeMirrorConfig, DbCodeMirrorConfig());
    }
  }

  Future<DbProjectFile> getOrCreateProjectFile(
      String projectName, ProjectType projectType) async {
    final DbProjectFile? projectFile = boxProjectFile.get(projectName);
    if (projectFile == null) {
      String code;
      switch (projectType) {
        case ProjectType.processing:
          code = gProcessingExample;
          break;
        case ProjectType.p5js: // javascript
          code = gP5ExampleCode;
          break;
        case ProjectType.py: // python
          code = gPyExampleCode;
          break;
        default:
          code = gProcessingExample;
          break;
      }
      final nameKey = DateTime.now().millisecondsSinceEpoch.toString();
      await boxProjectFile.put(
          nameKey,
          DbProjectFile(
              nameKey: nameKey,
              name: projectName,
              code: code,
              projectType: projectType.index,
              modifyTime: DateTime.now().millisecondsSinceEpoch));
      return boxProjectFile.get(nameKey)!;
    }
    return projectFile;
  }
}

DbAdapterHelper gAdapterHelper = DbAdapterHelper();
