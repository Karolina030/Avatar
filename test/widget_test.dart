import 'package:Avatar/Missions_Screen.dart';
import 'package:Avatar/sklep/providers/cart.dart';
import 'package:Avatar/sklep/providers/orders.dart';
import 'package:Avatar/sklep/providers/products.dart';
import 'package:Avatar/store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:Avatar/main.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

// void main() {
//   testWidgets('Counter increments smoke test', (WidgetTester tester) async {
//     // Build our app and trigger a frame.
//     await tester.pumpWidget(Avatar());
//
//     // Verify that our counter starts at 0.
//     // expect(find.text('0'), findsOneWidget);
//     // expect(find.text('1'), findsNothing);
//
//     // Tap the '+' icon and trigger a frame.
//   //   await tester.tap(find.byIcon(Icons.add));
//   //   await tester.pump();
//   //
//   //   // Verify that our counter has incremented.
//   //   expect(find.text('0'), findsNothing);
//   //   expect(find.text('1'), findsOneWidget);
//   // });
//
//     await tester.tap(find.byType(FlatButton));
//     await tester.pump();
//
//     // Verify that our counter has incremented.
//     expect(find.text('0'), findsNothing);
//     expect(find.text('1'), findsOneWidget);
//   });
// }

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

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

