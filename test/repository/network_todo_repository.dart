import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:todo_bloc/datasource/todo_datasource.dart';
import 'package:todo_bloc/dto/todo_dto.dart';
import 'package:todo_bloc/model/todo.dart';
import 'package:todo_bloc/repository/network_todo_repository.dart';

class MockDataSource extends Mock implements TodoDataSource {}

main() {
  group('Giving network todo repository', () {
    NetworkTodoRepository networkTodoRepository;
    TodoDataSource dataSource;

    setUp(() {
      dataSource = MockDataSource();
      networkTodoRepository = NetworkTodoRepository(dataSource);
    });

    test('should get response and serialize', () {
      when(dataSource.getTodos()).thenReturn(Future.value(BuiltList<TodoDto>([
        TodoDto((b) => b
          ..name = "Todo 1"
          ..isChecked = false),
      ])));

      var expected = BuiltList<Todo>([
        Todo((b) => b
          ..name = "Todo 1"
          ..isChecked = false),
      ]);

      expect(
        networkTodoRepository.getTodos(),
        emitsInOrder([emits((val) => val == expected)]),
      );
    });
  });
}
