import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testapp/home_screen.dart';
import 'package:testapp/home_screen.dart';
import 'package:testapp/user_model.dart';

void main() {
  testWidgets('Display list of users with title as name and subtitle as email', (tester) async {
    final users = [User(id: 1, name: 'Karthic', email: 'karthicjayaraj@gmail.com'), User(id: 2, name: 'nirmal', email: 'nirmal1234@gmail.com')];
    Future<List<User>> mockFetchUsers() async {
      return users;
    }

    await tester.pumpWidget(MaterialApp(
      home: HomeScreen(
        futureUsers: mockFetchUsers(),
      ),
    ));

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    await tester.pumpAndSettle(); // wait for the future to complete
    expect(find.byType(ListView), findsOneWidget);
    expect(find.byType(ListTile), findsNWidgets(2));

    for(final user in users) {
      expect(find.text(user.name), findsOneWidget);
      expect(find.text(user.email), findsOneWidget);
    }
  });
}
