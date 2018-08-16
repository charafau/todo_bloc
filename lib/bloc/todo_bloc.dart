import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:rxdart/rxdart.dart';
import 'package:todo_bloc/model/todo.dart';
import 'package:todo_bloc/repository/todo_repository.dart';
import 'package:todo_bloc/utils/result.dart';

class TodoBloc {
  final TodoRepository _todoRepository;

  Stream<Result<BuiltList<Todo>>> _todos = Stream.empty();

  Stream<Result<BuiltList<Todo>>> get todos => _todos;

  PublishSubject<void> fetchTodos = PublishSubject<void>();

  TodoBloc(this._todoRepository) {
    _todos = fetchTodos.switchMap((_) => _getTodos());
  }

  Stream<Result<BuiltList<Todo>>> _getTodos() async* {
    yield Result.loading();

    try {
      yield* _todoRepository.getTodos().map((data) => Result.success(data));
    } catch (e) {
      yield Result.error(e.toString());
    }
  }
}
