import 'dart:async';

import 'package:built_collection/src/list.dart';
import 'package:todo_bloc/datasource/todo_datasource.dart';
import 'package:todo_bloc/dto/todo_dto.dart';
import 'package:todo_bloc/model/todo.dart';
import 'package:todo_bloc/repository/todo_repository.dart';
import 'package:rxdart/rxdart.dart';

class NetworkTodoRepository extends TodoRepository {
  final TodoDataSource _todoDataSource;

  NetworkTodoRepository(this._todoDataSource);

  @override
  Observable<BuiltList<Todo>> getTodos() =>
      Observable(_todoDataSource.getTodos().asStream()).map((data) {
        return BuiltList<Todo>(data.map((dto) => Todo.fromDto(dto)));
      });
}
