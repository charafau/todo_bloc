
import 'package:built_collection/src/list.dart';
import 'package:rxdart/rxdart.dart';
import 'package:test/test.dart';
import 'package:todo_bloc/bloc/todo_bloc.dart';
import 'package:todo_bloc/model/todo.dart';
import 'package:todo_bloc/repository/mock_todo_repository.dart';
import 'package:todo_bloc/repository/todo_repository.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_bloc/utils/result.dart';
import 'package:todo_bloc/utils/status.dart';

class MockRepo extends Mock implements MockTodoRepository {}

Matcher result(Status expected) =>
    predicate<Result>((result) => result.status == expected);

main() {
  group('todobloc', () {
    TodoRepository todoRepository;
    TodoBloc todoBloc;

    setUp(() {
      todoRepository = MockRepo();
      todoBloc = TodoBloc(todoRepository);
    });

    test('should return todos when call sink', () async {
      when(todoRepository.getTodos())
          .thenAnswer((_) => Observable.just(BuiltList<Todo>([
        Todo((b) => b
          ..name = "Todo 1"
          ..isChecked = false),
      ])));

      final Result<BuiltList<Todo>> expected = Result.success(BuiltList<Todo>([
        Todo((b) => b
          ..name = "Todo 1"
          ..isChecked = false),
      ]));

      expect(
        todoBloc.todos,
        emitsInOrder([
          result(Status.LOADING),
          emits((val) => val == expected)
        ]),
      );

      todoBloc.fetchTodos.add(null);
    });
  });
}
