import 'package:crochet_counter/adapter/getx/project_manager/project_manager_controller.dart';
import 'package:crochet_counter/core/domain/project/project_usecases.dart';
import 'package:get/instance_manager.dart';

class ProjectManagerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProjectManagerController>(
        () => ProjectManagerController(Get.find<ProjectUseCases>()));
  }
}
