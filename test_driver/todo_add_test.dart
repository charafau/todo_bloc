import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Having main screen', () {
    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test("Should add new todo", () async {
      await driver.tap(find.byType("FloatingActionButton"));
      await driver.waitFor(find.text("Add new todo"));

      await driver.tap(find.byType("TextFormField"));

      await driver.enterText('Buy milk');

      await driver.tap(find.text('ADD'));

      await driver.waitFor(find.text('Buy milk'));
    });
  });
}
