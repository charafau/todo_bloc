import 'package:flutter/material.dart';
import 'package:todo_bloc/bloc/todo_bloc.dart';
import 'package:todo_bloc/di/service_locator.dart';
import 'package:todo_bloc/model/todo.dart';

class AddScreen extends StatefulWidget {
  @override
  AddScreenState createState() {
    return new AddScreenState();
  }
}

class AddScreenState extends State<AddScreen> {
  final todoNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TodoBloc todoBloc = sl.get<TodoBloc>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Add new todo'),
        actions: <Widget>[
          FlatButton(
            child: Text('ADD'),
            onPressed: () {
              todoBloc.addTodo.add(Todo((b) => b
                ..name = todoNameController.text
                ..isChecked = false));
              Navigator.pop(context);
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          controller: todoNameController,
          decoration: InputDecoration(labelText: 'Todo name'),
        ),
      ),
    );
  }

  @override
  void dispose() {
    todoNameController.dispose();
    super.dispose();
  }
}
