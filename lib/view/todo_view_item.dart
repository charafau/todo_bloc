import 'package:flutter/material.dart';
import 'package:todo_bloc/model/todo.dart';

class TodoViewItem extends StatefulWidget {
  final Todo todo;

  TodoViewItem({Key key, this.todo}) : super(key: key);

  @override
  TodoViewItemState createState() {
    return new TodoViewItemState();
  }
}

class TodoViewItemState extends State<TodoViewItem> {
  bool isChecked;

  @override
  void initState() {
    super.initState();
    isChecked = widget.todo.isChecked;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        _itemClick();
      },
      title: Text(widget.todo.name),
      trailing: Checkbox(
        value: isChecked,
        onChanged: (val) {
          _itemClick();
        },
      ),
    );
  }

  void _itemClick() {
    setState(() {
      isChecked = !isChecked;
    });
  }
}
