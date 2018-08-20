library todo;

import 'package:built_value/built_value.dart';
import 'package:todo_bloc/dto/todo_dto.dart';

part 'todo.g.dart';

abstract class Todo implements Built<Todo, TodoBuilder> {
  Todo._();

  String get name;

  bool get isChecked;

  factory Todo([updates(TodoBuilder b)]) = _$Todo;

  factory Todo.fromDto(TodoDto dto) => Todo((b) => b
    ..name = dto.name
    ..isChecked = dto.isChecked);

  TodoDto toDto() {
    return TodoDto((b) => b
      ..name = name
      ..isChecked = isChecked);
  }
}
