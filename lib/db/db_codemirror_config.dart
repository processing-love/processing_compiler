import 'package:hive_flutter/hive_flutter.dart';
part 'db_codemirror_config.g.dart';

/// @author u
/// @date 2020/6/12.
@HiveType(typeId: 0)
class DbCodeMirrorConfig extends HiveObject {
  @HiveField(0)
  bool? showCodeLineNumber;

  @HiveField(1)
  double? codeFontSize;

  DbCodeMirrorConfig({this.showCodeLineNumber = true, this.codeFontSize = 13});
}
