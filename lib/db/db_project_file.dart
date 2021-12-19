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

  @HiveField(3)
  int type;

  @HiveField(4)
  int time;

  @HiveField(5)
  String htmlTemplate;

  DbProjectFile(
      {required this.name,
      required this.code,
      required this.type,
      required this.htmlTemplate,
      required this.time});
}

enum ProjectType { processing, p5js, py }
