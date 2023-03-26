import 'package:crochet_counter/core/domain/project/project_entity.dart';
import 'package:crochet_counter/core/domain/project/project_repository.dart';
import 'package:crochet_counter/core/domain/project/project_usecases.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'project_usecases_test.mocks.dart';

@GenerateMocks([ProjectRepository])
void main() {
  group("ProjectUseCases - createProject", () {
    test("should create a project", () async {
      var project = ProjectEntity("Lion");
      var repository = MockProjectRepository();
      var usecase = ProjectUseCases(repository);

      when(repository.createProject(any)).thenAnswer((_) async => true);

      final result = await usecase.createProject("Lion");

      expect(result, true);
    });
  });
}
