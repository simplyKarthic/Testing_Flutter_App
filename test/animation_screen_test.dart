import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testapp/animation_screen.dart';

void main() {
  testWidgets('animation screen test', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: AnimationScreen()));
    var containerFinder = find.byType(Container);
    expect(containerFinder, findsOneWidget);

    var animContainer = tester.widget<Container>(containerFinder); //this will contain the widget
    
    //Initial values test
    expect(animContainer.constraints!.minWidth, 50);
    expect(animContainer.constraints!.minHeight, 50);
    expect((animContainer.decoration as BoxDecoration).color, Colors.blue);
    expect((animContainer.decoration as BoxDecoration).borderRadius, BorderRadius.zero);

    await tester.pumpAndSettle();
    containerFinder = find.byType(Container);
    animContainer = tester.widget<Container>(containerFinder); //this will update the old widget

    //Final values test
    expect(animContainer.constraints!.minWidth, 200);
    expect(animContainer.constraints!.minHeight, 200);
    expect((animContainer.decoration as BoxDecoration).color, Colors.green);
    expect((animContainer.decoration as BoxDecoration).borderRadius, BorderRadius.circular(50));


  });
}
