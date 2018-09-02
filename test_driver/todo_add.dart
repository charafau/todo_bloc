library home_screen_test;

import 'package:flutter/material.dart';
import 'package:flutter_driver/driver_extension.dart';
import 'package:todo_bloc/di/service_locator.dart';
import 'package:todo_bloc/main.dart';

main() {
  enableFlutterDriverExtension();
  setupMocks();
  runApp(new MainApp());

}
