import 'package:crochet_counter/core/domain/project/errors.dart';
import 'package:uuid/uuid.dart';

class ProjectEntity {
  late String _id;
  late String _name;
  int _currentLine = 1;
  late Map<int, int> _lines = <int, int>{};
  final List<String> _errors = <String>[];

  ProjectEntity(String name) {
    _id = const Uuid().v4();
    _validateName(name);
    _lines[currentLine] = 0;
  }

  factory ProjectEntity.fromModel(
    String id,
    String name,
    int currentLine,
    Map<int, int> lines,
  ) {
    var project = ProjectEntity(name);
    project._lines = lines;
    project._id = id;
    project._currentLine = currentLine;

    return project;
  }

  get isValid => _errors.isEmpty;

  get error => _errors.join(";");

  get lines => _lines;
  get name => _name;
  get id => _id;
  get currentLine => _currentLine;
  get point => _lines[currentLine];

  void addPoint() {
    if (_lines.containsKey(_currentLine)) {
      _lines[currentLine] = _lines[_currentLine]! + 1;
    }
  }

  void removePoint() {
    if (_lines[_currentLine]! > 0) {
      _lines[_currentLine] = _lines[_currentLine]! - 1;
    }
  }

  void nextLine() {
    _currentLine++;
    if (!_lines.containsKey(_currentLine)) {
      _lines[currentLine] = 0;
    }
  }

  void previousLine() {
    if (_currentLine > 1) {
      if (_lines[_currentLine] == 0) {
        _lines.remove(_currentLine);
      }
      _currentLine--;
    }
  }

  void _validateName(String value) {
    if (value.isEmpty) {
      _errors.add(errorInvalidName);
    }
    _name = value;
  }
}
