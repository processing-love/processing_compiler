import 'package:hive_flutter/hive_flutter.dart';
import 'package:processing_compiler/compiler/p5.dart';
import 'package:processing_compiler/compiler/processing_js.dart';
import 'package:processing_compiler/db/db_app_config.dart';
import 'package:processing_compiler/db/db_code_mirror_config.dart';
import 'package:processing_compiler/db/db_pre_config.dart';
import 'package:processing_compiler/db/db_project_file.dart';

/// @author u
/// @date 2020/6/12.

const String dbNameCodeMirrorConfig = 'db_code_mirror_config';
const String dbNameProjectFile = 'db_project_file';
const String dbNameTheme = 'db_theme';
const String dbVersion = 'db_version';
const String dbNameSearchRecord = 'db_search_record';
const String dbNameAppConfig = 'db_app_config';
late Box<DbCodeMirrorConfig> boxCodeMirrorConfig;
late Box<DbProjectFile> boxProjectFile;
late Box<DbAppConfig> boxAppConfig;
late Box boxVersion;
const String currentBoxVersion = '1';

class DbAdapterHelper {
  Future initAllAdapter() async {
    await Hive.initFlutter();
    Hive.registerAdapter(DbCodeMirrorConfigAdapter());
    Hive.registerAdapter(DbProjectFileAdapter());
    Hive.registerAdapter(DbAppConfigAdapter());
    boxCodeMirrorConfig = await Hive.openBox<DbCodeMirrorConfig>(dbNameCodeMirrorConfig);
    boxProjectFile = await Hive.openBox<DbProjectFile>(dbNameProjectFile);
    boxAppConfig = await Hive.openBox<DbAppConfig>(dbNameAppConfig);
    boxVersion = await Hive.openBox(dbVersion);
    String version = boxVersion.get('currentVersion', defaultValue: "1");
    if (version.compareTo(currentBoxVersion) > 0) {
      // version update
    }
    if (boxCodeMirrorConfig.isEmpty) {
      await boxCodeMirrorConfig.put(dbNameCodeMirrorConfig, DbCodeMirrorConfig());
    }

    await DbPreConfig.loadDefaultAppConfig();
  }

  Future<DbProjectFile> getOrCreateProjectFile(String projectName, ProjectType projectType) async {
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
          nameKey, DbProjectFile(nameKey: nameKey, name: projectName, code: code, projectType: projectType.index, modifyTime: DateTime.now().millisecondsSinceEpoch));
      return boxProjectFile.get(nameKey)!;
    }
    return projectFile;
  }
}

DbAdapterHelper gAdapterHelper = DbAdapterHelper();
