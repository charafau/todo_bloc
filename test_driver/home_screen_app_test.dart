import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Having main screen', ()
  {
    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test("Should have Todo 1", () async {
      await driver.waitFor(find.text("Todo 1"));
    });

    test("Should navigate to next screen", () async {
      driver.tap(find.byType("FloatingActionButton"));
      await driver.waitFor(find.text("Add new todo"));
    });
  });
}