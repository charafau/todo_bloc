import 'dart:async';
import 'dart:convert';

import 'package:built_collection/src/list.dart';
import 'package:built_value/serializer.dart';
import 'package:todo_bloc/datasource/todo_datasource.dart';
import 'package:todo_bloc/di/serializers.dart';
import 'package:todo_bloc/dto/todo_dto.dart';
import 'package:firebase_database/firebase_database.dart';

class FirebaseTodoDataSource extends TodoDataSource {
  static final String TODOS_COLLECTION = "/todos";
  final FirebaseDatabase _firestoreInstance;
  final FullType todoListType = FullType(BuiltList, [FullType(TodoDto)]);

  FirebaseTodoDataSource(this._firestoreInstance);

  @override
  Future<BuiltList<TodoDto>> getTodos() {
    DatabaseReference databaseTodoReference = _getTodoReference();
    print('dupa');
    return databaseTodoReference.once().then((DataSnapshot snapshot) {
      var value = snapshot.value;
      if (value != null) {
        BuiltList<TodoDto> todos = serializers.deserialize(value,
            specifiedType: todoListType);
        return todos;
      } else {
        return BuiltList<TodoDto>([]);
      }
    });
  }

  DatabaseReference _getTodoReference() {
    var databaseTodoReference =
        _firestoreInstance.reference().child(TODOS_COLLECTION);
    return databaseTodoReference;
  }

  @override
  Future<void> saveTodo(TodoDto dto) {
    return getTodos().then((BuiltList<TodoDto> value) {

      var updatedList = value.rebuild((b) => b..add(dto));

      return _getTodoReference().set(serializers.serialize(updatedList,
          specifiedType: todoListType));

    });
  }
}
