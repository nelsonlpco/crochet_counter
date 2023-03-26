import 'package:crochet_counter/adapter/getx/project/project_controller.dart';
import 'package:crochet_counter/core/domain/project/project_entity.dart';
import 'package:crochet_counter/core/domain/project/project_usecases.dart';
import 'package:get/get.dart';

class ProjectManagerController extends GetxController {
  final ProjectUseCases useCases;
  late String projectId;
  late String projectName;
  var project = Rx<ProjectEntity?>(null);

  ProjectManagerController(this.useCases);

  @override
  Future<void> onInit() async {
    projectId = Get.parameters['id'] as String;
    projectName = Get.parameters['name'] as String;

    var result = await useCases.getProjectById(projectId);
    project.value = result;
    project.refresh();

    super.onInit();
  }

  void nextLine() async {
    project.value?.nextLine();
    project.refresh();
    await useCases.updateProject(project.value!);
  }

  void previousLine() async {
    project.value?.previousLine();
    project.refresh();
    await useCases.updateProject(project.value!);
  }

  void addPoint() async {
    project.value?.addPoint();
    project.refresh();
    await useCases.updateProject(project.value!);
  }

  void removePoint() async {
    project.value?.removePoint();
    project.refresh();
    await useCases.updateProject(project.value!);
  }

  void back() async {
    await Get.find<ProjectController>().fetchProjects();
    Get.back();
  }
}
