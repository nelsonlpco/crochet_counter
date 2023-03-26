import 'package:crochet_counter/core/domain/project/project_entity.dart';
import 'package:crochet_counter/core/domain/project/project_repository.dart';

class ProjectMemoryRepository implements ProjectRepository {
  final Map<String, ProjectEntity> _data = <String, ProjectEntity>{};

  ProjectMemoryRepository() {
    final p1 = ProjectEntity("lion");
    final p2 = ProjectEntity("test");
    final p3 = ProjectEntity("show the ship");

    _data[p1.id] = p1;
    _data[p2.id] = p2;
    _data[p3.id] = p3;
  }

  @override
  Future<bool> createProject(ProjectEntity project) async {
    _data[project.id] = project;
    return true;
  }

  @override
  Future<bool> deleteProject(String projectId) async {
    if (_data.containsKey(projectId)) {
      _data.remove(projectId);
      return true;
    }

    return false;
  }

  @override
  Future<List<ProjectEntity>> getAllProjects() async {
    return _data.values.toList();
  }

  @override
  Future<ProjectEntity?> getProjectById(String id) async {
    if (_data.containsKey(id)) {
      return _data[id];
    }

    return null;
  }

  @override
  Future<bool> updateProject(ProjectEntity project) async {
    if (_data.containsKey(project.id)) {
      _data[project.id] = project;
      return true;
    }

    return false;
  }
}
