import 'package:hive_flutter/hive_flutter.dart';
import 'package:processing_compiler/db/db_codemirror_config.dart';
import 'package:processing_compiler/db/db_project_raw_code.dart';

/// @author u
/// @date 2020/6/12.

const String dbNameCodeMirrorConfig = 'db_code_mirror_config';
const String dbNameCodeMirrorTheme = 'db_code_mirror_theme';
const String dbNameCodeMirrorRemoteLibrary = 'db_code_mirror_theme';
late Box<DbCodeMirrorConfig> boxCodeMirrorConfig;
late Box boxCodeMirrorTheme;
late Box boxCodeMirrorRemoteLibrary;

class DbAdapterHelper {
  Future initAllAdapter() async {
    await Hive.initFlutter();
    Hive.registerAdapter(DbCodeMirrorConfigAdapter());
    Hive.registerAdapter(DbProjectRawCodeAdapter());
    boxCodeMirrorConfig = await Hive.openBox<DbCodeMirrorConfig>(dbNameCodeMirrorConfig);
    boxCodeMirrorTheme = await Hive.openBox(dbNameCodeMirrorTheme);
    boxCodeMirrorRemoteLibrary = await Hive.openBox(dbNameCodeMirrorRemoteLibrary);
  }
}
