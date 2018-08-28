import 'package:firebase_database/firebase_database.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_bloc/bloc/todo_bloc.dart';
import 'package:todo_bloc/datasource/firebase_todo_datasource.dart';
import 'package:todo_bloc/datasource/in_memory_datasource.dart';
import 'package:todo_bloc/datasource/todo_datasource.dart';
import 'package:todo_bloc/repository/mock_todo_repository.dart';
import 'package:todo_bloc/repository/network_todo_repository.dart';
import 'package:todo_bloc/repository/todo_repository.dart';
import 'package:todo_bloc/utils/screen_navigator.dart';

GetIt sl = new GetIt();

void setup() {
  sl.registerFactory<ScreenNavigator>(() => ScreenNavigator());
  sl.registerSingleton<FirebaseDatabase>(FirebaseDatabase.instance);
  sl.registerSingleton<TodoDataSource>(
      FirebaseTodoDataSource(sl.get<FirebaseDatabase>()));
  sl.registerSingleton<TodoRepository>(
      NetworkTodoRepository(sl.get<TodoDataSource>()));
  sl.registerSingleton<TodoBloc>(TodoBloc(sl.get<TodoRepository>()));
}
void setupMocks() {
  sl.registerFactory<ScreenNavigator>(() => ScreenNavigator());
  sl.registerSingleton<FirebaseDatabase>(FirebaseDatabase.instance);
  sl.registerSingleton<TodoDataSource>(
      InMemoryDataSource());
  sl.registerSingleton<TodoRepository>(
      NetworkTodoRepository(sl.get<TodoDataSource>()));
  sl.registerSingleton<TodoBloc>(TodoBloc(sl.get<TodoRepository>()));
}
