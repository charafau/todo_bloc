import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:todo_bloc/dto/todo_dto.dart';

abstract class TodoDataSource {
  Future<BuiltList<TodoDto>> getTodos();
}
