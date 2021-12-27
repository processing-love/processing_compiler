import 'package:hive_flutter/hive_flutter.dart';

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
