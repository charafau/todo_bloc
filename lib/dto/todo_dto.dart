library todo;

import 'package:built_value/built_value.dart';

part 'todo_dto.g.dart';

abstract class TodoDto implements Built<TodoDto, TodoDtoBuilder> {
  TodoDto._();

  String get name;

  bool get isChecked;

  factory TodoDto([updates(TodoDtoBuilder b)]) = _$TodoDto;
}
