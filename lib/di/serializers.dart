library serializers;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:todo_bloc/dto/todo_dto.dart';

part 'serializers.g.dart';

@SerializersFor(const [TodoDto])
final Serializers serializers = (_$serializers.toBuilder()
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(TodoDto)]),
          () => new ListBuilder<TodoDto>())
      ..addPlugin(new StandardJsonPlugin()))
    .build();
