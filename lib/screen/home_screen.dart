import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:todo_bloc/bloc/todo_bloc.dart';
import 'package:todo_bloc/main.dart';
import 'package:todo_bloc/model/todo.dart';
import 'package:todo_bloc/utils/result.dart';
import 'package:todo_bloc/utils/status.dart';
import 'package:todo_bloc/di/service_locator.dart';
import 'package:todo_bloc/view/todo_view_item.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TodoBloc todoBloc = sl.get<TodoBloc>();
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: StreamBuilder<Result<BuiltList<Todo>>>(
        initialData: Result.loading(),
        stream: todoBloc.todos,
        builder: (context, AsyncSnapshot<Result<BuiltList<Todo>>> snapshot) {
          Result<BuiltList<Todo>> result = snapshot.data;
          switch (result.status) {
            case Status.SUCCESS:
              {
                return ListView.builder(
                  itemCount: result.data.length,
                  itemBuilder: (context, index) {
                    Todo currentItem = result.data[index];
                    return TodoViewItem(todo: currentItem);
                  },
                );
              }
            case Status.LOADING:
              {
                todoBloc.fetchTodos.add(null);
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            case Status.ERROR:
              {
                return Center(
                  child: Text(
                    'Error has occured:  ${result.message}',
                    style: TextStyle(color: Colors.red, fontSize: 16.0),
                  ),
                );
              }
          }
        },
      ),
    );
  }
}
