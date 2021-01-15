// @Timeout(const Duration(seconds: 60))
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {


  group('Edit photo', () {

    final buttonGoToEdPh = find.byValueKey('Go to EdPh');
    final buttonShowPicker = find.byValueKey('Show Picker');
    final buttonPhFromPhLib = find.byValueKey('Photo from PhLib');
    final buttonSafePhoto = find.byValueKey('Safe Photo');
    final pathInEdPh = find.byValueKey('Path in EdPh');
    final imageInEdPh = find.byValueKey('Image in EdPh');

    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

/// During this test you should allow access to gallery and pick photo
    test('Getting photo path', () async {
      // Tap the buttons.
      print('During this test you should manually allow access to gallery and pick photo');
      await driver.tap(buttonGoToEdPh);
      await driver.tap(buttonShowPicker);
      await driver.tap(buttonPhFromPhLib);

      expect(pathInEdPh, isNotNull);
    });// timeout: Timeout.factor(2));

    test('Safe photo', () async {

      await driver.tap(buttonSafePhoto);

      expect(imageInEdPh, isNotNull);
    });

  });
}