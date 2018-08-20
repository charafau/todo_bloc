import 'dart:async';

import 'package:built_collection/src/list.dart';
import 'package:todo_bloc/datasource/todo_datasource.dart';
import 'package:todo_bloc/dto/todo_dto.dart';

class InMemoryDataSource extends TodoDataSource {

  BuiltList<TodoDto> inMemoryCache = BuiltList<TodoDto>([
    TodoDto((b) => b
      ..name = "Todo 1"
      ..isChecked = false),
    TodoDto((b) => b
      ..name = "Todo 2"
      ..isChecked = false),
    TodoDto((b) => b
      ..name = "Todo 3"
      ..isChecked = false),
    TodoDto((b) => b
      ..name = "Todo 4"
      ..isChecked = false),
    TodoDto((b) => b
      ..name = "Todo 5"
      ..isChecked = false),
    TodoDto((b) => b
      ..name = "Todo 6"
      ..isChecked = false),
  ]);
  
  @override
  Future<BuiltList<TodoDto>> getTodos() {
    
    return Future.value(inMemoryCache);
  }

  @override
  Future<void> saveTodo(TodoDto dto) {
    
    inMemoryCache = inMemoryCache.rebuild((b) => b
      ..add(dto)
    );

    return;

  }
}
