import 'package:Avatar/creation.dart';
import 'package:Avatar/edit_photo_screen.dart';
import 'package:Avatar/missions_screen.dart';
import 'package:Avatar/sklep/providers/cart.dart';
import 'package:Avatar/sklep/providers/orders.dart';
import 'package:Avatar/sklep/providers/products.dart';
import 'package:Avatar/store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:Avatar/main.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';


class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {

  TestWidgetsFlutterBinding.ensureInitialized();

  const MethodChannel channel = MethodChannel('plugins.flutter.io/path_provider');
  channel.setMockMethodCallHandler((MethodCall methodCall) async {
    return "test/tests_files";
  });

  testWidgets('Przycisk CREATE i przejście z main do pola tworzenia istnieją',
          (WidgetTester tester) async {
        final mockObserver = MockNavigatorObserver();
        await tester.pumpWidget(
          MaterialApp(
            home: Avatar(),
            navigatorObservers: [mockObserver],
          ),
        );

        expect(find.text('CREATE'), findsOneWidget);
        await tester.tap(find.text('CREATE'));
        await tester.pumpAndSettle();

        verify(mockObserver.didPush(any, any));
        expect(find.byType(Creation), findsOneWidget);

      });

  testWidgets('Przycisk MISSIONS i przejście z main do wyboru misji istnieją',
          (WidgetTester tester) async {
        final mockObserver = MockNavigatorObserver();
        await tester.pumpWidget(
          MaterialApp(
            home: Avatar(),
            navigatorObservers: [mockObserver],
          ),
        );

        expect(find.text('MISSIONS'), findsOneWidget);
        await tester.tap(find.text('MISSIONS'));
        await tester.pumpAndSettle();

        verify(mockObserver.didPush(any, any));
        expect(find.byType(MissionsScreen), findsOneWidget);
      });

  testWidgets('Przycisk EDIT PHOTO i przejście z main do edycji istnieją',
          (WidgetTester tester) async {
        final mockObserver = MockNavigatorObserver();
        await tester.pumpWidget(
          MaterialApp(
            home: Avatar(),
            navigatorObservers: [mockObserver],
          ),
        );

        expect(find.text('EDIT PHOTO'), findsOneWidget);
        await tester.tap(find.text('EDIT PHOTO'));
        await tester.pumpAndSettle();

        verify(mockObserver.didPush(any, any));
        expect(find.byType(EditPhotoScreen), findsOneWidget);

      });

  testWidgets('Przycisk STORE i przejście z main do sklepu istnieją',
          (WidgetTester tester) async {
        final mockObserver = MockNavigatorObserver();
        await tester.pumpWidget(
          MaterialApp(
            home: Avatar(),
            navigatorObservers: [mockObserver],
          ),
        );

        expect(find.text('STORE'), findsOneWidget);
        await tester.tap(find.text('STORE'));
        await tester.pumpAndSettle();

        verify(mockObserver.didPush(any, any));
        expect(find.byType(Store), findsOneWidget);

      });

  testWidgets('Pobieranie wartosci ze store',
          (WidgetTester tester) async {
            await tester.pumpWidget(MultiProvider(
              providers: [
                ChangeNotifierProvider.value(
                  value: Products(),
                ),
                ChangeNotifierProvider.value(
                  value: Cart(),
                ),
                ChangeNotifierProvider.value(
                  value: Orders(),
                ),
              ],
              child: Builder(
                builder: (_) => Store(),
              ),
            ),);
      });

}

