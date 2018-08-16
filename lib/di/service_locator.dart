import 'package:get_it/get_it.dart';
import 'package:todo_bloc/bloc/todo_bloc.dart';
import 'package:todo_bloc/datasource/in_memory_datasource.dart';
import 'package:todo_bloc/datasource/todo_datasource.dart';
import 'package:todo_bloc/repository/mock_todo_repository.dart';
import 'package:todo_bloc/repository/todo_repository.dart';

GetIt sl = new GetIt();

void setup() {
  sl.registerSingleton<TodoDataSource>(InMemoryDataSource());
  sl.registerSingleton<TodoRepository>(MockTodoRepository(sl.get<TodoDataSource>()));
  sl.registerSingleton<TodoBloc>(TodoBloc(sl.get<TodoRepository>()));
}
