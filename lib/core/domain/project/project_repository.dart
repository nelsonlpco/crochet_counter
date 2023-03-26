import 'package:crochet_counter/core/domain/project/project_entity.dart';

abstract class ProjectRepository {
  Future<bool> createProject(ProjectEntity project);
  Future<bool> updateProject(ProjectEntity project);
  Future<bool> deleteProject(String projectId);
  Future<List<ProjectEntity>> getAllProjects();
  Future<ProjectEntity?> getProjectById(String id);
}
