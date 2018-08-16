library home_screen_test;

import 'package:flutter_driver/driver_extension.dart';
import 'package:todo_bloc/main.dart' as app;

main() {

  enableFlutterDriverExtension();
  app.main();


//  group('Home Screen', () {
//    FlutterDriver driver;
//
//    setUpAll(() async {
//      driver = await FlutterDriver.connect();
//    });
//
//    tearDownAll(() async {
//      if (driver != null) {
//        driver.close();
//      }
//    });
//
//    test('should have right title', () async {
//      await driver.waitFor(find.text('Hi'));
//    });
//  });
}
