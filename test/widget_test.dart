import 'package:Avatar/Missions_Screen.dart';
import 'package:Avatar/store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:Avatar/main.dart';
import 'package:mockito/mockito.dart';

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
        expect(find.byType(Missions_Screen), findsOneWidget);
      });

}

