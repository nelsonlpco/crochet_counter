import 'package:crochet_counter/adapter/getx/project/project_controller.dart';
import 'package:crochet_counter/core/domain/project/project_entity.dart';
import 'package:crochet_counter/core/domain/project/project_usecases.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

import 'package:get/get.dart';
import 'package:mockito/mockito.dart';
import '../../../utils.dart';

import 'project_controller_test.mocks.dart';

@GenerateMocks([ProjectUseCases])
void main() {
  test('''
  Test state of the reactive projects across all of its lifecycles
 ''', () async {
    final useCase = MockProjectUseCases();
    final controller = ProjectController(useCase);

    final expected = [ProjectEntity("test")];

    when(useCase.getAllProjects()).thenAnswer((_) async => expected);

    await Get.put(controller);

    expect(controller.projects.length, 1);

    /// onClose was called
    Get.delete<ProjectController>();

    expect(controller.projects.length, 0);
  });

  test("should create a new project", () async {
    final useCase = MockProjectUseCases();
    final controller = ProjectController(useCase);

    final expected = [ProjectEntity("test")];

    when(useCase.getAllProjects()).thenAnswerInOrder([
      Future.value([ProjectEntity("test")]),
      Future.value([ProjectEntity("test"), ProjectEntity("lion")]),
    ]);

    asyncPut() async => Get.put(controller);
    await asyncPut();
    expect(controller.projects.length, 1);

    when(useCase.createProject("lion")).thenAnswer((_) async => true);

    controller.txtNameController.text = "lion";
    await controller.newProject();

    expect(controller.projects.length, 2);
    expect(controller.txtNameController.text, "");
  });
}
