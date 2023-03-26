import 'dart:collection';

import 'package:mockito/mockito.dart';

extension MultipleExpectations<T> on PostExpectation<T> {
  void thenAnswerInOrder(List<T> bodies) {
    final answers = Queue.of(bodies);
    thenAnswer((_) => answers.removeFirst());
  }
}
