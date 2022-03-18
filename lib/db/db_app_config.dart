import 'package:hive_flutter/hive_flutter.dart';

part 'db_app_config.g.dart';

/// @author u
/// @date 2020/6/12.
@HiveType(typeId: 2)
class DbAppConfig extends HiveObject {
  @HiveField(0)
  bool isFirstConfig;

  DbAppConfig({required this.isFirstConfig});
}
