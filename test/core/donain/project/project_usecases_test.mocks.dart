// Mocks generated by Mockito 5.3.2 from annotations
// in crochet_counter/test/core/donain/project/project_usecases_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:crochet_counter/core/domain/project/project_entity.dart' as _i4;
import 'package:crochet_counter/core/domain/project/project_repository.dart'
    as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [ProjectRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockProjectRepository extends _i1.Mock implements _i2.ProjectRepository {
  MockProjectRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<bool> createProject(_i4.ProjectEntity? project) =>
      (super.noSuchMethod(
        Invocation.method(
          #createProject,
          [project],
        ),
        returnValue: _i3.Future<bool>.value(false),
      ) as _i3.Future<bool>);
  @override
  _i3.Future<bool> updateProject(_i4.ProjectEntity? project) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateProject,
          [project],
        ),
        returnValue: _i3.Future<bool>.value(false),
      ) as _i3.Future<bool>);
  @override
  _i3.Future<bool> deleteProject(String? projectId) => (super.noSuchMethod(
        Invocation.method(
          #deleteProject,
          [projectId],
        ),
        returnValue: _i3.Future<bool>.value(false),
      ) as _i3.Future<bool>);
  @override
  _i3.Future<List<_i4.ProjectEntity>> getAllProjects() => (super.noSuchMethod(
        Invocation.method(
          #getAllProjects,
          [],
        ),
        returnValue:
            _i3.Future<List<_i4.ProjectEntity>>.value(<_i4.ProjectEntity>[]),
      ) as _i3.Future<List<_i4.ProjectEntity>>);
  @override
  _i3.Future<_i4.ProjectEntity?> getProjectById(String? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getProjectById,
          [id],
        ),
        returnValue: _i3.Future<_i4.ProjectEntity?>.value(),
      ) as _i3.Future<_i4.ProjectEntity?>);
}
