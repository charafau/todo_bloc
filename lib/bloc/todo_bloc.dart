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

  PublishSubject<Todo> addTodo = PublishSubject<Todo>();

  TodoBloc(this._todoRepository) {
    _todos = Observable.merge([
      fetchTodos.switchMap((_) => _getTodos()),
      addTodo.switchMap((Todo todo) => _addTodo(todo))
    ]);
  }

  Stream<Result<BuiltList<Todo>>> _getTodos() async* {
    yield Result.loading();

    try {
      yield* _todoRepository.getTodos().map((data) => Result.success(data));
    } catch (e) {
      yield Result.error(e.toString());
    }
  }

  Stream<Result<BuiltList<Todo>>> _addTodo(Todo todo) async* {
    try {
      yield* _todoRepository.saveTodo(todo).map((BuiltList<Todo> data) {
        return Result.success(data);
      });
    } catch (e) {
      yield Result.error(e.toString());
    }
  }
}
