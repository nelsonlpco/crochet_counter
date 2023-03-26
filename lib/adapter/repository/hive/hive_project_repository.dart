import 'package:crochet_counter/adapter/repository/hive/model/project_model.dart';
import 'package:crochet_counter/core/domain/project/project_entity.dart';
import 'package:crochet_counter/core/domain/project/project_repository.dart';
import 'package:hive/hive.dart';

class HiveProjectRepository implements ProjectRepository {
  static String boxName = "crochet_project";
  late Box<ProjectModel> _box;

  static Future<void> register() async {
    Hive.registerAdapter(ProjectModelAdapter());
    await Hive.openBox<ProjectModel>(boxName);
  }

  HiveProjectRepository() {
    _box = Hive.box<ProjectModel>(boxName);
  }

  @override
  Future<bool> createProject(ProjectEntity project) async {
    var projectModel = ProjectModel(
      id: project.id,
      name: project.name,
      currentLine: project.currentLine,
      lines: project.lines,
    );

    await _box.put(project.id, projectModel);

    return true;
  }

  @override
  Future<bool> deleteProject(String projectId) async {
    await _box.delete(projectId);

    return true;
  }

  @override
  Future<List<ProjectEntity>> getAllProjects() async {
    var projects = _box.toMap();

    var result = <ProjectEntity>[];
    projects.forEach((key, value) {
      result.add(
        ProjectEntity.fromModel(
          value.id,
          value.name,
          value.currentLine,
          value.lines,
        ),
      );
    });

    return result;
  }

  @override
  Future<ProjectEntity?> getProjectById(String id) async {
    var project = _box.get(id);
    return project != null
        ? ProjectEntity.fromModel(
            project.id,
            project.name,
            project.currentLine,
            project.lines,
          )
        : null;
  }

  @override
  Future<bool> updateProject(ProjectEntity project) async {
    return await createProject(project);
  }
}
