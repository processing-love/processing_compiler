import 'package:hive_flutter/hive_flutter.dart';
part 'db_project_raw_code.g.dart';
/// @author u
/// @date 2020/6/12.
@HiveType(typeId: 1)
class DbProjectRawCode extends HiveObject {

  @HiveField(0)
  int? createTime;

  @HiveField(1)
  String? rawCode;

  DbProjectRawCode({this.createTime, this.rawCode});
}