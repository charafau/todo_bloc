import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:todo_bloc/datasource/firebase_todo_datasource.dart';
import 'package:todo_bloc/datasource/todo_datasource.dart';
import 'package:todo_bloc/dto/todo_dto.dart';

class MockFirebaseDatabase extends Mock implements FirebaseDatabase {}

class MockDatabaseReference extends Mock implements DatabaseReference {}

class MockDataSnapshot extends Mock implements DataSnapshot {}

main() {
  group('Having network data source', () {
    FirebaseDatabase firebaseDatabase;
    FirebaseTodoDataSource todoDataSource;
    DataSnapshot dataSnapshot;

    setUp(() {
      firebaseDatabase = MockFirebaseDatabase();
      dataSnapshot = MockDataSnapshot();
      todoDataSource = FirebaseTodoDataSource(firebaseDatabase);
    });

    test('it should fetch and transform to classes', () async {
      when(dataSnapshot.value).thenReturn([
        {'name': 'Make dinner', 'is_checked': false}
      ]);

      var mainReference = MockDatabaseReference();
      when(firebaseDatabase.reference()).thenReturn(mainReference);

      var todoReference = MockDatabaseReference();
      when(mainReference.child(FirebaseTodoDataSource.TODOS_COLLECTION))
          .thenReturn(todoReference);

      when(todoReference.once()).thenReturn(Future.value(dataSnapshot));

      var expected = BuiltList<TodoDto>([
        TodoDto((b) => b
          ..name = "Make dinner"
          ..isChecked = false),
      ]);

      BuiltList<TodoDto> todos = await todoDataSource.getTodos();

      expect(todos, expected);
    });
  });
}
