import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:Avatar/DB_Reader.dart';



void main() {

  TestWidgetsFlutterBinding.ensureInitialized();

  const MethodChannel channel = MethodChannel('plugins.flutter.io/path_provider');
  channel.setMockMethodCallHandler((MethodCall methodCall) async {
    return "test/tests_files";
  });

  test('path_provider działa poprawnie', () async {

    expect(await DBReader().readCounter(), 1);
  });

  test('Pobieranie tytułu misji, otwieranie plików missions', () async {

    for (var i = 1; i < 4; i++) {
    expect(await DBReader().tytulMisji(i), isNotEmpty);
    }
  });


}

