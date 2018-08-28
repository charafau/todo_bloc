// This is a basic Flutter widget test.
// To perform an interaction with a widget in your test, use the WidgetTester utility that Flutter
// provides. For example, you can send tap and scroll gestures. You can also use WidgetTester to
// find child widgets in the widget tree, read text, and verify that the values of widget properties
// are correct.

import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rxdart/rxdart.dart';
import 'package:todo_bloc/bloc/todo_bloc.dart';
import 'package:todo_bloc/datasource/in_memory_datasource.dart';
import 'package:todo_bloc/datasource/todo_datasource.dart';
import 'package:todo_bloc/main.dart';
import 'package:todo_bloc/di/service_locator.dart';
import 'package:todo_bloc/model/todo.dart';
import 'package:todo_bloc/repository/todo_repository.dart';
import 'package:todo_bloc/utils/result.dart';

class MockTodoBloc extends Mock implements TodoBloc {}

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  group('Having Home Screen', () {
    MockNavigatorObserver observer;

    var bloc = MockTodoBloc();
    setUp(() {
      setup();
      sl.allowReassignment = true;

      sl.registerSingleton<TodoBloc>(bloc);
      observer = MockNavigatorObserver();

      when(bloc.fetchTodos).thenReturn(PublishSubject<void>());
    });

    testWidgets('Should show circular loading when status is loading',
        (WidgetTester tester) async {
      var publishSubject =
          BehaviorSubject<Result<BuiltList<Todo>>>(seedValue: Result.loading());
      when(bloc.todos).thenReturn(publishSubject);

      // Build our app and trigger a frame.
      await tester.pumpWidget(new MainApp());

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('Should show todo after loading', (WidgetTester tester) async {
      var publishSubject =
          BehaviorSubject<Result<BuiltList<Todo>>>(seedValue: Result.loading());
      when(bloc.todos).thenReturn(publishSubject);

      // Build our app and trigger a frame.
      await tester.pumpWidget(new MainApp());

      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      publishSubject.add(Result.success(BuiltList<Todo>([
        Todo((b) => b
          ..name = 'Todo1'
          ..isChecked = false)
      ])));

      await tester.pump();

      expect(find.text('Todo1'), findsOneWidget);
    });

    testWidgets('Should show error text when error status',
        (WidgetTester tester) async {
      var publishSubject =
          BehaviorSubject<Result<BuiltList<Todo>>>(seedValue: Result.loading());
      when(bloc.todos).thenReturn(publishSubject);

      // Build our app and trigger a frame.
      await tester.pumpWidget(new MainApp());

      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      publishSubject.add(Result.error("error"));

      await tester.pump();

      expect(find.text('Error has occured:  error'), findsOneWidget);
    });

    testWidgets('Should have FAB for add items', (WidgetTester tester) async {
      var publishSubject =
          BehaviorSubject<Result<BuiltList<Todo>>>(seedValue: Result.loading());
      when(bloc.todos).thenReturn(publishSubject);

      // Build our app and trigger a frame.
      await tester.pumpWidget(new MainApp());

      expect(find.byType(FloatingActionButton), findsOneWidget);
    });

    testWidgets('Should navigate to new screen when click FAB', (WidgetTester tester) async {
      var publishSubject =
      BehaviorSubject<Result<BuiltList<Todo>>>(seedValue: Result.loading());
      when(bloc.todos).thenReturn(publishSubject);

      // Build our app and trigger a frame.
      await tester.pumpWidget(new MainApp());

      await tester.tap(find.byType(FloatingActionButton));

      await tester.pumpAndSettle();

      expect(find.text('Add new todo'), findsOneWidget);
    });
  });
}
