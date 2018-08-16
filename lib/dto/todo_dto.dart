library todo;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'todo_dto.g.dart';

abstract class TodoDto implements Built<TodoDto, TodoDtoBuilder> {

  static Serializer<TodoDto> get serializer => _$todoDtoSerializer;

  TodoDto._();

  @BuiltValueField(wireName: 'name')
  String get name;
  @BuiltValueField(wireName: 'is_checked')
  bool get isChecked;

  factory TodoDto([updates(TodoDtoBuilder b)]) = _$TodoDto;
}
