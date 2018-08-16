import 'package:flutter/material.dart';
import 'package:todo_bloc/di/service_locator.dart';
import 'package:todo_bloc/screen/home_screen.dart';

void main() {
  setup();
  runApp(new MainApp());
}

const title = 'Todo BLoC';

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: title,
        home: HomeScreen(),
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.lime[500],
          accentColor: Colors.deepOrangeAccent,
        ));
  }
}
