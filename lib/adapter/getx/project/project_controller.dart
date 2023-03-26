import 'package:crochet_counter/core/domain/project/project_entity.dart';
import 'package:crochet_counter/core/domain/project/project_usecases.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProjectController extends GetxController {
  late ProjectUseCases _projectUseCases;
  late TextEditingController txtNameController = TextEditingController();

  ProjectController(ProjectUseCases projectUseCase) {
    _projectUseCases = projectUseCase;
  }

  var projects = <ProjectEntity>[].obs;

  @override
  Future<void> onInit() async {
    super.onInit();

    await fetchProjects();
  }

  @override
  void onClose() {
    projects.clear();
    super.onClose();
  }

  Future<void> newProject() async {
    await _projectUseCases.createProject(txtNameController.value.text);
    txtNameController.clear();
    await fetchProjects();
    Get.back();
  }

  Future<void> fetchProjects() async {
    final data = await _projectUseCases.getAllProjects();
    projects.value = data;
    projects.refresh();
  }

  void goToProject(String id, String name) {
    Get.toNamed("/project", parameters: {"id": id, "name": name});
  }

  void cancel() {
    txtNameController.clear();
    Get.back();
  }

  void delete(String id) async {
    await _projectUseCases.deleteProject(id);
    await fetchProjects();
  }
}
