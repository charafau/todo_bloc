import 'package:flutter/material.dart';
import 'package:todo_bloc/screen/add_screen.dart';

class ScreenNavigator {
  void openAddScreen(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => AddScreen()));
  }
}
