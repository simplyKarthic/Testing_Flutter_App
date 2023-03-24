import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testapp/homePage.dart';

void main() {
  testWidgets('when button clicked text increases from 0 to 1', (tester) async {
    await tester.pumpWidget(//for building the widget
      const MaterialApp(
        home: MyHomePage(title: 'Counter App'),
      ),
    );
    final counter = find.text('0');
    expect(counter, findsOneWidget);

    final counter2 = find.text('1');
    expect(counter2, findsNothing);
    
    final incrementButton = find.byKey(const Key('increment_counter'));
    await tester.tap(incrementButton);

    await tester.pump(); // for rebuilding the widget
    expect(find.text('1'), findsOneWidget);// check increased to 1
    expect(find.text('0'), findsNothing);// check 0 is gone

    expect(find.byType(AppBar), findsOneWidget);

  });
}
