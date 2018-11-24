import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:test/test.dart';
import 'package:todo_bloc/di/serializers.dart';
import 'package:todo_bloc/dto/todo_dto.dart';


main() {
  group('all fields json', () {
    final String jsonString = '''
    [{
    "name": "Make dinner",
    "is_checked": false
    }]
    ''';

    test('should serialize todo json', () {
      final type = FullType(BuiltList, [FullType(TodoDto)]);
      BuiltList<TodoDto> todos =
          serializers.deserialize(json.decode(jsonString), specifiedType: type);

      expect(todos.length, 1);
      expect(todos[0].name, 'Make dinner');
      expect(todos[0].isChecked, false);

    });
  });
}
