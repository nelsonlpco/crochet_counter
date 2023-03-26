import 'package:crochet_counter/core/domain/project/project_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:crochet_counter/core/domain/project/errors.dart';

void main() {
  group("ProjectEntity creation", () {
    test("should create valid project", () {
      var project = ProjectEntity("Lion");

      expect(project.isValid, true);
      expect(project.name, "Lion");
    });
    test("should create an invalid project when receive an empty name", () {
      var project = ProjectEntity("");

      expect(project.isValid, false);
      expect(project.error, errorInvalidName);
    });
  });

  group("ProjectEntity - add line", () {
    test("should add line", () {
      var project = ProjectEntity("lion");
      expect(project.currentLine, 1);
      expect(project.point, 0);
    });

    test("shoud be add line", () {
      var project = ProjectEntity("lion");
      project.nextLine();
      project.nextLine();

      expect(project.currentLine, 3);
      expect(project.point, 0);
    });

    test("should be remove line", () {
      var project = ProjectEntity("lion");
      project.nextLine();
      expect(project.currentLine, 2);
      project.previousLine();
      expect(project.currentLine, 1);
    });
  });

  group("should point", () {
    var project = ProjectEntity("lion");
    test("shoud be add point", () {
      project.nextLine();

      project.addPoint();
      project.addPoint();
      project.addPoint();

      expect(project.currentLine, 2);
      expect(project.point, 3);
    });

    test("should remove point", () {
      project.removePoint();
      expect(project.currentLine, 2);
      expect(project.point, 2);
    });

    test("should previous line", () {
      project.previousLine();
      expect(project.currentLine, 1);
      expect(project.point, 0);
    });

    test("should next line", () {
      project.nextLine();
      expect(project.currentLine, 2);
      expect(project.point, 2);
    });

    test("should first line", () {
      project.previousLine();
      project.previousLine();
      project.previousLine();
      project.previousLine();
      expect(project.currentLine, 1);
      expect(project.point, 0);
    });
  });
}
