import 'package:crochet_counter/adapter/getx/project/project_controller.dart';
import 'package:crochet_counter/adapter/repository/hive/hive_project_repository.dart';
import 'package:crochet_counter/adapter/repository/memory/memory_repository.dart';
import 'package:crochet_counter/core/domain/project/project_repository.dart';
import 'package:crochet_counter/core/domain/project/project_usecases.dart';
import 'package:get/instance_manager.dart';

class ProjectBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProjectRepository>(() => HiveProjectRepository());
    Get.lazyPut(() => ProjectUseCases(Get.find<ProjectRepository>()));
    Get.lazyPut(() => ProjectController(Get.find<ProjectUseCases>()));
  }
}
