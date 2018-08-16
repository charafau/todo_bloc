import 'package:built_collection/built_collection.dart';
import 'package:rxdart/rxdart.dart';
import 'package:todo_bloc/model/todo.dart';

abstract class TodoRepository {
  Observable<BuiltList<Todo>> getTodos();
}
