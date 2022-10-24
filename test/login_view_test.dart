import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testing/views/login_view.dart';

void main() {
  testWidgets('Login view tests', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: LoginView(),
    ));
    expect(find.text('Отправить'), findsOneWidget);
    expect(find.byKey(Key('fieldEmail')), findsOneWidget);

    await tester.enterText(find.byKey(Key('fieldEmail')), 'test@test.com');
    expect(find.text('test@test.com'), findsOneWidget);
  });
}
