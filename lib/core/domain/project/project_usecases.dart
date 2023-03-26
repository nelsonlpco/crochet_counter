import 'package:crochet_counter/core/domain/project/errors.dart';
import 'package:crochet_counter/core/domain/project/project_entity.dart';
import 'package:crochet_counter/core/domain/project/project_repository.dart';

class ProjectUseCases {
  late ProjectRepository _projectRepository;

  ProjectUseCases(ProjectRepository repository) {
    _projectRepository = repository;
  }

  Future<bool> createProject(String name) async {
    final project = ProjectEntity(name);
    if (!project.isValid) {
      throw Exception(project.error);
    }

    return await _projectRepository.createProject(project);
  }

  Future<bool> updateProject(ProjectEntity project) async {
    if (!project.isValid) {
      throw Exception(project.error);
    }

    return await _projectRepository.updateProject(project);
  }

  Future<bool> deleteProject(String projectId) async {
    final project = await _projectRepository.getProjectById(projectId);
    if (project == null) {
      throw Exception(errorProjectNotFound);
    }

    return await _projectRepository.deleteProject(projectId);
  }

  Future<ProjectEntity?> getProjectById(String projectId) async {
    return await _projectRepository.getProjectById(projectId);
  }

  Future<List<ProjectEntity>> getAllProjects() async {
    return await _projectRepository.getAllProjects();
  }
}
