import 'package:hive/hive.dart';

part 'project_model.g.dart';

@HiveType(typeId: 1)
class ProjectModel {
  @HiveField(0)
  late String id;

  @HiveField(1)
  late String name;

  @HiveField(2)
  late int currentLine;

  @HiveField(3)
  late Map<int, int> lines;

  ProjectModel({
    required this.id,
    required this.name,
    required this.currentLine,
    required this.lines,
  });
}
