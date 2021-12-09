import 'package:hive_flutter/hive_flutter.dart';
import 'package:processing_compiler/db/db_codemirror_config.dart';
import 'package:processing_compiler/db/db_project_raw_code.dart';

/// @author u
/// @date 2020/6/12.

const String dbNameCodeMirrorConfig = 'db_codemirror_config';

late Box<DbCodeMirrorConfig> boxCodeMirrorConfig;

class DbAdapterHelper {
  initAllAdapter() async {
    await Hive.initFlutter();
    Hive.registerAdapter(DbCodeMirrorConfigAdapter());
    Hive.registerAdapter(DbProjectRawCodeAdapter());
    boxCodeMirrorConfig = await Hive.openBox<DbCodeMirrorConfig>(dbNameCodeMirrorConfig);
  }
}
