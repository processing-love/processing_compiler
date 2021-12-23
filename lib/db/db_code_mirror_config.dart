import 'package:hive_flutter/hive_flutter.dart';

part 'db_code_mirror_config.g.dart';

/// @author u
/// @date 2020/6/12.
@HiveType(typeId: 0)
class DbCodeMirrorConfig extends HiveObject {
  @HiveField(0)
  bool showCodeLineNumber;

  @HiveField(1)
  double codeFontSize;

  @HiveField(2)
  String codeThemeName;

  @HiveField(3)
  String? language;

  DbCodeMirrorConfig(
      {this.showCodeLineNumber = true,
      this.codeFontSize = 13,
      this.codeThemeName = 'material'});
}
